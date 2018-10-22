package com.example.demo.dao;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Evento;

public interface IEventoRepository extends PagingAndSortingRepository<Evento, Integer> {


	@Query(value="SELECT * FROM eventos WHERE pais = :pais and ciudad= :ciudad and sitio= :sitio", nativeQuery=true)
	public Optional<List<Evento>> findbyPaisCiudadSitio(@Param("pais")String pais,@Param("ciudad")String ciudad,@Param("sitio")String sitio);


	@Query(value="SELECT * FROM eventos WHERE pais = :pais and ciudad= :ciudad", nativeQuery=true)
	public Optional<List<Evento>> findbyPaisCiudadSitio(@Param("pais")String pais,@Param("ciudad")String ciudad);

	@Query(value="SELECT * FROM eventos WHERE pais = :pais", nativeQuery=true)
	public Optional<List<Evento>> findbyPaisCiudadSitio(@Param("pais")String pais);
	
	
	@Query(value="select * from eventos where id_evento in(select id_evento from likes where id_like in (select id_like from likes where id_user = :id_user))",  nativeQuery=true)
	public Optional<List<Evento>> findByUserLike(@Param("id_user")int id_user);
}

