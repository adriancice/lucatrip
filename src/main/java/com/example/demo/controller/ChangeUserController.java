package com.example.demo.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.IEventoService;
import com.example.demo.service.IUserSevice;
import com.example.demo.util.SHA_512;

@Controller
public class ChangeUserController {
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	private HttpSession session;

	@Autowired
	private IUserSevice userService;
	
	@Autowired
	private IEventoService eventoService;
	
	@RequestMapping(value="/modificarPerfil")
	public ModelAndView modificarUser(HttpServletRequest req) {
		session=req.getSession(true);
		logger.error("modificarPerfil");
		ModelAndView modelAndView=new ModelAndView("modificarPerfil");
		session.getAttribute("name");
		session.getAttribute("surname");
		return modelAndView;
	}
	@RequestMapping(value="/changeImage")
	public ModelAndView changeImage(HttpServletRequest req, @RequestParam("file") MultipartFile foto) {
		session=req.getSession(true);
		logger.error("changeImage");
		User user = (User) session.getAttribute("user");
		ModelAndView modelAndView=new ModelAndView("modificarPerfil");
		if (!foto.isEmpty()) {
			Path directorioRecursos = Paths.get("src//main//webapp//images/user");
			String rootPath = directorioRecursos.toFile().getAbsolutePath();
			try {
				byte[] bytes = foto.getBytes();
				Path rutaCompleta = Paths.get(rootPath + "/" + foto.getOriginalFilename());
				Files.write(rutaCompleta, bytes);
				user.setFoto(foto.getOriginalFilename());
			} catch (IOException e) {
				System.err.println("error foto");
				e.printStackTrace();
			}
		}else {
			user.setFoto("userFoto.jpg");
		}
		
		userService.update(user);
		session.setAttribute("user", user);
		
		return modelAndView;
	}

	@RequestMapping(value="/changeName")
	public ModelAndView changeName(HttpServletRequest req) {
		session=req.getSession(true);
		logger.error("changeName");
		String name=req.getParameter("name");
		String surname=req.getParameter("surname");
		User user = (User) session.getAttribute("user");
		user.setName(name);
		user.setSurname(surname);
		userService.update(user);
		session.setAttribute("name",user.getName());
		session.setAttribute("surname",user.getSurname());
		ModelAndView modelAndView=new ModelAndView("modificarPerfil");
		return modelAndView;
	}

	@RequestMapping(value="/changePassword")
	public ModelAndView changePassword(HttpServletRequest req) {
		boolean band=false;
		session=req.getSession(true);
		logger.error("changePassword");
		String old_password=req.getParameter("old_password");
		String new_password=req.getParameter("new_password");
		ModelAndView modelAndView=new ModelAndView();
		User user = (User) session.getAttribute("user");
		SHA_512 sha512 = new SHA_512();
		String new_passwordHash=sha512.get_SHA_512_SecurePassword(new_password);
		String old_passwordHash=sha512.get_SHA_512_SecurePassword(old_password);
		System.err.println(old_passwordHash+" "+user.getPassword());
		if(old_passwordHash.equals(user.getPassword())) {
			modelAndView.setViewName("index");
			modelAndView.addObject("listaEventos", eventoService.findAll());
			user.setPassword(new_passwordHash);
			userService.update(user);
			session.setAttribute("user", user);
			session.invalidate();
		}else {
			modelAndView.setViewName("modificarPerfil");
			band=true;
			req.setAttribute("band", band);
			System.out.println("Esa no es tu antigua contraseña");
		}
		
		
		return modelAndView;
	}
}
