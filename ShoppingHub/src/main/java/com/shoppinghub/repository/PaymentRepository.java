package com.shoppinghub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.Payment;

public interface PaymentRepository extends JpaRepository<Payment,Long>{

}
