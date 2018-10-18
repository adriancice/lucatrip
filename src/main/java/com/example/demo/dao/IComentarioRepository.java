package com.example.demo.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Comentario;

public interface IComentarioRepository extends CrudRepository<Comentario, Integer> {

	@Query(value = "SELECT * FROM comentarios WHERE id_evento = :id_evento", nativeQuery = true) 
	public ArrayList<Comentario> findByIdEvento(@Param("id_evento")int id_evento); 
}
