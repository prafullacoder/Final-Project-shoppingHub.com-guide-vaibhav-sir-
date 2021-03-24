package com.shoppinghub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shoppinghub.entity.CartItem;
import com.shoppinghub.entity.Order;
import com.shoppinghub.entity.Product;

@Repository
public interface CartRepository extends JpaRepository<CartItem, Long>{
	
	CartItem findByProduct(Product p);

	List<CartItem> findByOrder(Order order);

}
