package com.example.demo.service;

import java.util.Collection;
import java.util.List;

import com.example.demo.model.Evento;

public interface IEventoService {

	int add(Evento evento);

	Boolean delete(int id);

	Evento save(Evento evento);

	Evento update(Evento evento);

	Evento findById(int id);

	Collection<Evento> findAll();
	
	List<Evento> findAllById(int id);


}
