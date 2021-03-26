package com.shoppinghub.serviceimpl;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.shoppinghub.dto.OrderDTO;
import com.shoppinghub.dto.ShipmentTracker;
import com.shoppinghub.entity.BillingAddress;
import com.shoppinghub.entity.CartItem;
import com.shoppinghub.entity.Order;
import com.shoppinghub.entity.ShippingAddress;
import com.shoppinghub.entity.ShoppingCart;
import com.shoppinghub.entity.User;
import com.shoppinghub.entity.UserBillingAddress;
import com.shoppinghub.entity.UserShippingAddress;
import com.shoppinghub.repository.BillingAddressRepository;
import com.shoppinghub.repository.CartRepository;
import com.shoppinghub.repository.OrderRepository;
import com.shoppinghub.repository.ShippingAddressRepository;
import com.shoppinghub.repository.ShoppingCartRepository;
import com.shoppinghub.repository.UserBillingAddressRepository;
import com.shoppinghub.repository.UserShippingAddressRepository;
import com.shoppinghub.service.PlaceOrderService;
import com.shoppinghub.service.UserService;
import com.shoppinghub.util.CommonUtils;

@Service
public class PlaceOrderServiceImpl implements PlaceOrderService{
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ShippingAddressRepository shippingAddRepo;
	
	@Autowired
	private BillingAddressRepository billingAddRepo;
	
	@Autowired
	private UserBillingAddressRepository userBillingAddressRepository;
	
	@Autowired
	private UserShippingAddressRepository userShippingAddressRepository;
	
	@Autowired
	private CartRepository cartRepo;
	
	@Autowired
	private OrderRepository orderRepo;
	
	@Autowired
	private ShoppingCartRepository shoppingCart;

	@Override
	public HashMap<String,Object> findAddress() {
	
		long userId = (long) session.getAttribute("userId");
		User user = userService.findById(userId);
		List<UserBillingAddress> billingAddressList= userBillingAddressRepository.findByUser(user);
		List<UserShippingAddress> shippingAddressList = userShippingAddressRepository.findByUser(user);
		HashMap<String,Object> map = new HashMap<>();
		map.put("billingAddress", billingAddressList);
		map.put("shippingAddress", shippingAddressList);
		return map;
	}

	@Override
	public  Order addOrderDetails(OrderDTO dto) {
		long userId = (long) session.getAttribute("userId");
		User user = userService.findById(userId);
		UserShippingAddress userShippingAddr = null;
		UserBillingAddress userBillingAddr = null;
		ShippingAddress shippingAdd = null;
		BillingAddress billingAdd = null;
		if(dto.getBillingAddressid() != 0 && dto.getShippingAddressid() != 0) {
			userShippingAddr = userShippingAddressRepository.findById(dto.getShippingAddressid()).get();
			userBillingAddr =  userBillingAddressRepository.findById(dto.getBillingAddressid()).get();
			shippingAdd = new ShippingAddress(userShippingAddr.getStreet(),userShippingAddr.getCity(),userShippingAddr.getState(),userShippingAddr.getCountry(),userShippingAddr.getZipcode());
			billingAdd = new BillingAddress(userBillingAddr.getStreet(),userBillingAddr.getCity(),userBillingAddr.getState(),userBillingAddr.getCountry(),userBillingAddr.getZipcode());
		}else {
			shippingAdd = new ShippingAddress(dto.getShippingStreet(),dto.getShippingCity(),dto.getShippingState(),dto.getShippingCountry(),dto.getShippingZipcode());
			userShippingAddr = new UserShippingAddress(dto.getShippingStreet(),dto.getShippingCity(),dto.getShippingState(),dto.getShippingCountry(),dto.getShippingZipcode());
			if(dto.getIsBillingAddressDifferent() !=null) {
				billingAdd = new BillingAddress(dto.getBillingStreet(),dto.getBillingCity(),dto.getBillingState(),dto.getBillingCountry(),dto.getBillingZipcode());
			}else {
				billingAdd = new BillingAddress(dto.getShippingStreet(),dto.getShippingCity(),dto.getShippingState(),dto.getShippingCountry(),dto.getShippingZipcode());
			}
			userBillingAddr = new UserBillingAddress(billingAdd.getStreet(),billingAdd.getCity(),billingAdd.getState(),billingAdd.getCountry(),billingAdd.getZipcode());
			userShippingAddr.setUser(user);
			userBillingAddr.setUser(user);
			userBillingAddressRepository.save(userBillingAddr);
			userShippingAddressRepository.save(userShippingAddr);
		}
		shippingAddRepo.save(shippingAdd);
		billingAddRepo.save(billingAdd);
		return placeOrder(user,shippingAdd,billingAdd, dto.getCartItemId());
		
		
	}
	
	public Order placeOrder(User user, ShippingAddress shippAdd , BillingAddress billAdd,String cartItemId) {
		
		long id = CommonUtils.getID();
		String orderId = "NM" + id;
		
		ShoppingCart cart = user.getShoppingCart();
		Order order = null;
		 if(cartItemId != null && !cartItemId.isEmpty()) {
				CartItem cartItem = cartRepo.findById(Long.valueOf(cartItemId)).get();
				 order = new Order(new Date() ,"Order Pending" , cartItem.getTotal()  , user , shippAdd , billAdd, orderId );
				orderRepo.save(order);
				cartItem.setOrder(order);
				cartRepo.save(cartItem);
			}
		 else if(cart != null) {
			 order = new Order(new Date() ,"Order Pending" , cart.getGrandTotal() , user , shippAdd , billAdd, orderId );
			List<CartItem> cartItems =  cart.getCartItems();
			for(CartItem cartItem : cartItems) {
				cartItem.setOrder(order);
//				//cartRepo.save(cartItem);
			}
//			order.setCartitem(cartItems);
			orderRepo.save(order);
			cartRepo.saveAll(cartItems);
		}
		
		
		return order;
	}

	@Override
	public List<Order> findOrders() {
		if(session.getAttribute("userId") == null) {
			return null;
		}
		long userId = (long) session.getAttribute("userId");
		User user = userService.findById(userId);
		return orderRepo.findByUser(user);
		
	}

	@Override
	public Order findOrder(String no) {

		return orderRepo.findByOrderNo(no);
	}

	@Override
	public ShipmentTracker trackOrder(String id) {
		
		
		return getTrackingDetails(id);
		
		
	}

	private ShipmentTracker getTrackingDetails(String trackingId) {

		final String uri = "https://staging-express.delhivery.com/api/v1/packages/json/?waybill="+trackingId+"&token=8e6534547d445c2d6f677562d07d396dd0fc974b";
		 
	    //TODO: Autowire the RestTemplate in all the examples
	    RestTemplate restTemplate = new RestTemplate();
	    
	  //  HashMap<String,String> param = new HashMap<String,String>();
	  //  param.put("token" ,"8e6534547d445c2d6f677562d07d396dd0fc974b");
	    ResponseEntity<ShipmentTracker> result=null;
	    try {
	     result = restTemplate.getForEntity(uri, ShipmentTracker.class);
	    System.out.println("In Method "+result.getBody());
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
		System.out.println(result);
		return result.getBody();
		
		
	}
}
