package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Evento;
import com.example.demo.model.Imagen;
import com.example.demo.service.IEventoService;
import com.example.demo.service.IImagenService;

@Controller
public class EventoController {

	private static final Logger logger = LoggerFactory.getLogger(EventoController.class);
	@Autowired
	private IEventoService eventoService;
	
	@Autowired
	private IImagenService imagenService;

	@RequestMapping("/crearEventoNuevo")
	public ModelAndView register(HttpServletRequest req) {
		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		logger.info("/crearEventoNuevo");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("crearEvento");
		HttpSession session = req.getSession(true);
		
		String lugar = req.getParameter("lugar");
		String latitud = (String)req.getParameter("latitud");
		String longitud =(String) req.getParameter("longitud");
		String descripcion = (String) req.getParameter("descripcion");
		String ciudad = (String) req.getParameter("ciudad");
		String pais = (String) req.getParameter("pais");

		String imagen = (String) req.getParameter("imagen");
		String fecha = (String) req.getParameter("fecha");
		String imagencortada = imagen.substring(imagen.lastIndexOf(",")+1, imagen.length());
		System.err.println("lugar "+ lugar+" latitud "+latitud+" longitud "+longitud + " descripcion "+descripcion);
		System.err.println(imagencortada);
		System.err.println(fecha);
		String año = "";
		String mes = "";
		String dia = "";
		String hora = "";
		String minuto = "";
		
		String fechasubs = fecha.substring(0, fecha.lastIndexOf("T"));
		String horasubs = fecha.substring(fecha.lastIndexOf("T")+1, fecha.length());

		
		StringTokenizer stfecha = new StringTokenizer(fechasubs, "-");
		StringTokenizer sthora = new StringTokenizer(horasubs, ":");
		
		for (int i = 0; i <= 3; i++) {
			if(i==0) {
				año = stfecha.nextToken();
			}if(i==1) {
				mes = stfecha.nextToken();
			}if(i==2) {
				dia = stfecha.nextToken();
			}
		}
		
		for (int i = 0; i <= 2; i++) {
			if(i==0) {
				hora = sthora.nextToken();
			}if(i==1) {
				minuto = sthora.nextToken();
		
		}
		}

		System.err.println("año "+año + " mes "+mes+ " dia "+dia);
		System.err.println("hora "+hora + " minuto "+minuto);
		System.err.println("ciudad: "+ciudad);
		System.err.println("pais: "+pais);
		
		
		
		for (int i = 0; i <= pais.length()-1; i++) {
			System.err.println(pais.charAt(i));
				
			}
		System.err.println(pais);
		
		
		Date fechaEvento = new Date();
		fechaEvento.setDate(Integer.parseInt(dia));
		fechaEvento.setHours(Integer.parseInt(hora));
		fechaEvento.setMinutes(Integer.parseInt(minuto));
		fechaEvento.setMonth(Integer.parseInt(mes));
		fechaEvento.setYear(Integer.parseInt(año));

		
		
		//INSERTAR EN BASE DE DATOS
		Evento evento = new Evento();
		evento.setLatitud(Double.parseDouble(latitud));
		evento.setLongitud(Double.parseDouble(longitud));
		evento.setCiudad(ciudad);
		evento.setPais(pais);
		evento.setFechaEvento(fechaEvento);
		evento.setDescripcion(descripcion);
		evento.setSitio(lugar);
		
		Imagen imagenobj = new Imagen();
		int id_evento = eventoService.add(evento);
		imagenobj.setImagen(imagencortada);
		imagenobj.setIdEvento(id_evento);

		imagenService.save(imagenobj);
		
		
//		evento.set
//		eventoService.add(evento);
		
		
		return modelAndView;
	



	}
}
