package com.shoppinghub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.User;
import com.shoppinghub.entity.UserBillingAddress;

public interface UserBillingAddressRepository extends JpaRepository<UserBillingAddress,Long>{

	List<UserBillingAddress> findByUser(User user);

}
