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

	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest req) {
		logger.info("register");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("register");
		return modelAndView;
	}

	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest req) {
		logger.info("login");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("login");
		return modelAndView;
	}
	/*
	 *  Metodo  para logear usuario primero tenemos que encriptar la contraseña que nos da el usuario
	 *  y luego compara los usuarios y las contraseñas
	 */
	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public ModelAndView loginUser(HttpServletRequest req) {
		String mensaje="";
		ModelAndView modelAndView = new ModelAndView();
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		SHA_512 sha512 = new SHA_512();
		String hashPass = sha512.get_SHA_512_SecurePassword(pass);
		User u=userService.findByEmail(email);
		if(email.equals(u.getEmail()) && hashPass.equals(u.getPassword())) {
			modelAndView.setViewName("index");
			System.err.println("acierta"+modelAndView.getViewName());
		}else {
			System.err.println("falla");
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
		String mensaje = "";
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("register");
		String pass = req.getParameter("password");
		SHA_512 sha512 = new SHA_512();
		String hashPass = sha512.get_SHA_512_SecurePassword(pass);
		System.out.println(hashPass);
		User u = userService.findByEmail(req.getParameter("email"));
		if (u == null) {
			User user = new User(req.getParameter("name"), req.getParameter("surname"), hashPass,req.getParameter("email"));
			userService.save(user);
			mensaje = "Usuario registrado correctamente !";
		} else {
			mensaje = "Email ya registrado !";
		}
		req.setAttribute("mensaje", mensaje);
		return modelAndView;
	}

}
