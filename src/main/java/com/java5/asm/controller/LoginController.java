package com.java5.asm.controller;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java5.asm.dao.AccountDAO;
import com.java5.asm.dao.ProductDAO;
import com.java5.asm.model.Account;
import com.java5.asm.model.MailInfo;
import com.java5.asm.utils.MailerHelper;
import com.java5.asm.utils.MailerServiceImpl;
import com.java5.asm.utils.SessionService;
import com.java5.asm.utils.ShoppingCartService;

import jakarta.mail.MessagingException;

@Controller
public class LoginController {

	@Autowired
	AccountDAO dao;

	@Autowired
	SessionService session;

	@Autowired
	ShoppingCartService cart;

	@Autowired
	ProductDAO proDAO;

	@Autowired
	AccountDAO accDAO;

	@Autowired
	MailerServiceImpl mailer;

	@GetMapping("/login")
	public String show(@ModelAttribute("account") Account account) {
		return "login";
	}

	@GetMapping("/logout")
	public String logout(@ModelAttribute("account") Account account) {
		session.remove("user");
		return "redirect:/login";
	}

	@PostMapping("/login")
	public String login(Model model, @Validated @ModelAttribute("account") Account account, BindingResult result) {
		Account acc = null;
		try {
			acc = dao.findById(account.getUsername()).get();
			if (acc.getPassword().equals(account.getPassword())) {
				session.set("user", acc);
				if (acc.getAdmin()) {
					return "redirect:/admin/category";
				} else {
					return "redirect:/index";
				}
			} else {
				model.addAttribute("error", "Invalid Password!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", "Invalid Username!");
		}
		return "login";
	}

	@GetMapping("/signup")
	public String signup(@ModelAttribute("account") Account account) {
		return "signup";
	}

	@PostMapping("/signup")
	public String account_create(@Validated @ModelAttribute("account") Account acc, BindingResult result,
			@RequestParam("Valpassword") String Valpassword, Model model) {
		try {
			if (!dao.findById(acc.getUsername()).isEmpty()) {
				model.addAttribute("error", "Username đã tồn tại");
				return "signup";
			} else {
				if (!acc.getPassword().equals(Valpassword)) {
					model.addAttribute("error_password", "Xác nhận mật khẩu không đúng!");
					return "signup";
				} else {
					acc.setActivated(true);
					acc.setAdmin(false);
					dao.save(acc);
					return "redirect:/login";
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "signup";
	}

	@GetMapping("/forgetPassword")
	public String forgetPassword(@ModelAttribute("account") Account account) {
		return "forgetPassword";
	}

	@PostMapping("/forgetPassword")
	public String forgetPassword(@Validated @ModelAttribute("account") Account acc, BindingResult result,
			@RequestParam("email") String email, Model model) {

		Account account = accDAO.findByEmail(email);
		double randomDoule = Math.random();
		randomDoule = randomDoule * 1000 + 1;
		int randomInt = (int) randomDoule;

		MailerHelper helper = new MailerHelper();
		String[] emailCC = helper.parseStringEmailToArray(account.getEmail());
		String[] emailBCC = helper.parseStringEmailToArray(account.getEmail());
		MailInfo mail = new MailInfo();
		mail.setTo(account.getEmail());
		mail.setCc(emailCC);
		mail.setBcc(emailBCC);
		mail.setSubject("Lấy lại mật khẩu");
		mail.setBody("Mật khẩu của bạn là: " + randomInt);

		account.setPassword(String.valueOf(randomInt));
		accDAO.save(account);
		try {
			mailer.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "forgetPassword";
	}
}
