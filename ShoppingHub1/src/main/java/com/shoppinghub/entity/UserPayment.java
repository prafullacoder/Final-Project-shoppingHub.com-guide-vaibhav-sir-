package com.shoppinghub.entity;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserPayment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String cardNumber;
	private String expDate;
	private String holderName;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="user_id")
	private User user;
	
	public UserPayment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public UserPayment(String cardNumber, String expDate, String holderName) {
		super();
		this.cardNumber = cardNumber;
		this.expDate = expDate;
		this.holderName = holderName;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getExpDate() {
		return expDate;
	}
	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}
	public String getHolderName() {
		return holderName;
	}
	public void setHolderName(String holderName) {
		this.holderName = holderName;
	}
	
}
