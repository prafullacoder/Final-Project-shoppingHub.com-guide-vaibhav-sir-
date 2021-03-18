package com.shoppinghub.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppinghub.dto.OrderDTO;
import com.shoppinghub.dto.PaytmDetails;
import com.shoppinghub.entity.Order;
import com.shoppinghub.entity.Payment;
import com.shoppinghub.entity.UserBillingAddress;
import com.shoppinghub.entity.UserShippingAddress;
import com.shoppinghub.repository.OrderRepository;
import com.shoppinghub.repository.PaymentRepository;
import com.shoppinghub.service.PaytmService;
import com.shoppinghub.service.PlaceOrderService;

@Controller
@RequestMapping("/order")
public class PlaceOrderController {
	
	@Autowired
	private PlaceOrderService placeOrderService;
	
	// for paytm details
	@Autowired
	private PaytmDetails paytmDetails;
	
	@Autowired
	private PaytmService paytmService;
	
	@Autowired
	private OrderRepository orderRepo;
	
	@Autowired
	private PaymentRepository paymentRepo;
	
	@Autowired
	private Environment env;
	
	@GetMapping("/")
	public ModelAndView addressPage() {
		ModelAndView mv = new ModelAndView();
		Map<String,Object> map = placeOrderService.findAddress();
		List<UserShippingAddress> shippingAddressList = (List<UserShippingAddress>) map.get("shippingAddress");
		if(shippingAddressList != null && !shippingAddressList.isEmpty()) {
			mv.addObject("shippingAddress", shippingAddressList);
			mv.addObject("billingAddress",(List<UserBillingAddress>)map.get("billingAddress"));
			mv.setViewName("DefaultAddressPage");
			
		}else {
			mv.addObject("q" , "0");
			mv.setViewName("AddressPage");
		}
		return mv;
	}
	
	@PostMapping("/insertDetail")
	public ModelAndView insertData(OrderDTO dto) {
		
		
		Order order = placeOrderService.addOrderDetails(dto); 
		
		 ModelAndView modelAndView = new ModelAndView("redirect:" + paytmDetails.getPaytmUrl());
	       try { 
		 	TreeMap<String, String> parameters = new TreeMap<>();
	        paytmDetails.getDetails().forEach((k, v) -> parameters.put(k, v));
	        parameters.put("MOBILE_NO", env.getProperty("paytm.mobile"));
	        parameters.put("EMAIL", env.getProperty("paytm.email"));
	        parameters.put("ORDER_ID", order.getOrderNo());
	        parameters.put("TXN_AMOUNT", String.valueOf(order.getTotal()));
	        parameters.put("CUST_ID", String.valueOf(order.getUser().getId()));
	        String checkSum = paytmService.getCheckSum(parameters);
	        parameters.put("CHECKSUMHASH", checkSum);
	        modelAndView.addAllObjects(parameters);
	       }catch(Exception e) {
	    	   e.printStackTrace();
	       }
	       
	        return modelAndView;  
	}
	
	@PostMapping(value = "/pgresponse")
    public ModelAndView getResponseRedirect(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
    	String bankName = null;
    	String bankTxnId = null;
    	String currency = null;
    	String gateWayName=null;
    	 String orderId=null;
    	 String paymentMode=null;
    	 String respMsg=null;
    	 String status=null;
    	 String txnAmount=null;
    	 String txDate=null;
    	 String txnId=null;
        Map<String, String[]> mapData = request.getParameterMap();
        System.out.println(mapData);
        TreeMap<String, String> parameters = new TreeMap<String, String>();
        String paytmChecksum = "";
        for (Entry<String, String[]> requestParamsEntry : mapData.entrySet()) {
            if ("CHECKSUMHASH".equalsIgnoreCase(requestParamsEntry.getKey())){
                paytmChecksum = requestParamsEntry.getValue()[0];
            } else {
            	parameters.put(requestParamsEntry.getKey(), requestParamsEntry.getValue()[0]);

            	if("BANKNAME".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		bankName =  requestParamsEntry.getValue()[0];
            	}
            	else if("BANKTXNID".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		bankTxnId =  requestParamsEntry.getValue()[0];
            	}
            	else if("CURRENCY".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		currency = requestParamsEntry.getValue()[0];
            	}
            	else if("GATEWAYNAME".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		gateWayName = requestParamsEntry.getValue()[0];
            	}
            	else if("ORDERID".equalsIgnoreCase(requestParamsEntry.getKey())){
            		orderId = requestParamsEntry.getValue()[0];
            	}
            	else if("PAYMENTMODE".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		paymentMode = requestParamsEntry.getValue()[0];
            	}
            	else if("RESPMSG".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		respMsg = requestParamsEntry.getValue()[0];
            	}
            	else if("STATUS".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		status = requestParamsEntry.getValue()[0];
            	}
            	else  if("TXNDATE".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		txDate = requestParamsEntry.getValue()[0];
            	}
            	else if("TXNID".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		txnId = requestParamsEntry.getValue()[0];
            	}
            	else if("PAYMENTMODE".equalsIgnoreCase(requestParamsEntry.getKey())){
            		paymentMode = requestParamsEntry.getValue()[0];
            	}
            	else if("TXNAMOUNT".equalsIgnoreCase(requestParamsEntry.getKey())) {
            		txnAmount = requestParamsEntry.getValue()[0];
            	}
            }
        }
       
        String result;
        Payment payment = new Payment( bankName, bankTxnId, currency, gateWayName, orderId,
    			 paymentMode,respMsg, status, txnAmount,  txDate, txnId);
        Order order = orderRepo.findByOrderNo(orderId);
        
        payment.setOrder(order);
     
        boolean isValideChecksum = false;
        System.out.println("RESULT : "+parameters.toString());
        try {
            isValideChecksum = paytmService.validateCheckSum(parameters, paytmChecksum);
            if (isValideChecksum && parameters.containsKey("RESPCODE")) {
            	paymentRepo.save(payment);
            	 order.setPayment(payment);
                if (parameters.get("RESPCODE").equals("01")) {
                    result = "Payment Successful";
                    order.setOrderStatus("Order Placed");
                    
                } else {
                    result = "Payment Failed";
                }
                orderRepo.save(order);
            } else {
                result = "Checksum mismatched";
            }
        } catch (Exception e) {
            result = e.toString();
        }
        
        mv.addObject("result",result);
        parameters.remove("CHECKSUMHASH");
        mv.addObject("orders",order);
        mv.setViewName("OrderDetailPage");
        return mv;
    }
	
	
	
	

	@GetMapping("/addresspage")
	public ModelAndView atmCardPage() {
		
		ModelAndView mv = new ModelAndView("AddressPage");
		mv.addObject("q" , "0");
		return mv;
	}
	
	@GetMapping("/defaultaddresspage")
	public ModelAndView addInfo() {
		
		ModelAndView mv = new ModelAndView("OrderDetailPage");
		
		return mv;
	}
	
}
