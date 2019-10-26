package com.github.ivanjermakov.moodstamp.mapper;

import com.github.ivanjermakov.moodstamp.document.User;
import com.github.ivanjermakov.moodstamp.model.RegisterUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class RegisterUserUserMapper implements Mapper<RegisterUser, User> {

	private final PasswordEncoder passwordEncoder;

	@Autowired
	public RegisterUserUserMapper(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public User map(RegisterUser registerUser) {
		return new User(
				registerUser.login,
				passwordEncoder.encode(registerUser.password)
		);
	}

}
