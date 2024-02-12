package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.entity.User;
import com.example.demo.service.UserService;


@RestController
@CrossOrigin//dont forgot to add this

public class UserController {
	 @Autowired
	    private UserService service;

	    @PostMapping("/register")
	    private ResponseEntity<Boolean> registerUser(@RequestBody User user){
	    	boolean isUnique= service.checkUniqueUser(user);
	    	if(isUnique) {
	    		service.saveUser(user);
	    	}
	        
	    	return new ResponseEntity<>(isUnique,HttpStatus.OK);
	    }
	    
	    @PostMapping("/validate")
	    private ResponseEntity<Boolean> validateUser(@RequestBody User user){
//	    	System.out.println("validateUser"+user);
	    		boolean isValidate= service.checkUsernameAndPassword(user);
		    	if(isValidate) {
		    		System.out.println("Validate Success "+user.username+" "+ user.password);
		    	}else {
		    		System.out.println("Validate UnSuccess");
		    	}
		    	
		    	return new ResponseEntity<>(isValidate,HttpStatus.OK);
	    }

}
