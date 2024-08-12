package com.java5.asm.utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.annotation.SessionScope;

import com.java5.asm.dao.ProductDAO;
import com.java5.asm.model.Product;

@SessionScope
@Controller
public class ShoppingCartServiceImpl implements ShoppingCartService {

	Map<Integer, Product> map = new HashMap<>();
	
	@Autowired
	ProductDAO proDAO;

	@Override
	public Product add(Integer id) {
		Product item = map.get(id);
		if (item == null) {
			item = proDAO.getOne(id);
			item.setQty(1);
			map.put(id, item);
		} else {
			item.setQty(item.getQty() + 1);
		}
		return item;
	}

	@Override
	public void remove(Integer id) {
		map.remove(id);
	}

	@Override
	public Product update(Integer id, String qty) {
		Product item = map.get(id);
		if (qty.equals("dis") && item.getQty() > 1) {
			item.setQty(item.getQty() - 1);
		} else if (qty.equals("plus") && item.getQty() < 100) {
			item.setQty(item.getQty() + 1);
		}
		return item;
	}
	
	@Override
	public Product update(Integer id, Integer qty) {
		Product item = map.get(id);
		item.setQty(qty);
		return item;
	}
	

	@Override
	public void clear() {
		map.clear();
	}

	@Override
	public Collection<Product> getItems() {
		return map.values();
	}

	@Override
	public int getCount() {
		return map.values().stream().mapToInt(item -> item.getQty()).sum();
	}

	@Override
	public double getAmount() {
		return map.values().stream().mapToDouble(item -> item.getPrice() * item.getQty()).sum();
	}

	@Override
	public List<Integer> getAllIds() {
		List<Integer> ids = new ArrayList<>();
		for (Product product : map.values()) {
			ids.add(product.getId());
		}
		return ids;
	}

	@Override
	public int getQty(Integer id) {
		 Product product = map.get(id);
		    if (product != null) {
		        return product.getQty();
		    } else {
		        return 0; 
		    }
	}

	@Override
	public double getPrice(Integer id) {
		 Product product = map.get(id);
		    if (product != null) {
		        return product.getPrice();
		    } else {
		        return 0; 
		    }
	}

	@Override
	public String getName(Integer id) {
		Product product = map.get(id);
	    if (product != null) {
	        return product.getName();
	    } else {
	        return null; 
	    }
	}
	
}
