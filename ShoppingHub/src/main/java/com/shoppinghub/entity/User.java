package com.shoppinghub.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	private String username;
	private String password;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	private String email;
	private String phone;
	@Column(name = "user_role")
	private String userRole;
	
	@OneToOne(mappedBy ="user")
	@JsonIgnore
	@JsonBackReference
	private ShoppingCart shoppingCart;
	
	@OneToMany(mappedBy = "user")
	@JsonIgnore
	@JsonBackReference
	private List<Order> orders;
	
	@OneToMany(mappedBy="user")
	@JsonIgnore
	@JsonBackReference
	private List<UserShippingAddress> userShippingAddresses;
	
	@OneToMany(mappedBy = "user")
	@JsonIgnore
	@JsonBackReference
	private List<UserBillingAddress> userBillingAddress;
	
	@OneToMany(mappedBy = "user")
	@JsonIgnore
	@JsonBackReference
	private List<UserPayment> userPayment;
	
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String username, String password, String firstName, String lastName, String email, String phone,
			String userRole) {
		super();
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.phone = phone;
		this.userRole = userRole;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	public ShoppingCart getShoppingCart() {
		return shoppingCart;
	}
	public void setShoppingCart(ShoppingCart shoppingCart) {
		this.shoppingCart = shoppingCart;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public List<UserShippingAddress> getUserShippingAddresses() {
		return userShippingAddresses;
	}
	public void setUserShippingAddresses(List<UserShippingAddress> userShippingAddresses) {
		this.userShippingAddresses = userShippingAddresses;
	}
	public List<UserBillingAddress> getUserBillingAddress() {
		return userBillingAddress;
	}
	public void setUserBillingAddress(List<UserBillingAddress> userBillingAddress) {
		this.userBillingAddress = userBillingAddress;
	}
	public List<UserPayment> getUserPayment() {
		return userPayment;
	}
	public void setUserPayment(List<UserPayment> userPayment) {
		this.userPayment = userPayment;
	}
	
}
