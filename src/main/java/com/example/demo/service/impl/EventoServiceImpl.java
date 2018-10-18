package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

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
	public int add(Evento evento) {
		eventoRepository.save(evento);
		return evento.getIdEvento();
	}

	@Override
	public Collection<Evento> findAll() {
		Iterable<Evento> itr = eventoRepository.findAll();
		return (Collection<Evento>) itr;
	}

	@Override
	public Boolean delete(int id) {
		if (eventoRepository.existsById(id)) {
			eventoRepository.deleteById(id);
			return true;
		}
		return false;
	}

	@Override
	public Evento save(Evento evento) {
		return eventoRepository.save(evento);
	}

	@Override
	public Evento update(Evento evento) {
		return eventoRepository.save(evento);
	}

	@Override
	public Evento findById(int id) {
		return eventoRepository.findById(id).get();
	}

	@Override
	public List<Evento> findAllById(int id) {
		List<Evento> eventos = new ArrayList<>();
		for (Evento e : eventoRepository.findAll()) {
			if (e.getIdUser() == id) {
				eventos.add(e);
			}
		}
		return eventos;
	}

}
