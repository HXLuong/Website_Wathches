package com.java5.asm.utils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import jakarta.servlet.http.HttpSession;

@Component
public class SessionService {

	@Autowired
	HttpSession session;

	public <T> T get(String name) {
		return (T) session.getAttribute(name);
	}

	public void set(String name, Object value) {
		session.setAttribute(name, value);
	}

	public void remove(String name) {
		session.removeAttribute(name);
	}

	public boolean isUserLoggedIn(HttpSession session) {
		if (session.getAttribute("user") != null) {
			return true;
		} else {
			return false;
		}
	}
}
