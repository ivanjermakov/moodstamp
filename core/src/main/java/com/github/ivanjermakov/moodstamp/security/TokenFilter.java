package com.github.ivanjermakov.moodstamp.security;

import com.auth0.jwt.algorithms.Algorithm;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;

import static com.auth0.jwt.JWT.require;

public class TokenFilter extends BasicAuthenticationFilter {

	private final TokenProvider tokenProvider;

	public TokenFilter(AuthenticationManager authManager, TokenProvider tokenProvider) {
		super(authManager);
		this.tokenProvider = tokenProvider;
	}

	@Override
	protected void doFilterInternal(HttpServletRequest req,
	                                HttpServletResponse res,
	                                FilterChain chain) throws IOException, ServletException {
		String header = req.getHeader(tokenProvider.tokenHeaderName);

		if (header == null) {
			chain.doFilter(req, res);
			return;
		}

		SecurityContextHolder.getContext().setAuthentication(getAuthentication(req));
		chain.doFilter(req, res);
	}

	private UsernamePasswordAuthenticationToken getAuthentication(HttpServletRequest request) {
		String token = request.getHeader(tokenProvider.tokenHeaderName);

		String user = require(Algorithm.HMAC512(tokenProvider.secret.getBytes()))
				.build()
				.verify(token)
				.getSubject();

		return new UsernamePasswordAuthenticationToken(user, null, Collections.emptyList());
	}
}
