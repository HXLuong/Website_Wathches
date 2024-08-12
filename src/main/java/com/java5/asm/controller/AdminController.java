package com.java5.asm.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java5.asm.dao.AccountDAO;
import com.java5.asm.dao.CategoryDAO;
import com.java5.asm.dao.OrderDAO;
import com.java5.asm.dao.OrderDetailDAO;
import com.java5.asm.dao.ProductDAO;
import com.java5.asm.model.Account;
import com.java5.asm.model.Category;
import com.java5.asm.model.Order;
import com.java5.asm.model.Product;
import com.java5.asm.utils.SessionService;

@Controller
public class AdminController {

	@Autowired
	CategoryDAO caDAO;

	@Autowired
	AccountDAO accDAO;

	@Autowired
	ProductDAO prodDAO;

	@Autowired
	OrderDAO ordDAO;

	@Autowired
	OrderDetailDAO ordDetailDAO;

	@Autowired
	SessionService session;

//	Category ------------------------------------------

	@RequestMapping("/admin/category")
	public String category_index(Model model, @ModelAttribute("categoryItem") Category ca,
			@RequestParam("field") Optional<String> field) {
		ca.setId(null);
		ca.setName(null);
		model.addAttribute("categoryItems", caDAO.findAll());
		model.addAttribute("field", field.orElse("administrator").toUpperCase());
		return "qly_category";
	}

	@PostMapping("/admin/category/create")
	public String category_create(Model model, @Validated @ModelAttribute("categoryItem") Category ca,
			BindingResult result) {
		if (!result.hasErrors()) {
			if (!caDAO.findById(ca.getId()).isEmpty()) {
				model.addAttribute("error_category", "* ID đã tồn tại");
			} else {
				if (ca.getId().length() == 4) {
					caDAO.save(ca);
					model.addAttribute("success_category", "Create success!");
				} else {
					model.addAttribute("error_category", "* Độ dài ID phải là 4 ký tự");
				}
			}
		}
		model.addAttribute("categoryItems", caDAO.findAll());
		return "qly_category";
	}

	@PostMapping("/admin/category/update")
	public String category_update(Model model, @Validated @ModelAttribute("categoryItem") Category ca,
			BindingResult result) {
		if (!result.hasErrors()) {
			if (caDAO.findById(ca.getId()).isEmpty()) {
				model.addAttribute("error_category", "* ID đã tồn tại");
			} else {
				if (ca.getId().length() == 4) {
					caDAO.save(ca);
					model.addAttribute("success_category", "Update success!");
				} else {
					model.addAttribute("error_category", "* Độ dài ID phải là 4 ký tự");
				}
			}
		}
		model.addAttribute("categoryItems", caDAO.findAll());
		return "qly_category";
	}

	@PostMapping("/admin/category/delete")
	public String category_delete(Model model, @Validated @ModelAttribute("categoryItem") Category ca) {
		if (caDAO.findById(ca.getId()).isEmpty()) {
			model.addAttribute("error_category", "* ID đã tồn tại");
		} else {
			caDAO.deleteById(ca.getId());
			model.addAttribute("success_category", "Delete success!");
		}
		model.addAttribute("categoryItems", caDAO.findAll());
		return "qly_category";
	}

	@GetMapping("/admin/category/edit")
	public String category_edit(Model model, @RequestParam("id") String id,
			@ModelAttribute("categoryItem") Category ca) {
		if (caDAO.findById(ca.getId()).isEmpty()) {
			return "redirect:/admin/category";
		} else {
			Category category = caDAO.findById(id).get();
			ca.setId(category.getId());
			ca.setName(category.getName());
		}
		model.addAttribute("categoryItems", caDAO.findAll());
		return "qly_category";
	}

	@GetMapping("/admin/category/delete")
	public String category_delete(Model model, @RequestParam("id") String id,
			@ModelAttribute("categoryItem") Category ca) {
		if (caDAO.findById(ca.getId()).isEmpty()) {
			return "redirect:/category/index";
		} else {
			caDAO.deleteById(ca.getId());
			model.addAttribute("success_category", "Delete success!");
		}
		model.addAttribute("categoryItems", caDAO.findAll());
		return "qly_category";
	}

//	Account ------------------------------------------

