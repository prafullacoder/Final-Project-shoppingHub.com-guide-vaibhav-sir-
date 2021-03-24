package com.shoppinghub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppinghub.entity.Category;
import com.shoppinghub.entity.Product;
import com.shoppinghub.repository.CategoryRepository;
import com.shoppinghub.repository.ProductRepository;
import com.shoppinghub.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductRepository productRepo;
	
	@Autowired
	private CategoryRepository categoryRepo;
	
	@Override
	public List<Product> getAllProduct(){
		return productRepo.findAll();
	}
	

	@Override
	public List<Product> getProductByCategory(long id) {
		Category category = categoryRepo.findById(id).get();
		
		return productRepo.findByCategory(category);
	}
	
	public Product getProductById(long id) {
		
		return productRepo.findById(id).get();
		
		
	}

}
