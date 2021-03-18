package com.shoppinghub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shoppinghub.entity.Category;
import com.shoppinghub.entity.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long>{

	public List<Product> findByCategory(Category category);

	

}
