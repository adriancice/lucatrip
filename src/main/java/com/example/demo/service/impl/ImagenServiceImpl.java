package com.example.demo.service.impl;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.IEventoRepository;
import com.example.demo.dao.IImagenRepository;
import com.example.demo.model.Evento;
import com.example.demo.model.Imagen;
import com.example.demo.service.IImagenService;

@Service
public class ImagenServiceImpl implements IImagenService {

	

	@Autowired
	private IImagenRepository imagenRepository;

	@Override
	public void save(Imagen imagen) {
		imagenRepository.save(imagen);
	}

	
	
}
