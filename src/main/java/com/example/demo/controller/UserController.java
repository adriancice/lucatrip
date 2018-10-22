package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.IEventoService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	private HttpSession session;

	@Autowired
	private IEventoService eventoService;

	@RequestMapping(value = "/logout")
	public ModelAndView cerrarSesion(HttpServletRequest req) {
		session = req.getSession(true);
		logger.error("logout");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		session.invalidate();
		modelAndView.addObject("listaEventos", eventoService.findAll());
		return modelAndView;
	}
}
