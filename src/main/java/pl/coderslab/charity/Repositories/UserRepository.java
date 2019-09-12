package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.UserRoles;

import java.util.List;

public interface UserRepository extends JpaRepository<User,Long> {

    User findByUsername(String username);

    @Query(value = "update user set username = ?1, name = ?2, surname = ?3 where username = ?4", nativeQuery = true)
    void update(String username, String name, String surname, String username_old);

    @Query("select count(u) from User u WHERE u.userRoles = ?1")
    Long countUsers(UserRoles userRoles);

    List<User> findAllByUserRoles(UserRoles role);
}
