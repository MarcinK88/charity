package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.User;

public interface UserService {

    void saveNewUser(User user);
    User newUser();
    User loadUserByUsername(String username);
    void save(User user);
}
