package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.IEventoService;
import com.example.demo.service.IUserSevice;

@Controller
public class GlobalController {

	private static final Logger logger = LoggerFactory.getLogger(GlobalController.class);

	@Autowired
	private IEventoService eventoService;

	@Autowired
	private IUserSevice userService;

	@RequestMapping("/")
	public ModelAndView index(HttpServletRequest req) {
		logger.info("index");
		HttpSession session = req.getSession(true);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("index");
		modelAndView.addObject("listaEventos", eventoService.findAll());
		session.setAttribute("mensaje", "");

		return modelAndView;
	}

	@RequestMapping("/crearEvento")
	public ModelAndView crearEvento(HttpServletRequest req) {
		logger.info("crearEvento");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("crearEvento");
		return modelAndView;
	}

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

	@RequestMapping("/verPerfil")
	public ModelAndView verPerfil(HttpServletRequest req) {
		logger.info("verPerfil");
		HttpSession session = req.getSession(true);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("verPerfil");
		User user = (User) session.getAttribute("user");
		modelAndView.addObject("user", userService.findById(user.getIdUser()));
		return modelAndView;
	}

	@RequestMapping("/verMisEventos")
	public ModelAndView verMisEventos(HttpServletRequest req) {
		logger.info("verMisEventos");
		HttpSession session = req.getSession(true);
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) session.getAttribute("user");
		modelAndView.addObject("listarMisEventos", eventoService.findAllById(user.getIdUser()));
		if (eventoService.findAllById(user.getIdUser()).isEmpty()) {
			modelAndView.addObject("mensajeNoEventos", "No tienes ningun evento creado !");
		}
		modelAndView.setViewName("verMisEventos");
		return modelAndView;
	}

	@RequestMapping("/paginator")
	public ModelAndView paginator(HttpServletRequest req) {
		logger.info("paginator");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("paginator");
		return modelAndView;
	}

	

	@RequestMapping("/verGustados")
	public ModelAndView verGustados(HttpServletRequest req) {
		logger.info("verGustados");
		HttpSession session = req.getSession(true);
		ModelAndView modelAndView = new ModelAndView();
		User user = (User) session.getAttribute("user");
		modelAndView.addObject("eventosGustados", eventoService.findEventosByUserLike((user.getIdUser())));
		modelAndView.setViewName("verGustados");
		return modelAndView;
	}
	
}
