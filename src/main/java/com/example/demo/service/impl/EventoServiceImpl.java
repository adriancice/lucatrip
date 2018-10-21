package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
		ArrayList<Evento> lista = (ArrayList<Evento>) eventoRepository.findAll();
		Collection<Evento> listaAlReves = new ArrayList<>();
		for (int i = lista.size(); i-- > 0;) {
			listaAlReves.add(lista.get(i));
		}

		return listaAlReves;
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

	@Override
	public Page<Evento> findAll(Pageable pageable) {
		return eventoRepository.findAll(pageable);
	}

	@Override
	public List<Evento> serchEvento(String pais, String ciudad, String sitio) {
		Optional<List<Evento>> searchEvento = eventoRepository.findbyPaisCiudadSitio(pais, ciudad, sitio);
		if (searchEvento.isPresent()) {
			return searchEvento.get();
		}
		return null;
	}

	@Override
	public List<Evento> serchEvento(String pais, String ciudad) {

		Optional<List<Evento>> searchEvento = eventoRepository.findbyPaisCiudadSitio(pais, ciudad);
		if (searchEvento.isPresent()) {
			return searchEvento.get();
		}
		return null;
	}

	@Override
	public List<Evento> serchEvento(String pais) {

		Optional<List<Evento>> searchEvento = eventoRepository.findbyPaisCiudadSitio(pais);
		if (searchEvento.isPresent()) {
			return searchEvento.get();
		}
		return null;
	}
}
