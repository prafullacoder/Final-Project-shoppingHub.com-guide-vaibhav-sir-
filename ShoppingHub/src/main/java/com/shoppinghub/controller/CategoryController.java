package com.shoppinghub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppinghub.entity.Category;
import com.shoppinghub.service.CategoryService;

@Controller
@RequestMapping("/")
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/")
	public ModelAndView getAllCategory(){
		ModelAndView mv = new ModelAndView("home");
		 List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		 return mv;
	}
	
	
}

