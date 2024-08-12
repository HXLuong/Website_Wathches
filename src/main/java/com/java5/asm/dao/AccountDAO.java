package com.java5.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java5.asm.model.Account;

public interface AccountDAO extends JpaRepository<Account, String> {
	@Query("SELECT o FROM Account o WHERE o.email = ?1")
	Account findByEmail(String email);
}
