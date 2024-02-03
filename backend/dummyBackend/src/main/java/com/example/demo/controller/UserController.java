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
	    private ResponseEntity<String> registerUser(@RequestBody User user){
	        //save the user
	        String msg = service.saveUser(user);

	        return new ResponseEntity<String>(msg,HttpStatus.OK);
	    }

}
