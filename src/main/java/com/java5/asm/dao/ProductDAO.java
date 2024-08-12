package com.java5.asm.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.java5.asm.model.Product;
import com.java5.asm.model.Report;

public interface ProductDAO extends JpaRepository<Product, Integer> {
	@Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
	List<Product> findByPrice(double minPrice, double maxPrice);

	@Query("SELECT o FROM Product o WHERE o.category.id like ?1")
	List<Product> findByCategory(String id);

	@Query("SELECT new Report(o.category, sum(o.price), count(o)) " + " FROM Product o " + " GROUP BY o.category"
			+ " ORDER BY sum(o.price) DESC")
	List<Report> getInventoryByCategory();

	@Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
	List<Product> findByKeywords(String keywords);
}
