package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IComentarioRepository;
import com.example.demo.model.Comentario;
import com.example.demo.model.User;
import com.example.demo.service.IComentarioService;

@Service
public class ComentarioServiceImpl implements IComentarioService {

	@Autowired
	private IComentarioRepository comentarioRepository;

	@Override
	public Comentario save(Comentario comentario) {
		return comentarioRepository.save(comentario);
	}

	@Override
	public Boolean delete(int id) {
		if (comentarioRepository.existsById(id)) {
			comentarioRepository.deleteById(id);
			return true;
		}
		return false;
	}

	@Override
	public Comentario update(Comentario comentario) {
		return comentarioRepository.save(comentario);
	}

	@Override
	public Comentario findById(int id) {
		return comentarioRepository.findById(id).get();
	}

	@Override
	public Collection<Comentario> findAllById(int id) {
		Iterable<Comentario> itr = comentarioRepository.findAll();
		return (Collection<Comentario>) itr;
	}
	
	@Override
	public ArrayList<Comentario> findComentariosByIdEvento(int id_evento) {
		ArrayList<Comentario> itr = comentarioRepository.findByIdEvento(id_evento);
		return itr;
	}

}
