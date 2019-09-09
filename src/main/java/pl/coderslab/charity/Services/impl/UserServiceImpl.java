package pl.coderslab.charity.Services.impl;

import org.springframework.security.crypto.bcrypt.BCrypt;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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

    public void saveNewUser(User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(),BCrypt.gensalt()));
        user.setConfirmPassword(BCrypt.hashpw(user.getPassword(),BCrypt.gensalt()));

        user.setEnabled(true);


    public void save(User user) {

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setConfirmPassword(user.getPassword());

        userRepository.save(user);
    }

    @Override
    public User newUser() {
        return new User();
    }

    @Override
    public User loadUserByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
