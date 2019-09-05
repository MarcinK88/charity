package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.User;

public interface UserService {

    void save(User user);
    User newUser();
}
