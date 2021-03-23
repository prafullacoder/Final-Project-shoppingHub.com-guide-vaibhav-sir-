package com.shoppinghub.dto;

import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ShipmentTracker {
	
	@JsonProperty("ShipmentData")
	private ShipmentData shipmentData[];
	
	
	
	@Override
	public String toString() {
		return "ShipmentTracker [ShipmentData=" + Arrays.toString(shipmentData) + "]";
	}

	public ShipmentData[] getShipmentData() {
		return shipmentData;
	}

	public void setShipmentData(ShipmentData[] shipmentData) {
		this.shipmentData = shipmentData;
	} 
	
}







//class Consignee {
//	@JsonProperty("City")
//	private String city;
//	@JsonProperty("Name")
//	private String name;
//	@JsonProperty("Country")
//	private String country;
//	@JsonProperty("Address3")
//	private String address3;
//	@JsonProperty("PinCode")
//	private String pinCode;
//	@JsonProperty("State")
//	private String state;
//	@JsonProperty("Telephone2")
//	private String telephone2;
//	@JsonProperty("Telephone1")
//	private String telephone1;
//	
//	
//	
//	@Override
//	public String toString() {
//		return "Consignee [city=" + city + ", name=" + name + ", country=" + country + ", address3=" + address3
//				+ ", pinCode=" + pinCode + ", state=" + state + ", telephone2=" + telephone2 + ", telephone1="
//				+ telephone1 + "]";
//	}
//	public String getCity() {
//		return city;
//	}
//	public void setCity(String city) {
//		this.city = city;
//	}
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public String getCountry() {
//		return country;
//	}
//	public void setCountry(String country) {
//		this.country = country;
//	}
//	public String getAddress3() {
//		return address3;
//	}
//	public void setAddress3(String address3) {
//		this.address3 = address3;
//	}
//	public String getPinCode() {
//		return pinCode;
//	}
//	public void setPinCode(String pinCode) {
//		this.pinCode = pinCode;
//	}
//	public String getState() {
//		return state;
//	}
//	public void setState(String state) {
//		this.state = state;
//	}
//	public String getTelephone2() {
//		return telephone2;
//	}
//	public void setTelephone2(String telephone2) {
//		this.telephone2 = telephone2;
//	}
//	public String getTelephone1() {
//		return telephone1;
//	}
//	public void setTelephone1(String telephone1) {
//		this.telephone1 = telephone1;
//	}
//	
//	
//	
//	
//	
//}




