package com.example.demo.service;

import java.util.ArrayList;

import com.example.demo.model.Like;

public interface ILikeService {

	Like save(Like like);

	Boolean delete(int id);

	Like update(Like like);

	Like findById(int id);

	ArrayList<Like> findLikesByIdEvento(int id_evento);

}
