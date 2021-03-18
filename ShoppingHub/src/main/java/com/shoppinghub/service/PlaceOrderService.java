package com.shoppinghub.service;

import java.util.HashMap;

import com.shoppinghub.dto.OrderDTO;
import com.shoppinghub.entity.Order;

public interface PlaceOrderService {

	HashMap<String,Object> findAddress();

	Order addOrderDetails(OrderDTO dto);

	

}
