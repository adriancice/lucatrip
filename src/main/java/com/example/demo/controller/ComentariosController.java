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
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.model.Comentario;
import com.example.demo.model.User;
import com.example.demo.service.IComentarioService;

@Controller
public class ComentariosController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	private HttpSession session;

	@Autowired
	private IComentarioService comentarioService;

	@RequestMapping(value = "/comentar")
	public ModelAndView cerrarSesion(HttpServletRequest req, @RequestParam("id_evento") int id_evento,
			@RequestParam("comentario") String comentario) {
		session = req.getSession(true);
		User u = (User) session.getAttribute("user");
		int id_user = u.getIdUser();

		Comentario nuevoComentario = new Comentario();
		nuevoComentario.setComentario(comentario);
		nuevoComentario.setIdEvento(id_evento);
		nuevoComentario.setIdUser(id_user);
		comentarioService.save(nuevoComentario);

		logger.error("comentar");
		ModelAndView modelAndView = new ModelAndView();
		// modelAndView.setViewName("evento");
//		modelAndView.addObject("id_evento", id_evento);
		modelAndView.setView(new RedirectView("verevento?id_evento=" + id_evento + "", true));

		return modelAndView;

	}
}
