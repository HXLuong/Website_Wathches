package com.java5.asm.controller;

import java.io.File;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java5.asm.dao.OrderDAO;
import com.java5.asm.dao.OrderDetailDAO;
import com.java5.asm.dao.ProductDAO;
import com.java5.asm.model.Account;
import com.java5.asm.model.MailInfo;
import com.java5.asm.model.Order;
import com.java5.asm.model.OrderDetail;
import com.java5.asm.model.Product;
import com.java5.asm.utils.MailerHelper;
import com.java5.asm.utils.MailerServiceImpl;
import com.java5.asm.utils.SessionService;
import com.java5.asm.utils.ShoppingCartService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@Autowired
	ShoppingCartService cart;

	@Autowired
	SessionService session1;

	@Autowired
	OrderDAO orderDAO;

	@Autowired
	OrderDetailDAO orderDetailDAO;

	@Autowired
	ProductDAO productDAO;

	@Autowired
	MailerServiceImpl mailer;

	@RequestMapping("/cart/view")
	public String view(Model model) {
		model.addAttribute("cart", cart);
		model.addAttribute("Count", cart.getCount());
		model.addAttribute("Amount", cart.getAmount());
		return "cart";
	}

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id, HttpSession session) {
		if (!session1.isUserLoggedIn(session)) {
			return "redirect:/login";
		}
		cart.add(id);
		return "redirect:/index";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{id}/{pre}")
	public String update(@PathVariable("id") Integer id, @PathVariable("pre") String pre) {
		cart.update(id, pre);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}

	@PostMapping("/checkout")
	public String checkout(@RequestParam("address") String address, Model model) {

		// Lưu order
		Account user = session1.get("user");
		Order order = new Order();
		order.setAccountID(user.getUsername());
		order.setCreateDate(new Date());
		order.setAddress(address);
		orderDAO.save(order);

		// Gửi mail
		NumberFormat currencyFormat = NumberFormat.getCurrencyInstance(new Locale("vi", "VN"));
		MailerHelper helper = new MailerHelper();
		String[] emailCC = helper.parseStringEmailToArray(user.getEmail());
		String[] emailBCC = helper.parseStringEmailToArray(user.getEmail());
		MailInfo mail = new MailInfo();
		mail.setTo(user.getEmail());
		mail.setCc(emailCC);
		mail.setBcc(emailBCC);
		mail.setSubject("Đơn hàng đã được thanh toán thành công!");
		mail.setBody("Tổng số lượng: " + cart.getCount() + "  " + "Tổng giá: " + currencyFormat.format(cart.getAmount())
				+ " :: " + " Chi tiết sản phẩm: ");

		// Lưu orderDetail
		List<Integer> ids = cart.getAllIds();
		for (Integer id : ids) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setOrderID(order.getId());
			orderDetail.setProductID(id);
			orderDetail.setPrice(cart.getPrice(id) * cart.getQty(id));
			orderDetail.setQuantity(cart.getQty(id));
			orderDetailDAO.save(orderDetail);

			String productInfo = "x" + cart.getQty(id) + " " + cart.getName(id) + " "
					+ currencyFormat.format(cart.getPrice(id)) + " :: ";
			mail.setBody(mail.getBody() + productInfo);
		}
		try {
			mailer.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		cart.clear();
		return "redirect:/cart/view";
	}

}
