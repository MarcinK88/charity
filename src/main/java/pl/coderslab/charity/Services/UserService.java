package pl.coderslab.charity.Services;

import org.springframework.security.core.userdetails.UserDetails;
import pl.coderslab.charity.Models.User;

public interface UserService {

    void saveNewUser(User user);

    void update(User user, String username);

    User newUser();
    UserDetails loadUserByUsername(String username);
    void save(User user);
    boolean comparePassword(String oldpwd, String newpwd);
    User find(String username);
}
