package com.shoppinghub.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.shoppinghub.entity.Category;
import com.shoppinghub.entity.User;
import com.shoppinghub.service.CategoryService;
import com.shoppinghub.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/register-views")
	public ModelAndView registerPage() {
		ModelAndView mv = new ModelAndView("register");
		 List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		return mv;
	}
	
	@GetMapping("/login-views")
	public ModelAndView loginPage() {
		ModelAndView mv = new ModelAndView("login");
		 List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		return mv;
	}
	
	
	@PostMapping("/createuser")
	public ModelAndView createUser(User user) {
		ModelAndView mv = new ModelAndView("register");
		 List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		String str = userService.createUser(user);
		mv.addObject("strs",str);
		mv.addObject("q","1");
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView checkLogin(User user,HttpServletRequest request) {
		request.setAttribute(
			      View.RESPONSE_STATUS_ATTRIBUTE, HttpStatus.TEMPORARY_REDIRECT);
		ModelAndView mv = new ModelAndView();
		 List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		String str = userService.login(user);
		if(str=="login successfull") {
		mv.setViewName("redirect:homepage");
		}else {
			mv.addObject("q" , 1);
			mv.setViewName("login");
		}
		
		return mv;
	}
	
	
	@PostMapping("/homepage")
	public ModelAndView getHomePage() {
		 ModelAndView mv = new ModelAndView("home");
		 List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout() {
		ModelAndView mv = new ModelAndView();
		List<Category> categorylist = categoryService.getAllCategory();
		mv.addObject("categorylist" , categorylist);
		userService.logout();
		mv.setViewName("redirect:login-views");
		return mv;
	}
	
	@GetMapping("/homepage")
	public ModelAndView homePage() {
		ModelAndView mv = new ModelAndView("home");
		 List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		return mv;
	}
}
