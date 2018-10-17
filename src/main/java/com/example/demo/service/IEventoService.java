package com.example.demo.service;

import java.util.Collection;
import java.util.List;

import com.example.demo.model.Evento;

public interface IEventoService {

	void add(Evento evento);
	
	Collection<Evento> findAll();

}
