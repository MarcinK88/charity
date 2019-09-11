package pl.coderslab.charity.Services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.UserRoles;
import pl.coderslab.charity.Repositories.UserRolesRepository;
import pl.coderslab.charity.Services.UserRolesService;
@Service
public class UserRolesServiceImpl implements UserRolesService {

    private final UserRolesRepository userRolesRepository;

    public UserRolesServiceImpl(UserRolesRepository userRolesRepository) {
        this.userRolesRepository = userRolesRepository;
    }


    @Override
    public UserRoles getUserRole(int id) {
        return userRolesRepository.getOne(id);
    }

    @Override
    public int getId(String role) {
        return userRolesRepository.getId(role);
    }

    @Override
    public UserRoles findByRole(String role) {
        return userRolesRepository.findByRole(role);
    }
}
