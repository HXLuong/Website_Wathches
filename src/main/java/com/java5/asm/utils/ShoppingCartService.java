package com.java5.asm.utils;

import java.util.Collection;
import java.util.List;

import com.java5.asm.model.Product;

public interface ShoppingCartService {

	Product add(Integer id);

	void remove(Integer id);

	Product update(Integer id, String qty);

	Product update(Integer id, Integer qty);

	void clear();

	Collection<Product> getItems();

	List<Integer> getAllIds();

	int getCount();

	double getAmount();

	int getQty(Integer id);

	double getPrice(Integer id);
	
	String getName(Integer id);
}
