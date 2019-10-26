package com.github.ivanjermakov.moodstamp.repository;

import com.github.ivanjermakov.moodstamp.document.User;
import org.springframework.data.mongodb.repository.MongoRepository;

import java.util.Optional;

public interface UserRepository extends MongoRepository<User, String> {

	Optional<User> findByLogin(String name);

}
