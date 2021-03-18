package com.shoppinghub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.BillingAddress;

public interface BillingAddressRepository extends JpaRepository<BillingAddress,Long>{

}
