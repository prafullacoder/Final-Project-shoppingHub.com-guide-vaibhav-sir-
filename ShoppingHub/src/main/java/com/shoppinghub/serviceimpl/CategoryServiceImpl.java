package com.shoppinghub.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppinghub.entity.Category;
import com.shoppinghub.repository.CategoryRepository;
import com.shoppinghub.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
		
	@Autowired
		CategoryRepository categoryRepo;
	
	@Override
	public List<Category> getAllCategory() {
			
		return categoryRepo.findAll();
	}

}
