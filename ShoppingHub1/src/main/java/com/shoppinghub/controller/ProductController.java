package com.shoppinghub.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shoppinghub.entity.Category;
import com.shoppinghub.entity.Product;
import com.shoppinghub.service.CategoryService;
import com.shoppinghub.service.ProductService;


@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	private ProductService productService;	//ProductService productService = new ProductServiceImpl();
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/getallproduct")
	public List<Product> getAllProduct(){
		return productService.getAllProduct();
	}
	
	@GetMapping("/getcategorywiseproduct/{id}")
	public ModelAndView getProductByCategory(@PathVariable long id){
		ModelAndView mv = new ModelAndView("productList");
		List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		List<Product> list = productService.getProductByCategory(id);
		mv.addObject("productList" , list);
		return mv;
	}
	
	@GetMapping("/description/{id}")
	public ModelAndView descriptionPage(@PathVariable long id) {
		ModelAndView mv = new ModelAndView("DescriptionPage");
		List<Category> categorylist = categoryService.getAllCategory();
		 mv.addObject("categorylist" , categorylist);
		Product item =  productService.getProductById(id);
		mv.addObject("items" , item);
		return mv;
	}
	
	@GetMapping("/showsingleproduct/{id}")
	public ModelAndView getProductById(@PathVariable long id) {
		ModelAndView mv = new ModelAndView("shoppingCart");
		Product item =  productService.getProductById(id);
		mv.addObject("item" , item);
		return mv;
	}
	
	@GetMapping("/list")
	public ModelAndView list() {
		ModelAndView mv = new ModelAndView("productList");
		return mv;
	}
}
