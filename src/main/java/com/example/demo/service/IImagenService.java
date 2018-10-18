package com.example.demo.service;

import java.util.Collection;

import com.example.demo.model.Imagen;

public interface IImagenService {

	Imagen save(Imagen imagen);

	Boolean delete(int id);

	Imagen update(Imagen imagen);

	Imagen findById(int id);

	Collection<Imagen> findAllByIdEvento(int id);

}
