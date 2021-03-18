package com.shoppinghub.service;

import java.util.TreeMap;

public interface PaytmService {

	boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception;

	String getCheckSum(TreeMap<String, String> parameters) throws Exception;

}
