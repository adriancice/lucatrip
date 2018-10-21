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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.User;
import com.example.demo.service.IEventoService;
import com.example.demo.service.IUserSevice;
import com.example.demo.util.Pattern;
import com.example.demo.util.SHA_512;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private IEventoService eventoService;

	@Autowired
	private IUserSevice userService;

	private HttpSession session;

	/*
	 * Metodo para logear usuario primero tenemos que encriptar la contraseña que
	 * nos da el usuario y luego compara los usuarios y las contraseñas
	 */
	@RequestMapping(value = "/loginUser", method = RequestMethod.POST)
	public ModelAndView loginUser(HttpServletRequest req) {
		session = req.getSession(true);
		logger.info("loginUser");
		ModelAndView modelAndView = new ModelAndView();
		String email = req.getParameter("email");
		String pass = req.getParameter("password");
		SHA_512 sha512 = new SHA_512();
		String hashPass = sha512.get_SHA_512_SecurePassword(pass);
		User u = userService.findByEmail(email);
		boolean exist = true;
		if (u != null && hashPass.equals(u.getPassword())) {
			modelAndView.setViewName("index");
			session.setAttribute("email", u.getEmail());
			session.setAttribute("name", u.getName());
			session.setAttribute("surname", u.getSurname());
			session.setAttribute("fecha", u.getCreateAt());
			session.setAttribute("user", u);
			modelAndView.addObject("listaEventos", eventoService.findAll());

		} else {
			modelAndView.setViewName("login");
			exist = false;
		}
		req.setAttribute("exist", exist);
		return modelAndView;

	}

	/*
	 * /* metodo para registrar un usuario
	 */
	@RequestMapping(value = "/registerUser", method = RequestMethod.POST)
	public ModelAndView registerUser(HttpServletRequest req, @RequestParam("file") MultipartFile foto) {
		logger.info("registerUser");
		ModelAndView modelAndView = new ModelAndView();
		String existe = "si";
		String mensaje = "";
		String mensageFoto = "";
		modelAndView.setViewName("register");
		String pass = req.getParameter("password");
		User u = userService.findByEmail(req.getParameter("email"));
		if (!pass.matches(Pattern.password)) {
			mensaje += "La contraseña está en formato incorrecta mayor que 6 caracteres \n";
		}

		SHA_512 sha512 = new SHA_512();
		String hashPass = sha512.get_SHA_512_SecurePassword(pass);

		if (u == null) {
			User user = new User(req.getParameter("name"), req.getParameter("surname"), hashPass,
					req.getParameter("email"));
			// si hay foto la añadimos
			if (!foto.isEmpty()) {
				Path directorioRecursos = Paths.get("src//main//webapp//images/user");
				String rootPath = directorioRecursos.toFile().getAbsolutePath();
				try {
					byte[] bytes = foto.getBytes();
					Path rutaCompleta = Paths.get(rootPath + "/" + foto.getOriginalFilename());
					Files.write(rutaCompleta, bytes);
					mensageFoto = "Has subido ok (" + foto.getOriginalFilename() + ")";
					user.setFoto(foto.getOriginalFilename());
				} catch (IOException e) {
					System.err.println("error foto");
					e.printStackTrace();
				}
			}else {
				user.setFoto("userFoto.jpg");
			}
			userService.save(user);
			mensaje = "Genial! Te has registrado perfectamente";
			existe = "no";
		} else {
			mensaje += "El correo ya existe \n";
		}
		req.setAttribute("mensaje", mensaje);
		req.setAttribute("existe", existe);
		req.setAttribute("mensageFoto", mensageFoto);
		return modelAndView;
	}

}
