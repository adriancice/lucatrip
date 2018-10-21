package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Comentario;
import com.example.demo.model.Evento;
import com.example.demo.model.Like;
import com.example.demo.model.User;
import com.example.demo.service.IComentarioService;
import com.example.demo.service.IEventoService;
import com.example.demo.service.ILikeService;
import com.example.demo.service.IUserSevice;

@Controller
public class EventoController {

	private static final Logger logger = LoggerFactory.getLogger(EventoController.class);
	@Autowired
	private IEventoService eventoService;

	@Autowired
	private IComentarioService comentarioService;

	@Autowired
	private ILikeService likeService;
	
	@Autowired
	private IUserSevice userService;

	@RequestMapping("/crearEventoNuevo")
	public ModelAndView register(HttpServletRequest req) {
		ModelAndView modelAndView = new ModelAndView();
		logger.info("/crearEventoNuevo");
		HttpSession session = req.getSession(true);
		String mensajeEvento = "Enhorabuena, has creado un evento nuevo correctamente !";
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			modelAndView.setViewName("crearEvento");
			User user = (User) session.getAttribute("user");
			String lugar = req.getParameter("lugar");
			String latitud = (String) req.getParameter("latitud");
			String longitud = (String) req.getParameter("longitud");
			String descripcion = (String) req.getParameter("descripcion");
			String ciudad = (String) req.getParameter("ciudad");
			String pais = (String) req.getParameter("pais");
			String imagen = (String) req.getParameter("imagen");
			String fecha = (String) req.getParameter("fecha");
			String url = req.getParameter("url");
			System.err.println("url: " + url);

			String imagencortada = imagen.substring(imagen.lastIndexOf(",") + 1, imagen.length());
			System.err.println(
					"lugar " + lugar + " latitud " + latitud + " longitud " + longitud + " descripcion " + descripcion);
			System.err.println("imagen: " + imagen);
			System.err.println(imagencortada);
			System.err.println(fecha);
			String año = "";
			String mes = "";
			String dia = "";
			String hora = "";
			String minuto = "";

			String fechasubs = fecha.substring(0, fecha.lastIndexOf("T"));
			String horasubs = fecha.substring(fecha.lastIndexOf("T") + 1, fecha.length());

			StringTokenizer stfecha = new StringTokenizer(fechasubs, "-");
			StringTokenizer sthora = new StringTokenizer(horasubs, ":");

			for (int i = 0; i <= 3; i++) {
				if (i == 0) {
					año = stfecha.nextToken();
				}
				if (i == 1) {
					mes = stfecha.nextToken();
				}
				if (i == 2) {
					dia = stfecha.nextToken();
				}
			}

			for (int i = 0; i <= 2; i++) {
				if (i == 0) {
					hora = sthora.nextToken();
				}
				if (i == 1) {
					minuto = sthora.nextToken();
				}
			}
			Date fechaEvento = new Date();
			fechaEvento.setDate(Integer.parseInt(dia));
			fechaEvento.setHours(Integer.parseInt(hora));
			fechaEvento.setMinutes(Integer.parseInt(minuto));
			fechaEvento.setMonth(Integer.parseInt(mes));
			fechaEvento.setYear(Integer.parseInt(año));

			// INSERTAR EN BASE DE DATOS
			Evento evento = new Evento();
			evento.setLatitud(Double.parseDouble(latitud));
			evento.setLongitud(Double.parseDouble(longitud));
			evento.setCiudad(ciudad);
			evento.setPais(pais);
			evento.setFechaEvento(fechaEvento);
			evento.setDescripcion(descripcion);
			evento.setSitio(lugar);
			evento.setImagen(url);
			evento.setIdUser(user.getIdUser());

			eventoService.add(evento);

		} catch (Exception e) {
			mensajeEvento = "Ha ocurrido un error";
			System.out.println(e);
		}

		req.setAttribute("mensajeEvento", mensajeEvento);
		return modelAndView;

	}

	@RequestMapping("/verevento")
	public ModelAndView verevento(HttpServletRequest req, @RequestParam("id_evento") int id_evento) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		logger.info("/verevento");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("evento");
		HttpSession session = req.getSession(true);

		Evento e = eventoService.findById(id_evento);
		// conseguir likes y eventos con los repsectivos servicios
		
		//recuperamos el nombre del user con el idUser
		
		User user = userService.findById(e.getIdUser());

		ArrayList<Like> listaLikes = likeService.findLikesByIdEvento(e.getIdEvento());
		
		ArrayList<Comentario> listaComentarios = comentarioService.findComentariosByIdEvento(id_evento);

		session.setAttribute("totallikes", listaLikes.size());

		req.setAttribute("lugar", e.getSitio());
		req.setAttribute("id_evento", e.getIdEvento());
		req.setAttribute("pais", e.getPais());
		req.setAttribute("ciudad", e.getCiudad());
		req.setAttribute("latitud", e.getLatitud());
		req.setAttribute("longitud", e.getLongitud());
		req.setAttribute("descripcion", e.getDescripcion());
		req.setAttribute("imagen", e.getImagen());
		req.setAttribute("nombreUser", user.getName());
		req.setAttribute("apellidoUser", user.getSurname());

		req.setAttribute("listaLikes", listaLikes);

		req.setAttribute("listaComentarios", listaComentarios);
		return modelAndView;
	}
}
