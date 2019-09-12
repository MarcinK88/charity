package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.UserRoles;

public interface UserRolesService {

    UserRoles getUserRole(int id);

    int getId(String role);

    UserRoles findByRole(String role);
}
