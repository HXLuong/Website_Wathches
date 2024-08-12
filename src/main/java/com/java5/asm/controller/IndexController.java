package com.java5.asm.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java5.asm.dao.CategoryDAO;
import com.java5.asm.dao.ProductDAO;
import com.java5.asm.model.Category;
import com.java5.asm.model.Product;
import com.java5.asm.utils.ShoppingCartService;

@Controller
public class IndexController {

	@Autowired
	ShoppingCartService cart;

	@Autowired
	ProductDAO proDAO;

	@Autowired
	CategoryDAO cteDAO;

	@RequestMapping("index")
	public String index(Model model, @RequestParam("item") Optional<Integer> item) {
		Pageable items = PageRequest.of(item.orElse(0), 8);
		model.addAttribute("items", proDAO.findAll(items));
		model.addAttribute("Count", cart.getCount());
		return "viewIndex";
	}

	@RequestMapping("/detail/{id}/{cteID}")
	public String detail(@PathVariable("id") Integer id, @PathVariable("cteID") String cteID, Model model) {
		Product items = proDAO.findById(id).orElse(null);
		items.setQty(1);
		List<Product> cte = proDAO.findByCategory(cteID);
		model.addAttribute("cte", cte);
		model.addAttribute("items", items);
		model.addAttribute("Count", cart.getCount());
		return "detail";
	}

	@RequestMapping("/category/{id}")
	public String categoryID(@PathVariable("id") String id, Model model) {
		List<Product> items = proDAO.findByCategory(id);
		model.addAttribute("items", items);
		model.addAttribute("categories", cteDAO.findAll());
		model.addAttribute("Count", cart.getCount());
		return "category";
	}

	@RequestMapping("category")
	public String category(Model model, @RequestParam("min") Optional<Double> min,
			@RequestParam("max") Optional<Double> max) {
		double minPrice = min.orElse(Double.MIN_VALUE);
		double maxPrice = max.orElse(Double.MAX_VALUE);
		model.addAttribute("Count", cart.getCount());
		model.addAttribute("categories", cteDAO.findAll());
		model.addAttribute("items", proDAO.findByPrice(minPrice, maxPrice));
		return "category";
	}

	@RequestMapping("/category/sortDESC")
	public String sortDESC(Model model) {
		Sort sort = Sort.by(Direction.DESC, "price");
		model.addAttribute("items", proDAO.findAll(sort));
		model.addAttribute("categories", cteDAO.findAll());
		model.addAttribute("Count", cart.getCount());
		return "category";
	}
	
	@RequestMapping("/category/sortASC")
	public String sortASC(Model model) {
		Sort sort = Sort.by(Direction.ASC, "price");
		model.addAttribute("items", proDAO.findAll(sort));
		model.addAttribute("categories", cteDAO.findAll());
		model.addAttribute("Count", cart.getCount());
		return "category";
	}

}
