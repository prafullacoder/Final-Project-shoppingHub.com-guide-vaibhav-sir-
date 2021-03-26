package com.shoppinghub.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoppinghub.dto.OrderDTO;
import com.shoppinghub.dto.Packages;
import com.shoppinghub.dto.PaytmDetails;
import com.shoppinghub.dto.PickupLocation;
import com.shoppinghub.dto.Request;
import com.shoppinghub.dto.Response;
import com.shoppinghub.dto.Shipment;
import com.shoppinghub.dto.ShipmentTracker;
import com.shoppinghub.entity.CartItem;
import com.shoppinghub.entity.Order;
import com.shoppinghub.entity.Payment;
import com.shoppinghub.entity.ShoppingCart;
import com.shoppinghub.entity.User;
import com.shoppinghub.entity.UserBillingAddress;
import com.shoppinghub.entity.UserShippingAddress;
import com.shoppinghub.repository.CartRepository;
import com.shoppinghub.repository.OrderRepository;
import com.shoppinghub.repository.PaymentRepository;
import com.shoppinghub.repository.ShoppingCartRepository;
import com.shoppinghub.repository.UserRepository;
import com.shoppinghub.service.CartService;
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
	private CartService cartService;
	
	@Autowired
	private CartRepository cartRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private ShoppingCartRepository shoppingCart;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private PaymentRepository paymentRepo;
	
	
	@GetMapping("/")
	public ModelAndView addressPage() {
		ModelAndView mv = new ModelAndView();
		Map<String,Object> map = placeOrderService.findAddress();
		List<UserShippingAddress> shippingAddressList = (List<UserShippingAddress>) map.get("shippingAddress");
		if(shippingAddressList != null && !shippingAddressList.isEmpty()) {
			mv.addObject("shippingAddress", shippingAddressList);
			mv.addObject("billingAddress",(List<UserBillingAddress>)map.get("billingAddress"));
			mv.setViewName("NewFile");
			
		}else {
			mv.addObject("q" , "0");
			mv.setViewName("NewFile2");
		}
		return mv;
	}
	
	@PostMapping("/insertDetail")
	public ModelAndView insertData(OrderDTO dto) {
		
		System.out.println(dto);
		Order order = placeOrderService.addOrderDetails(dto); 
		
		 ModelAndView modelAndView = new ModelAndView("redirect:" + paytmDetails.getPaytmUrl());
	       try { 
		 	TreeMap<String, String> parameters = new TreeMap<>();
	        paytmDetails.getDetails().forEach((k, v) -> parameters.put(k, v));
	        parameters.put("MOBILE_NO",order.getUser().getPhone());
	        parameters.put("EMAIL", order.getUser().getEmail());
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
        
        User user = order.getUser();
        
        if(user != null) {
        	
				session.setAttribute("userId", user.getId());
        }
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
                    List<CartItem> cartItemList =  cartRepo.findByOrder(order);
                    ShoppingCart cart=null;
                    if(cartItemList != null && !cartItemList.isEmpty())
                     cart= cartItemList.get(0).getShopCart();
                	for(CartItem cartItem : cartItemList) {
        				cartItem.setOrder(order);
        				cartItem.setShopCart(null);
        			}
                	cartRepo.saveAll(cartItemList);
                	if(cart != null) {
                	shoppingCart.delete(cart);
                	}
                    order.setOrderStatus("Order Placed");
                    String wayBill = getWayBill();
                    System.out.println(wayBill);
                   Response  res = createorderDelivery(wayBill , order);
                   	if(res.isSuccess() && res.getPackages() != null && res.getPackages().length>0) {
                   		Packages packages = res.getPackages()[0];
                   		if(packages.getStatus().equalsIgnoreCase("Success")) {
                   			order.setTrackingId(packages.getWaybill());
                   		}
                   	}
                  
                   
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
      
       
        mv.setViewName("redirect:/order/orderdetail/"+order.getOrderNo());
        
        return mv;
    }
	

	private Response createorderDelivery(String wayBill , Order order) {
			
		final String uri = "https://staging-express.delhivery.com/api/cmu/create.json";
	    RestTemplate restTemplate = new RestTemplate();
	    HttpHeaders headers = new HttpHeaders();
	    final String accessToken = "8e6534547d445c2d6f677562d07d396dd0fc974b";
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    headers.set("Authorization", "Token "+accessToken);
	    Request request = new Request();
	    Shipment shipment = new Shipment(order.getShipAdd().getStreet(), order.getUser().getPhone(), "Prepaid",order.getUser().getUsername(),order.getShipAdd().getZipcode(), wayBill);
	    List<Shipment> shipmentList = request.getShipments();
	    shipmentList.add(shipment);
	    PickupLocation pickUpLocation = new PickupLocation("ShoppingHub.com");
	    request.setPickupLocation(pickUpLocation);
	    ObjectMapper mapper = new ObjectMapper();
	    String json = null;
	    try {
	       json = mapper.writeValueAsString(request);
	      System.out.println("ResultingJSONstring = " + json);
	      //System.out.println(json);
	    } catch (JsonProcessingException e) {
	       e.printStackTrace();
	    }
	    String payload="format=json&data="+json;
	    //	    Response result = restTemplate.postForObject( uri, request, Response.class);
	    HttpEntity<String> entity = new HttpEntity<String>(payload,headers);
	      
	      Response result =  restTemplate.exchange(
	         uri, HttpMethod.POST, entity, Response.class).getBody();
	 
	    System.out.println(result);
		
		return result;
	}

	private String getWayBill() {
		
		final String uri = "http://localhost:8080/springrestexample/employees";
		 
	    //TODO: Autowire the RestTemplate in all the examples
	    RestTemplate restTemplate = new RestTemplate();
	    
	  //  HashMap<String,String> param = new HashMap<String,String>();
	  //  param.put("token" ,"8e6534547d445c2d6f677562d07d396dd0fc974b");
	    ResponseEntity<String> result=null;
	    try {
	     result = restTemplate.getForEntity("https://staging-express.delhivery.com/waybill/api/fetch/json/?token=8e6534547d445c2d6f677562d07d396dd0fc974b", String.class);
	    System.out.println("In Method "+result.getBody());
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		
		return result.getBody();
		
	}
	
	//////////////////////////////////////////////////////////////////////////////////////

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
	
	@GetMapping("/newfile/{id}")
	public ModelAndView address(@PathVariable long id) {
		ModelAndView mv = new ModelAndView("NewFile2");
		CartItem cart = cartRepo.findById(id).get();
		mv.addObject("cart",cart);
		return mv;
	}
	
	@GetMapping("/newfile")
	public ModelAndView newAddressPage() {
		ModelAndView mv = new ModelAndView("NewFile2");
		return mv;
	}
	
	@GetMapping("/orderlist")
	public ModelAndView orderList() {
		ModelAndView mv = new ModelAndView();
		List<Order> orders =  placeOrderService.findOrders();
		if(orders == null) {
			mv.setViewName("login");
		}else {
			mv.addObject("order" , orders);
			mv.setViewName("OrderList");
		}
		return mv;
	}
	
	@GetMapping("/orderdetail/{no}")
	public ModelAndView orderDetail(@PathVariable String no) {
		ModelAndView mv = new ModelAndView("OrderDetailPage");
		Order order = placeOrderService.findOrder(no);
		mv.addObject("orders" , order);
		return mv;
	}
	
	@GetMapping("/trackorder/{id}")
	public ModelAndView trackOrder(@PathVariable String id) {
		ModelAndView mv = new ModelAndView("OrderDetailPage");
		Order order = placeOrderService.findOrder(id);
		ShipmentTracker shipmentTrackList = placeOrderService.trackOrder(order.getTrackingId());
		
		mv.addObject("orders" , order);
		mv.addObject("q" , "1");
		mv.addObject("shipmentTrackLists" , shipmentTrackList.getShipmentData()[0]);
		return mv;
	}
	
}