	@RequestMapping("/admin/account")
	public String account_index(Model model, @ModelAttribute("account") Account acc,
			@RequestParam("field") Optional<String> field) {
		acc.setUsername(null);
		acc.setPassword(null);
		acc.setFullname(null);
		acc.setEmail(null);
		acc.setPhoto(null);
		model.addAttribute("accounts", accDAO.findAll());
		model.addAttribute("field", field.orElse("administrator").toUpperCase());
		return "qly_account";
	}

	@PostMapping("/admin/account/create")
	public String account_create(Model model, @Validated @ModelAttribute("account") Account acc, BindingResult result) {
		if (!result.hasErrors()) {
			if (!accDAO.findById(acc.getUsername()).isEmpty()) {
				model.addAttribute("error_account", "* Username đã tồn tại");
			} else {
				accDAO.save(acc);
				model.addAttribute("success_account", "Create success!");
			}
		}
		model.addAttribute("accounts", accDAO.findAll());
		return "qly_account";
	}

	@PostMapping("/admin/account/update")
	public String account_update(Model model, @Validated @ModelAttribute("account") Account acc, BindingResult result) {
		if (!result.hasErrors()) {
			if (accDAO.findById(acc.getUsername()).isEmpty()) {
				model.addAttribute("error_account", "* Username đã tồn tại");
			} else {
				accDAO.save(acc);
				model.addAttribute("success_account", "Update success!");
			}
		}
		model.addAttribute("accounts", accDAO.findAll());
		return "qly_account";
	}

	@PostMapping("/admin/account/delete")
	public String account_delete(Model model, @Validated @ModelAttribute("account") Account acc) {
		if (accDAO.findById(acc.getUsername()).isEmpty()) {
			model.addAttribute("error_account", "* Username đã tồn tại");
		} else {
			accDAO.deleteById(acc.getUsername());
			model.addAttribute("success_account", "Delete success!");
		}
		model.addAttribute("accounts", accDAO.findAll());
		return "qly_account";
	}

	@GetMapping("/admin/account/edit")
	public String account_edit(Model model, @RequestParam("username") String username,
			@ModelAttribute("account") Account acc) {
		if (accDAO.findById(acc.getUsername()).isEmpty()) {
			return "redirect:/admin/account";
		} else {
			Account account = accDAO.findById(username).get();
			acc.setUsername(account.getUsername());
			acc.setPassword(account.getPassword());
			acc.setFullname(account.getFullname());
			acc.setEmail(account.getEmail());
		}
		model.addAttribute("accounts", accDAO.findAll());
		return "qly_account";
	}

	@GetMapping("/admin/account/delete")
	public String account_delete(Model model, @RequestParam("username") String username,
			@ModelAttribute("account") Account acc) {
		if (accDAO.findById(acc.getUsername()).isEmpty()) {
			return "redirect:/admin/account";
		} else {
			accDAO.deleteById(acc.getUsername());
			model.addAttribute("success_account", "Delete success!");
		}
		model.addAttribute("accounts", accDAO.findAll());
		return "qly_account";
	}

	@ModelAttribute("role")
	public Map<Boolean, String> getRole() {
		Map<Boolean, String> map = new HashMap<>();
		map.put(false, "User");
		map.put(true, "Admin");
		return map;
	}

//	Product ----------------------------------

	@RequestMapping("/admin/product")
	public String product_index(Model model, @ModelAttribute("product") Product p,
			@RequestParam("field") Optional<String> field) {
		p.setId(1);
		p.setName(null);
		p.setImage(null);
		p.setPrice(null);
		model.addAttribute("categories", caDAO.findAll());
		model.addAttribute("products", prodDAO.findAll());
		model.addAttribute("field", field.orElse("administrator").toUpperCase());
		return "qly_product";
	}

	@PostMapping("/admin/product/create")
	public String product_create(Model model, @Validated @ModelAttribute("product") Product p, BindingResult result) {
		if (!result.hasErrors()) {
			if (p.getId() != null) {
				if (!prodDAO.findById(p.getId()).isEmpty()) {
					model.addAttribute("error_product", "* Product with this ID already exists");
				} else {
					prodDAO.save(p);
					model.addAttribute("success_product", "Create success!");
				}
			} else {
				// Xử lý khi id bị null
				model.addAttribute("error_product", "* Product ID cannot be null");
			}
		}
		model.addAttribute("categories", caDAO.findAll());
		model.addAttribute("products", prodDAO.findAll());
		return "qly_product";
	}

