package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;

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
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserSevice userService;

	/*
	 * /* metodo para registrar un usuario
	 */
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public ModelAndView registerUser(HttpServletRequest req) {
		logger.info("registerUser");
		String mensaje = "";
		ModelAndView modelAndView = new ModelAndView();
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
			mensaje = "Usuario registrado correctamente !";
		} else {
			mensaje = "Email ya registrado !";
		}
		req.setAttribute("mensaje", mensaje);
		return modelAndView;
	}

}
