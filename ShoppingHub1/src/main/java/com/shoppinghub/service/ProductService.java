package com.shoppinghub.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoppinghub.entity.Product;


public interface ProductService {
	
	
	public List<Product> getAllProduct();

	public List<Product> getProductByCategory(long id);

	public Product getProductById(long id);
}
