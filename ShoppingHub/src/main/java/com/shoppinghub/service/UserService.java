package com.shoppinghub.service;

import com.shoppinghub.entity.User;

public interface UserService {
	
	public String createUser( User user);
	
	public String login(User user);

	public User findById(long userId);

	public void logout();
	

}
