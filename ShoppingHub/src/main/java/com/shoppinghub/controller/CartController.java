package com.shoppinghub.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppinghub.entity.CartItem;
import com.shoppinghub.entity.Category;
import com.shoppinghub.entity.ShoppingCart;
import com.shoppinghub.entity.UserBillingAddress;
import com.shoppinghub.entity.UserShippingAddress;
import com.shoppinghub.repository.CartRepository;
import com.shoppinghub.service.CartService;
import com.shoppinghub.service.CategoryService;
import com.shoppinghub.service.PlaceOrderService;
import com.shoppinghub.service.ShoppingCartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private CartRepository cartRepository;
	
	@Autowired
	private ShoppingCartService shoppingCartService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private PlaceOrderService placeOrderService;
	
	@GetMapping("/buynow/{id}")
	public ModelAndView buyNow(@PathVariable long id) {
		ModelAndView mv = new ModelAndView();
		CartItem cart = cartService.buyNow(id);
		if(cart != null) {
			
			mv.setViewName("redirect:/cart/address/"+cart.getId());
		}else
			mv.setViewName("redirect:/user/login-views");
		return mv;
	}
	
	@GetMapping("/address/{id}")
	public ModelAndView getDefaultAddress(@PathVariable long id) {
		ModelAndView mv = new ModelAndView();
		Optional<CartItem> optionalCart = cartRepository.findById(id);
		if(optionalCart != null && optionalCart.isPresent()) {
			CartItem cart = optionalCart.get();
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
			mv.addObject("cart",cart);
		}else {
			mv.setViewName("redirect:/user/login-views");
		}
		
		return mv;
	}
	
	@GetMapping("/addNewAddress")
	public ModelAndView addNewAddress() {
		ModelAndView mv = new ModelAndView("NewFile2");
		return mv;
	}
	
	@GetMapping("/addtocart/{id}")
	public ModelAndView addCart(@PathVariable long id) {
		ModelAndView mv = new ModelAndView();
		ShoppingCart cart= cartService.addToCart(id);
		if(cart != null) {
			System.out.println(cart.getId());
			mv.setViewName("redirect:/cart/showcart");
			mv.addObject("carts",cart.getCartItems());
			mv.addObject("total" , cart.getGrandTotal());
		}
		else
			mv.setViewName("redirect:/user/login-views");
		return mv;
	}
	
	@GetMapping("/removeitem/{id}")
	public ModelAndView removeQty(@PathVariable long id) {
		ModelAndView mv = new ModelAndView("redirect:/cart/showcart");
		ShoppingCart cart = cartService.removeQty(id);
		mv.addObject("carts" , cart.getCartItems());
		mv.addObject("total", cart.getGrandTotal());
		return mv;
	}
	
	@GetMapping("/deketecartitem/{id}")
	public ModelAndView deleteCartItem(@PathVariable long id) {
		ModelAndView mv = new ModelAndView("redirect:/cart/showcart");
		ShoppingCart cart = cartService.deleteCartItem(id);
		mv.addObject("carts" , cart.getCartItems());
		mv.addObject("total", cart.getGrandTotal());
		return mv;
	}
	
	@GetMapping("/showcart")
	public ModelAndView showCart() {
		ModelAndView mv = new ModelAndView();
		ShoppingCart shopCart = shoppingCartService.findCart();
		if(shopCart != null) {
			mv.setViewName("MyCart");
			mv.addObject("carts" , shopCart.getCartItems());
			mv.addObject("total" , shopCart.getGrandTotal());
		}else {
			List<Category> categorylist = categoryService.getAllCategory();
			 mv.addObject("categorylist" , categorylist);
			mv.setViewName("login");
		}
		return mv;
	}
}
