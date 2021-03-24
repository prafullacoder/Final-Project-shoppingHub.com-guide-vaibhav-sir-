package com.shoppinghub.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
public class Payment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String bankName;
	private String bankTXNID;
	private String currency;
	private String gateWayName;
	private String orderId;
	private String paymentMode;
	private String respMsg;
	private String status;
	private String txnAmount;
	private String txDate;
	private String txnId;
	
	
	@OneToOne(mappedBy = "payment") 
	@JsonBackReference
	private Order order;
	 
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Payment(String bankName, String bankTXNID, String currency, String gateWayName, String orderId,
			String paymentMode, String respMsg, String status, String txnAmount, String txDate, String txnId) {
		super();
		this.bankName = bankName;
		this.bankTXNID = bankTXNID;
		this.currency = currency;
		this.gateWayName = gateWayName;
		this.orderId = orderId;
		this.paymentMode = paymentMode;
		this.respMsg = respMsg;
		this.status = status;
		this.txnAmount = txnAmount;
		this.txDate = txDate;
		this.txnId = txnId;
	}


	public long getId() {
		return id;
	}


	public void setId(long id) {
		this.id = id;
	}


	public String getBankName() {
		return bankName;
	}


	public void setBankName(String bankName) {
		this.bankName = bankName;
	}


	public String getBankTXNID() {
		return bankTXNID;
	}


	public void setBankTXNID(String bankTXNID) {
		this.bankTXNID = bankTXNID;
	}


	public String getCurrency() {
		return currency;
	}


	public void setCurrency(String currency) {
		this.currency = currency;
	}


	public String getGateWayName() {
		return gateWayName;
	}


	public void setGateWayName(String gateWayName) {
		this.gateWayName = gateWayName;
	}


	public String getOrderId() {
		return orderId;
	}


	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}


	public String getPaymentMode() {
		return paymentMode;
	}


	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}


	public String getRespMsg() {
		return respMsg;
	}


	public void setRespMsg(String respMsg) {
		this.respMsg = respMsg;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getTxnAmount() {
		return txnAmount;
	}


	public void setTxnAmount(String txnAmount) {
		this.txnAmount = txnAmount;
	}


	public String getTxDate() {
		return txDate;
	}


	public void setTxDate(String txDate) {
		this.txDate = txDate;
	}


	public String getTxnId() {
		return txnId;
	}


	public void setTxnId(String txnId) {
		this.txnId = txnId;
	}


	public Order getOrder() {
		return order;
	}


	public void setOrder(Order order) {
		this.order = order;
	}
	
	
	
	
	
}
