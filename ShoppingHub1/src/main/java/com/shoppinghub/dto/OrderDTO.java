package com.shoppinghub.dto;

import javax.persistence.Entity;
import javax.persistence.Id;

public class OrderDTO {
	//BillingAddress
	private String billingStreet;
	private String billingCity;
	private String billingState;
	private String billingCountry;
	private String billingZipcode;
	
	private long billingAddressid;
	
	//shippingAddress
	
	private String shippingStreet;
	private String shippingCity;
	private String shippingState;
	private String shippingCountry;
	private String shippingZipcode;
	private long shippingAddressid;
	
	private boolean isBillingAddressDifferent;
	
	private String cartItemId;
	public String getBillingStreet() {
		return billingStreet;
	}
	public void setBillingStreet(String billingStreet) {
		this.billingStreet = billingStreet;
	}
	public String getBillingCity() {
		return billingCity;
	}
	public void setBillingCity(String billingCity) {
		this.billingCity = billingCity;
	}
	public String getBillingState() {
		return billingState;
	}
	public void setBillingState(String billingState) {
		this.billingState = billingState;
	}
	public String getBillingCountry() {
		return billingCountry;
	}
	public void setBillingCountry(String billingCountry) {
		this.billingCountry = billingCountry;
	}
	public String getBillingZipcode() {
		return billingZipcode;
	}
	public void setBillingZipcode(String billingZipcode) {
		this.billingZipcode = billingZipcode;
	}
	public long getBillingAddressid() {
		return billingAddressid;
	}
	public void setBillingAddressid(long billingAddressid) {
		this.billingAddressid = billingAddressid;
	}
	
	///////////////////////////////////////////////////////
	
	public String getShippingStreet() {
		return shippingStreet;
	}
	public void setShippingStreet(String shippingStreet) {
		this.shippingStreet = shippingStreet;
	}
	public String getShippingCity() {
		return shippingCity;
	}
	public void setShippingCity(String shippingCity) {
		this.shippingCity = shippingCity;
	}
	public String getShippingState() {
		return shippingState;
	}
	public void setShippingState(String shippingState) {
		this.shippingState = shippingState;
	}
	public String getShippingCountry() {
		return shippingCountry;
	}
	public void setShippingCountry(String shippingCountry) {
		this.shippingCountry = shippingCountry;
	}
	public String getShippingZipcode() {
		return shippingZipcode;
	}
	public void setShippingZipcode(String shippingZipcode) {
		this.shippingZipcode = shippingZipcode;
	}
	public long getShippingAddressid() {
		return shippingAddressid;
	}
	public void setShippingAddressid(long shippingAddressid) {
		this.shippingAddressid = shippingAddressid;
	}
	public boolean isBillingAddressDifferent() {
		return isBillingAddressDifferent;
	}
	public void setBillingAddressDifferent(boolean isBillingAddressDifferent) {
		this.isBillingAddressDifferent = isBillingAddressDifferent;
	}
	public String getCartItemId() {
		return cartItemId;
	}
	public void setCartItemId(String cartItemId) {
		this.cartItemId = cartItemId;
	}
	
	
	
}
