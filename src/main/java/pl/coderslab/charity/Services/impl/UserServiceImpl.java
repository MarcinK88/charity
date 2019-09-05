package pl.coderslab.charity.Services.impl;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Repositories.UserRepository;
import pl.coderslab.charity.Services.UserService;

@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;

    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Override
    public void save(User user) {
        userRepository.save(user);
    }

    @Override
    public User newUser() {
        return new User();
    }
}
