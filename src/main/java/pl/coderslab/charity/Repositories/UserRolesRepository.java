package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.UserRoles;

public interface UserRolesRepository extends JpaRepository<UserRoles, Integer> {
}
