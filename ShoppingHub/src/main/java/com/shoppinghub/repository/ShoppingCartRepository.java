package com.shoppinghub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.ShoppingCart;

public interface ShoppingCartRepository extends JpaRepository<ShoppingCart,Long>{

}
