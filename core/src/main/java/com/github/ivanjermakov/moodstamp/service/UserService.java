package com.github.ivanjermakov.moodstamp.service;

import com.github.ivanjermakov.moodstamp.document.User;
import com.github.ivanjermakov.moodstamp.exception.DuplicationException;
import com.github.ivanjermakov.moodstamp.mapper.RegisterUserUserMapper;
import com.github.ivanjermakov.moodstamp.model.RegisterUser;
import com.github.ivanjermakov.moodstamp.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	private final UserRepository userRepository;
	private final RegisterUserUserMapper registerUserUserMapper;

	@Autowired
	public UserService(UserRepository userRepository, RegisterUserUserMapper registerUserUserMapper) {
		this.userRepository = userRepository;
		this.registerUserUserMapper = registerUserUserMapper;
	}

	public void register(RegisterUser registerUser) {
		if (userRepository.findByLogin(registerUser.login).isPresent())
			throw new DuplicationException("user with the given login already exist");

		User map = registerUserUserMapper.map(registerUser);
		userRepository.save(map);
	}

}
