package pl.coderslab.charity.Services;

import org.springframework.security.core.userdetails.UserDetails;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.UserRoles;

import java.util.List;

public interface UserService {

    void saveNewUser(User user);

    void update(User user, String username);

    User newUser();
    UserDetails loadUserByUsername(String username);
    void save(User user);
    boolean comparePassword(String oldpwd, String newpwd);
    User find(String username);

    Long quantityUsers(UserRoles userRoles);

    List<User> findAll();

    List<User> findAllByUserRoles(UserRoles role);

    User findById(long id);

    void delete(User user);

    void saveAdmin(User user);

    void enableByToken(String token);

    void createPasswordResetTokenForUser(User user);
    void register(User user);
}
