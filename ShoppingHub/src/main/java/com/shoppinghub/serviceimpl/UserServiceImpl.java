package com.shoppinghub.serviceimpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoppinghub.entity.User;
import com.shoppinghub.repository.UserRepository;
import com.shoppinghub.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private HttpSession session;

	@Override
	public String createUser(User user) {
		try {
			userRepo.save(user);
			return "successfull";
		} catch (Exception e) {
			e.printStackTrace();
			return "unsuccessfull";
		}
	}
	
	@Override
	public String login(User user) {
		try {
			user =userRepo.findByUsernameAndPassword(user.getUsername(),user.getPassword());
			if(user != null) {
				session.setAttribute("userId", user.getId());
				return "login successfull";
			}else {
				return "login Fail";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "login Fail";
		}
	}

	@Override
	public User findById(long userId) {
		return userRepo.findById(userId).get();
		
	}

	@Override
	public void logout() {
		session.removeAttribute("userId");
		session.invalidate();
	}

}
