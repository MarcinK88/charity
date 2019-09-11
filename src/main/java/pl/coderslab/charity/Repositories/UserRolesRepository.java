package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.UserRoles;

public interface UserRolesRepository extends JpaRepository<UserRoles, Integer> {

    @Query("select id from UserRoles u where u.role = ?1")
    int getId(String role);

    UserRoles findByRole(String role);
}
