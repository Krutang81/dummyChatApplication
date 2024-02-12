package com.example.demo.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.User;
import com.example.demo.repo.UserRepo;


@Service
public class UserService {
    @Autowired
    private UserRepo repo;
    
    public boolean checkUniqueUser(User user) {
    	User foundUser= repo.findByUsernameOrEmail(user.username, user.email);
    	return foundUser== null;
    }

    public String saveUser(User user) {

        repo.save(user);
        return "User registered Successfully";

    }	
    
    public boolean checkUsernameAndPassword(User user) {
    	User foundUser=  repo.findByUsernameAndPassword(user.username, user.password);
    	
    	return foundUser!=null;
//    	if(foundUser!=null) {
//    		System.out.println("found User: "+user.username+" "+user.password);
//    		return true;
//    	}
//    	else {
//    		System.out.println("No user found");
//    		return false;
//    	}
   	
    }
}
