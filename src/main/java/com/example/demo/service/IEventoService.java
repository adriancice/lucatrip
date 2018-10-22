package com.example.demo.service;

import java.util.Collection;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.example.demo.model.Evento;

public interface IEventoService {

	int add(Evento evento);

	Boolean delete(int id);

	Evento save(Evento evento);

	Evento update(Evento evento);

	Evento findById(int id);

	Collection<Evento> findAll();

	Collection<Evento> findAllById(int id);

	Page<Evento> findAll(Pageable pageable);

	List<Evento> serchEvento(String pais, String ciudad, String sitio);

	List<Evento> serchEvento(String pais, String ciudad);
	
	List<Evento> serchEvento(String pais);

	List<Evento> findEventosByUserLike(int id_user);

}
