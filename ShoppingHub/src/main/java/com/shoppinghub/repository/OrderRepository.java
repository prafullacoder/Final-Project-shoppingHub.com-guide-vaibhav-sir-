package com.shoppinghub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.Order;
import com.shoppinghub.entity.User;

public interface OrderRepository extends JpaRepository<Order,Long>{

	Order findByOrderNo(String orderNo);

	List<Order> findByUser(User user);

}
