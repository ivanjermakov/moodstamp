package com.github.ivanjermakov.moodstamp.exception;

public class DuplicationException extends RuntimeException {

	public DuplicationException() {
	}

	public DuplicationException(String message) {
		super(message);
	}

	public DuplicationException(String message, Throwable cause) {
		super(message, cause);
	}

	public DuplicationException(Throwable cause) {
		super(cause);
	}

	public DuplicationException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
