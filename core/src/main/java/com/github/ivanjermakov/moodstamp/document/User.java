package com.github.ivanjermakov.moodstamp.document;

import org.springframework.data.annotation.AccessType;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
@AccessType(AccessType.Type.FIELD)
public class User {

	@Id
	public String id;
	public String login;
	public String hash;

	public User() {
	}

	public User(String login, String hash) {
		this.login = login;
		this.hash = hash;
	}

}
