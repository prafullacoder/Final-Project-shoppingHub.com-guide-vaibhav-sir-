package com.shoppinghub.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.ResponseEntity;

import com.shoppinghub.dto.OrderDTO;
import com.shoppinghub.dto.ShipmentTracker;
import com.shoppinghub.entity.Order;

public interface PlaceOrderService {

	HashMap<String,Object> findAddress();

	Order addOrderDetails(OrderDTO dto);

	List<Order> findOrders();

	Order findOrder(String no);

	ShipmentTracker trackOrder(String id);

	

}
