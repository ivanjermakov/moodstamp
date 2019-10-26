package com.github.ivanjermakov.moodstamp.security;

import com.github.ivanjermakov.moodstamp.document.User;
import com.github.ivanjermakov.moodstamp.repository.UserRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import static java.util.Collections.emptyList;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
	private UserRepository userRepository;

	public UserDetailsServiceImpl(UserRepository userRepository) {
		this.userRepository = userRepository;
	}

	@Override
	public UserDetails loadUserByUsername(String login) {
		User user = userRepository.findByLogin(login).orElseThrow();

		return new org.springframework.security.core.userdetails.User(user.login, user.hash, emptyList());
	}
}
