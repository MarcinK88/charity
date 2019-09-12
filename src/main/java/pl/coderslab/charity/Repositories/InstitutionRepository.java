package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.Models.Institution;

import java.util.List;

public interface InstitutionRepository extends JpaRepository<Institution,Long> {

    @Query("SELECT i from Institution i")
    List<Institution> findAll();

    @Query("SELECT i from Institution i where i.id = ?1" )
    Institution findById(long id);

}
