package com.shoppinghub.serviceimpl;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppinghub.entity.CartItem;
import com.shoppinghub.entity.Product;
import com.shoppinghub.entity.ShoppingCart;
import com.shoppinghub.entity.User;
import com.shoppinghub.repository.CartRepository;
import com.shoppinghub.repository.ShoppingCartRepository;
import com.shoppinghub.repository.UserRepository;
import com.shoppinghub.service.CartService;
import com.shoppinghub.service.ProductService;
import com.shoppinghub.service.UserService;
@Service
public class CartServiceImpl implements CartService{
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private CartRepository cartRepo;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private ShoppingCartRepository shoppingCartRepo;
	

	@Override
	public ShoppingCart addToCart(long id) {
		
		Product item = productService.getProductById(id);
		
		if(session.getAttribute("userId") == null) {
			return null;
		}
		long userId = (long) session.getAttribute("userId");
		User user = userService.findById(userId);
		ShoppingCart cart =  user.getShoppingCart();
		if(cart == null) {
			cart = new ShoppingCart();
			cart.setUser(user);
		}
	
		List<CartItem> cartItemList = cart.getCartItems();
		if(cartItemList == null) {
			 cartItemList = new ArrayList<>();
		}
		List<CartItem> alreadyCartItemList = cartItemList.stream().filter((cartItem)->cartItem.getProduct().equals(item)).collect(Collectors.toList());
		CartItem cartItem= null;
		if(alreadyCartItemList != null && !alreadyCartItemList.isEmpty()) {
			cartItem = alreadyCartItemList.get(0);
			int index = cartItemList.indexOf(cartItem);
			cartItem = cartItemList.get(index);
			cartItem.setQty(cartItem.getQty() + 1);
			cartItem.setTotal(cartItem.getQty() * item.getSellingPrice());
			cartRepo.save(cartItem);
		}else {
			cartItem = new CartItem();
			cartItem.setProduct(item);
			cartItem.setQty(1);
			cartItem.setShopCart(cart);
			cartItem.setTotal(cartItem.getQty() * item.getSellingPrice());
			cartRepo.save(cartItem);
			cartItemList.add(cartItem);
		}
		

		double grantTotal = 0;
		for(CartItem c : cartItemList) {
			grantTotal+=c.getTotal();
			//cartRepo.save(c);
		}
		cart.setGrandTotal(grantTotal);
		cart.setCartItems(cartItemList);
		shoppingCartRepo.save(cart);
		user.setShoppingCart(cart);
		userRepo.save(user);
		return cart;
	}


	@Override
	public ShoppingCart removeQty(long id) {
		CartItem cartItem = cartRepo.findById(id).get();
		cartItem.setQty(cartItem.getQty()-1);
		cartItem.setTotal(cartItem.getQty() * cartItem.getProduct().getSellingPrice());
		cartRepo.save(cartItem);
		ShoppingCart cart = cartItem.getShopCart();
		List<CartItem> cartItemList = cart.getCartItems();
		
		double grantTotal = 0;
		for(CartItem c : cartItemList) {
			grantTotal+=c.getTotal();
			//cartRepo.save(c);
		}
		cart.setGrandTotal(grantTotal);
		cart.setCartItems(cartItemList);
		shoppingCartRepo.save(cart);
		
		return cart;
	}
	
	@Override
	public ShoppingCart deleteCartItem(long id) {
		CartItem cartItem = cartRepo.findById(id).get();
		
		ShoppingCart cart = cartItem.getShopCart();
		List<CartItem> cartItemList = cart.getCartItems();
		int index = cartItemList.indexOf(cartItem);
		cartItemList.remove(index);
		cartItem.setProduct(null);
		cartItem.setShopCart(null);
		cartRepo.delete(cartItem);
		
		double grantTotal = 0;
		for(CartItem c : cartItemList) {
			grantTotal+=c.getTotal();
			//cartRepo.save(c);
		}
		cart.setGrandTotal(grantTotal);
		cart.setCartItems(cartItemList);
		shoppingCartRepo.save(cart);
		return cart;
	}


	@Override
	public CartItem buyNow(long id) {
		if(session.getAttribute("userId") == null) {
			return null;
		}
		Product item = productService.getProductById(id);
		
		CartItem cartItem = new CartItem();
		cartItem.setProduct(item);
		cartItem.setQty(1);
		cartItem.setTotal(cartItem.getQty() * item.getSellingPrice());
		cartItem = cartRepo.save(cartItem);
		return cartItem;
	}
	

}
