package com.example.demo.dao;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.model.Comentario;

public interface IComentarioRepository extends CrudRepository<Comentario, Integer> {

}
