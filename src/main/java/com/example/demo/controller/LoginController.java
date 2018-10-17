package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.IUserSevice;
import com.example.demo.util.SHA_512;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private IUserSevice userService;

	private HttpSession session;

	/*
	 * Metodo para logear usuario primero tenemos que encriptar la contraseña que
	 * nos da el usuario y luego compara los usuarios y las contraseñas
	 */
	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public ModelAndView loginUser(HttpServletRequest req) {
		session = req.getSession(true);
		logger.info("loginUser");
		ModelAndView modelAndView = new ModelAndView();
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		SHA_512 sha512 = new SHA_512();
		String hashPass = sha512.get_SHA_512_SecurePassword(pass);
		User u = userService.findByEmail(email);
		if (email.equals(u.getEmail()) && hashPass.equals(u.getPassword())) {
			modelAndView.setViewName("index");
			session.setAttribute("email", u.getEmail());
			session.setAttribute("name", u.getName());
			session.setAttribute("surname", u.getSurname());
		} else {
			modelAndView.setViewName("login");
		}
		return modelAndView;

	}

	/*
	 * /* metodo para registrar un usuario
	 */
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public ModelAndView registerUser(HttpServletRequest req) {
		logger.info("registerUser");
		ModelAndView modelAndView = new ModelAndView();
		String existe = "si";
		modelAndView.setViewName("register");
		String pass = req.getParameter("password");
		SHA_512 sha512 = new SHA_512();
		String hashPass = sha512.get_SHA_512_SecurePassword(pass);
		System.out.println(hashPass);
		User u = userService.findByEmail(req.getParameter("email"));
		if (u == null) {
			User user = new User(req.getParameter("name"), req.getParameter("surname"), hashPass,
					req.getParameter("email"));
			userService.save(user);
			existe = "no";
		}
		req.setAttribute("existe", existe);
		return modelAndView;
	}

}
