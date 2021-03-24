package com.shoppinghub.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "orders")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private Date orderDate;
	private Date shippingDate;
	private String orderStatus;
	private double total;
	@Column(length = 15)
	private String orderNo;
	
	private String trackingId;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "userId")
	private User user;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "shippingAddId", referencedColumnName = "id")
	private ShippingAddress shipAdd;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "billingAddId", referencedColumnName = "id")
	private BillingAddress billAdd;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "paymentId", referencedColumnName = "id")
	private Payment payment;

	@OneToMany(mappedBy = "order")
	private List<CartItem> cartitem;

	public Order() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Order(Date orderDate, String orderStatus, double total, User user, ShippingAddress shipAdd,
			BillingAddress billAdd, String orderNo) {
		super();
		this.orderDate = orderDate;
		this.orderStatus = orderStatus;
		this.total = total;
		this.user = user;
		this.shipAdd = shipAdd;
		this.billAdd = billAdd;
		this.orderNo = orderNo;
	}

	public String getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getShippingDate() {
		return shippingDate;
	}

	public void setShippingDate(Date shippingDate) {
		this.shippingDate = shippingDate;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public ShippingAddress getShipAdd() {
		return shipAdd;
	}

	public void setShipAdd(ShippingAddress shipAdd) {
		this.shipAdd = shipAdd;
	}

	public BillingAddress getBillAdd() {
		return billAdd;
	}

	public void setBillAdd(BillingAddress billAdd) {
		this.billAdd = billAdd;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public List<CartItem> getCartitem() {
		return cartitem;
	}

	public void setCartitem(List<CartItem> cartitem) {
		this.cartitem = cartitem;
	}

	public String getTrackingId() {
		return trackingId;
	}

	public void setTrackingId(String trackingId) {
		this.trackingId = trackingId;
	}
	
	

}
