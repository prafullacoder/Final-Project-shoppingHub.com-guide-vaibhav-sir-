package com.shoppinghub.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.shoppinghub.entity.User;
import com.shoppinghub.entity.UserShippingAddress;

public interface UserShippingAddressRepository extends JpaRepository<UserShippingAddress,Long>{

	List<UserShippingAddress> findByUser(User user);

}