	@PostMapping("/admin/product/update")
	public String product_update(Model model, @Validated @ModelAttribute("product") Product p, BindingResult result) {
		if (!result.hasErrors()) {
			if (prodDAO.findById(p.getId()).isEmpty()) {
				model.addAttribute("error_product", "* Username đã tồn tại");
			} else {
				prodDAO.save(p);
				model.addAttribute("success_product", "Update success!");
			}
		}
		model.addAttribute("categories", caDAO.findAll());
		model.addAttribute("products", prodDAO.findAll());
		return "qly_product";
	}

	@PostMapping("/admin/product/delete")
	public String product_delete(Model model, @Validated @ModelAttribute("product") Product p) {
		if (prodDAO.findById(p.getId()).isEmpty()) {
			model.addAttribute("error_product", "* Username đã tồn tại");
		} else {
			prodDAO.deleteById(p.getId());
			model.addAttribute("success_product", "Delete success!");
		}
		model.addAttribute("categories", caDAO.findAll());
		model.addAttribute("products", prodDAO.findAll());
		return "qly_product";
	}

	@GetMapping("/admin/product/edit")
	public String product_edit(Model model, @RequestParam("id") Integer id, @ModelAttribute("product") Product p) {
		if (prodDAO.findById(p.getId()).isEmpty()) {
			return "redirect:/admin/product";
		} else {
			Product prod = prodDAO.findById(id).get();
			p.setName(prod.getName());
			p.setPrice(prod.getPrice());
			p.setCte(prod.getCte());
		}
		model.addAttribute("categories", caDAO.findAll());
		model.addAttribute("products", prodDAO.findAll());
		return "qly_product";
	}

	@GetMapping("/admin/product/delete")
	public String product_delete(Model model, @RequestParam("id") Integer id, @ModelAttribute("product") Product p) {
		if (prodDAO.findById(p.getId()).isEmpty()) {
			return "redirect:/admin/product";
		} else {
			prodDAO.deleteById(p.getId());
			model.addAttribute("success_product", "Delete success!");
		}
		model.addAttribute("categories", caDAO.findAll());
		model.addAttribute("products", prodDAO.findAll());
		return "qly_product";
	}

	@ModelAttribute("availabled")
	public Map<Boolean, String> getAvailable() {
		Map<Boolean, String> map = new HashMap<>();
		map.put(false, "No Available");
		map.put(true, "Available");
		return map;
	}

	@RequestMapping("/admin/product/search")
	public String product_search(Model model, @RequestParam("keywords") Optional<String> kw, @ModelAttribute("product") Product p) {
		String kwords = kw.orElse(session.get("keywords"));
		session.set("keywords", kwords);
		model.addAttribute("categories", caDAO.findAll());
		model.addAttribute("products", prodDAO.findByKeywords("%" + kwords + "%"));
		return "qly_product";
	}

//	Order

	@RequestMapping("/admin/order")
	public String order_index(Model model, @RequestParam("field") Optional<String> field) {
		model.addAttribute("orders", ordDAO.findAll());
		model.addAttribute("field", field.orElse("administrator").toUpperCase());
		return "qly_order";
	}

//	OrderDetail

	@RequestMapping("/admin/orderDetail/{id}")
	public String orderDetail_index(Model model, @RequestParam("field") Optional<String> field,
			@PathVariable("id") Long id) {
		Order order = ordDAO.findById(id).get();
		model.addAttribute("orderDetails", ordDetailDAO.findAllByOrderID(order.getId()));
		model.addAttribute("field", field.orElse("administrator").toUpperCase());
		return "qly_orderDetail";
	}

	@RequestMapping("/history")
	public String history(Model model) {
		Account user = session.get("user");
		model.addAttribute("orders", ordDAO.findAllByAccountID(user.getUsername()));
		return "history";
	}

	@RequestMapping("/history_detail/{id}")
	public String history_detail(Model model, @PathVariable("id") Long id) {
		Order order = ordDAO.findById(id).get();
		model.addAttribute("orderDetails", ordDetailDAO.findAllByOrderID(order.getId()));
		return "history_detail";
	}

	@RequestMapping("/admin/inventory-by-category")
	public String inventory(Model model, @RequestParam("field") Optional<String> field) {
		model.addAttribute("items", prodDAO.getInventoryByCategory());
		model.addAttribute("field", field.orElse("administrator").toUpperCase());
		return "inventory-by-category";
	}
}
