package com.shoppinghub.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class CartItem {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private int qty;
	private double total;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "shoppingCartId")
	@JsonIgnore
	private ShoppingCart shopCart;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "productId", nullable = false)
	private Product product;

	@ManyToOne(cascade = CascadeType.ALL)
	@JsonIgnore
	@JoinColumn(name = "order_id")
	private Order order;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double d) {
		this.total = d;
	}

	public ShoppingCart getShopCart() {
		return shopCart;
	}

	public void setShopCart(ShoppingCart shopCart) {
		this.shopCart = shopCart;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	

}

