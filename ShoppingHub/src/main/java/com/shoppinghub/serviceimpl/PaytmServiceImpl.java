package com.shoppinghub.serviceimpl;

import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paytm.pg.merchant.PaytmChecksum;
import com.shoppinghub.dto.PaytmDetails;
import com.shoppinghub.service.PaytmService;

@Service
public class PaytmServiceImpl implements PaytmService{
		
	@Autowired
	private PaytmDetails paytmDetails;
	
	@Override
	public boolean validateCheckSum(TreeMap<String, String> parameters, String paytmChecksum) throws Exception {
        return PaytmChecksum.verifySignature(parameters,
        		paytmDetails.getMerchantKey(), paytmChecksum);
    }
	
	@Override
	public String getCheckSum(TreeMap<String, String> parameters) throws Exception {
		return PaytmChecksum.generateSignature(parameters, paytmDetails.getMerchantKey());
	}
}
