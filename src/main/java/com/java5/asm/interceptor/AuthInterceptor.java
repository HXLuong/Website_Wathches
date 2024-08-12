package com.java5.asm.interceptor;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

import com.java5.asm.model.Account;
import com.java5.asm.utils.SessionService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	
	@Autowired
	SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle) throws Exception {
		String uri = request.getRequestURI();
		Account user = session.get("user");
		String error = "";
		if (user == null) {
			error = "Please Login!";
		} else if (!user.getAdmin() && uri.startsWith("/admin/")) {
			error = "Access denied!";
		}
		
		if (error.length() > 0) {
			session.set("security-uri", uri);
			response.sendRedirect("/login?error=" + error);
			return false;
		}
		return true;
	}
}
