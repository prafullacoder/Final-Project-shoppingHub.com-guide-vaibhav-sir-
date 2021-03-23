package com.shoppinghub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.ShippingAddress;

public interface ShippingAddressRepository extends JpaRepository<ShippingAddress,Long>{

}
