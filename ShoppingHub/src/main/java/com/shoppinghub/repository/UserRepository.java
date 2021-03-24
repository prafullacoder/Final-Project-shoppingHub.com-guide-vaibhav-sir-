package com.shoppinghub.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.shoppinghub.entity.User;
@Repository
public interface UserRepository extends JpaRepository<User,Long>{
	
	User findByUsernameAndPassword(String username,String password);
}
