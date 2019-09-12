package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.Institution;

import java.util.List;

public interface InstitutionService {

    List<Institution> findAll();
    long quantityInstitutions();

    Institution findById(long id);

    void save(Institution institution);

    void delete(Institution institution);
}
