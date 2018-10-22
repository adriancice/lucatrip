package com.example.demo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.buf.UDecoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.transaction.TransactionAutoConfiguration.EnableTransactionManagementConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.example.demo.model.Like;
import com.example.demo.model.User;
import com.example.demo.service.IEventoService;
import com.example.demo.service.ILikeService;

@Controller
public class LikesController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	private HttpSession session;

	@Autowired
	private IEventoService eventoService;

	@Autowired
	private ILikeService likeService;

	@RequestMapping(value = "/darlike")
	public ModelAndView cerrarSesion(HttpServletRequest req, @RequestParam("id_evento") int id_evento) {
		session = req.getSession(true);
		User u = (User) session.getAttribute("user");
		int id_user = u.getIdUser();
		boolean encontrado = false;
		logger.error("darlike");
		ModelAndView modelAndView = new ModelAndView();
		// modelAndView.setViewName("evento");
//		modelAndView.addObject("id_evento", id_evento);
		modelAndView.setView(new RedirectView("verevento?id_evento=" + id_evento + "", true));
		String mensaje = "eeeee";
		ArrayList<Like> listaLikes = likeService.findLikesByIdEvento(id_evento);

		boolean existe = likeService.existeLikeIdUser(id_user, id_evento);
		
		if(!existe) {
			Like like = new Like();
			like.setIdEvento(id_evento);
			like.setIdUser(id_user);
			likeService.save(like);
			mensaje="Votado con éxito";
			System.err.println("Like añadido");
		}else {
			mensaje="Ya has votado este evento anteriormente";
			System.err.println("Ya has votado");
		}
		session.setAttribute("mensaje", mensaje);
		return modelAndView;
	}

}
