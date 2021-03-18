package com.shoppinghub.service;

import com.shoppinghub.entity.CartItem;
import com.shoppinghub.entity.Product;
import com.shoppinghub.entity.ShoppingCart;

public interface CartService {

	ShoppingCart addToCart(long id);

	ShoppingCart removeQty(long id);

	ShoppingCart deleteCartItem(long id);

	CartItem buyNow(long id);



}
