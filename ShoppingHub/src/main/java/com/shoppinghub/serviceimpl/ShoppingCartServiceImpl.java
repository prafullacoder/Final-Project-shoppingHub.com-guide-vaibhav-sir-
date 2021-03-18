package com.shoppinghub.serviceimpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppinghub.entity.ShoppingCart;
import com.shoppinghub.entity.User;
import com.shoppinghub.repository.ShoppingCartRepository;
import com.shoppinghub.service.ShoppingCartService;
import com.shoppinghub.service.UserService;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService{
	
	@Autowired
	private ShoppingCartRepository shoppingCartRepo;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private HttpSession session;

	@Override
	public ShoppingCart findCart() {
		
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
		
		return cart;
	}

	

}
