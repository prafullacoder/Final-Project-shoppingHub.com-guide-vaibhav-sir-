/**
 * 
 */
package com.shoppinghub.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String productName;
	private double mrp;
	private double sellingPrice;
	private String description;
	private int instockNumber;
	private int discount;
	private String image;
	

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="categoryId")
	//@JsonBackReference
	private Category category;
	
	@OneToMany(mappedBy = "product")
	@JsonBackReference
	private List<CartItem> cartItem;
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String productName, double mrp, double sellingPrice, String description,
			int instockNumber, int discount) {
		super();
		this.productName = productName;
		this.mrp = mrp;
		this.sellingPrice = sellingPrice;
		this.description = description;
		this.instockNumber = instockNumber;
		this.discount = discount;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public double getMrp() {
		return mrp;
	}
	public void setMrp(double mrp) {
		this.mrp = mrp;
	}
	public double getSellingPrice() {
		return sellingPrice;
	}
	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getInstockNumber() {
		return instockNumber;
	}
	public void setInstockNumber(int instockNumber) {
		this.instockNumber = instockNumber;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<CartItem> getCartItem() {
		return cartItem;
	}
	public void setCartItem(List<CartItem> cartItem) {
		this.cartItem = cartItem;
	}

	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	}
