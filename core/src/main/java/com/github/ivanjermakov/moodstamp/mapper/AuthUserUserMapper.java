package com.github.ivanjermakov.moodstamp.mapper;

import com.github.ivanjermakov.moodstamp.document.User;
import com.github.ivanjermakov.moodstamp.model.AuthUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class AuthUserUserMapper implements Mapper<AuthUser, User> {

	private final PasswordEncoder passwordEncoder;

	@Autowired
	public AuthUserUserMapper(PasswordEncoder passwordEncoder) {
		this.passwordEncoder = passwordEncoder;
	}

	@Override
	public User map(AuthUser authUser) {
		return new User(
				authUser.login,
				passwordEncoder.encode(authUser.password)
		);
	}

}
