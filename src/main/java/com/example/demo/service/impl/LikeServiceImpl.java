package com.example.demo.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dao.ILikeRepository;
import com.example.demo.model.Evento;
import com.example.demo.model.Like;
import com.example.demo.service.ILikeService;

@Service
public class LikeServiceImpl implements ILikeService {

	@Autowired
	private ILikeRepository likeRepository;

	@Override
	public Like save(Like like) {
		return likeRepository.save(like);
		
	}

	@Override
	public Boolean delete(int id) {
		if (likeRepository.existsById(id)) {
			likeRepository.deleteById(id);
			return true;
		}
		return false;
	}

	@Override
	public Like update(Like like) {
		return likeRepository.save(like);
	}

	@Override
	public Like findById(int id) {
		return likeRepository.findById(id).get();
	}
	
	
	@Override
	public ArrayList<Like> findLikesByIdEvento(int id_evento) {
		ArrayList<Like> likes = new ArrayList<>();
		for (Like l : likeRepository.findAll()) {
			if (l.getIdEvento() == id_evento) {
				likes.add(l);
			}
		}
		return likes;	
		
	}

	@Override
	public Boolean existeLikeIdUser(int iduser, int idEvento) {
		
		for (Like l : likeRepository.findAll()) {
			if (l.getIdUser() == iduser && l.getIdEvento()  == idEvento) {
				return true;
			}
		}
		return false;
	}

}
