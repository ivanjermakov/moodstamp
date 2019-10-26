package com.github.ivanjermakov.moodstamp.controller;

import com.github.ivanjermakov.moodstamp.model.RegisterUser;
import com.github.ivanjermakov.moodstamp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("register")
public class RegisterController {

	private final UserService userService;

	@Autowired
	public RegisterController(UserService userService) {
		this.userService = userService;
	}

	@PostMapping
	public void register(@RequestBody RegisterUser registerUser) {
		userService.register(registerUser);
	}

}
