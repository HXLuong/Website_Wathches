package com.java5.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.java5.asm.model.Category;

public interface CategoryDAO extends JpaRepository<Category, String>{
	
}

