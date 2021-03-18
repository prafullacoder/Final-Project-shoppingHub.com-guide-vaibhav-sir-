package com.shoppinghub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.Order;

public interface OrderRepository extends JpaRepository<Order,Long>{

	Order findByOrderNo(String orderNo);

}
