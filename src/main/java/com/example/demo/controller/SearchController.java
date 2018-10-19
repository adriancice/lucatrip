package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Evento;
import com.example.demo.service.IEventoService;

@Controller
public class SearchController {

	@Autowired
	private IEventoService eventoService;
	
	@RequestMapping(value="/searchEvent")
	public ModelAndView searchEvent(HttpServletRequest req) {
		boolean bandera=true;
		ModelAndView modelandView=new ModelAndView();
		String mensaje="";
		String ciudad=req.getParameter("ciudad");
		String pais=req.getParameter("pais");
		String sitio=req.getParameter("lugar");
		System.err.println("pais: "+pais+" ciudad: "+ciudad+" sitio: "+sitio );
		if(pais.equals(sitio)) {
			List<Evento> eve=eventoService.serchEvento(pais);
			if(eve == null) {
				bandera=false;
				mensaje="No hay ninguna ciudad con este nombre";
			}else {
				req.setAttribute("evento", eve);
			}
		}else if(ciudad.equals(sitio)) {
			System.err.println("entro en ciudad");
			List<Evento> eve=eventoService.serchEvento(pais, ciudad);
			if(eve == null) {
				bandera=false;
				mensaje="No hay ninguna sitio con este nombre";
			}else {
				req.setAttribute("evento", eve);
			}
			req.setAttribute("evento", eve);
		}else {
			System.err.println("entro en sitio");
			List<Evento> eve=eventoService.serchEvento(pais, ciudad, sitio);
			if(eve == null) {
				bandera=false;
				mensaje="No hay ningun sitio con este nombre";
			}else {
				req.setAttribute("evento", eve);
			}
		}
		req.setAttribute("bandera", bandera);
		req.setAttribute("mensaje", mensaje);
		System.err.println(""+bandera+" "+mensaje);
		modelandView.setViewName("eventsSearch");
		if(!bandera) {
			System.out.println("entro en el primer model and view");
			modelandView.setViewName("index");
			modelandView.addObject("listaEventos",eventoService.findAll());
		}
		return modelandView;
	}
}