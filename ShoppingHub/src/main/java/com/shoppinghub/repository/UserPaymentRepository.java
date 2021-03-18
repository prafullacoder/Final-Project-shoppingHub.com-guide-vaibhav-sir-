package com.shoppinghub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.UserPayment;

public interface UserPaymentRepository extends JpaRepository<UserPayment,Long>{

}
