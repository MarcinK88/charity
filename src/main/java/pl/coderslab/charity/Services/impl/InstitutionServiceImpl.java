package pl.coderslab.charity.Services.impl;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.Institution;
import pl.coderslab.charity.Repositories.InstitutionRepository;
import pl.coderslab.charity.Services.InstitutionService;

import java.util.List;

@Service
public class InstitutionServiceImpl implements InstitutionService {

    private InstitutionRepository institutionRepository;

    public InstitutionServiceImpl(InstitutionRepository institutionRepository) {
        this.institutionRepository = institutionRepository;
    }

    @Override
    public List<Institution> findAll() {
        return institutionRepository.findAll();
    }

    @Override
    public long quantityInstitutions() {
        return institutionRepository.count();
    }

    @Override
    public Institution findById(long id) {
        return institutionRepository.findById(id);
    }

    @Override
    public void save(Institution institution) {
        institutionRepository.save(institution);
    }

    @Override
    public void delete(Institution institution) {
        institutionRepository.delete(institution);
    }
}
