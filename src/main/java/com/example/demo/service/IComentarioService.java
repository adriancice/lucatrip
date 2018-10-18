package com.example.demo.service;

import java.util.ArrayList;
import java.util.Collection;

import com.example.demo.model.Comentario;

public interface IComentarioService {

	Comentario save(Comentario comentario);

	Boolean delete(int id);

	Comentario update(Comentario comentario);

	Comentario findById(int id);
	
	Collection<Comentario> findAllById(int id);

	ArrayList<Comentario> findComentariosByIdEvento(int id_evento);

}
