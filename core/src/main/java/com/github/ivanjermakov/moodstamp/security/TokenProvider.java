package com.github.ivanjermakov.moodstamp.security;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class TokenProvider {

	@Value("${security.token.expiration-time}")
	public Long expirationTime;

	@Value("${security.token.secret-key}")
	public String secret;

	@Value("${security.token.header.name}")
	public String tokenHeaderName;

}