package com.example.demo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IEventoRepository;
import com.example.demo.model.Evento;
import com.example.demo.service.IEventoService;

@Service
public class EventoServiceImpl implements IEventoService {

	
	@Autowired
	private IEventoRepository eventoRepository;

	@Override
	public void add(Evento evento) {
	eventoRepository.save(evento);
	}
}
