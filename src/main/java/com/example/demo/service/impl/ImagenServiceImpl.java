package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.example.demo.dao.IImagenRepository;
import com.example.demo.model.Imagen;
import com.example.demo.service.IImagenService;

@Service
public class ImagenServiceImpl implements IImagenService {

	@Autowired
	private IImagenRepository imagenRepository;

	@Override
	public Imagen save(Imagen imagen) {
		return imagenRepository.save(imagen);
	}

	@Override
	public Boolean delete(int id) {
		if (imagenRepository.existsById(id)) {
			imagenRepository.deleteById(id);
			return true;
		}
		return false;
	}

	@Override
	public Imagen update(Imagen imagen) {
		return imagenRepository.save(imagen);
	}

	@Override
	public Imagen findById(int id) {
		return imagenRepository.findById(id).get();
	}

	@Override
	public Collection<Imagen> findAllByIdEvento(int id) {
		List<Imagen> itr = new ArrayList<>();
		for (Imagen i : imagenRepository.findAll()) {
			if (i.getIdEvento() == id) {
				itr.add(i);
			}
		}
		return itr;
	}

}
