package pl.coderslab.charity.Services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCrypt;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.UserRoles;
import pl.coderslab.charity.Repositories.UserRepository;
import pl.coderslab.charity.Repositories.UserRolesRepository;
import pl.coderslab.charity.Services.UserService;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    private UserRepository userRepository;

    private final UserRolesRepository userRolesRepository;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, UserRolesRepository userRolesRepository) {
        this.userRepository = userRepository;
        this.userRolesRepository = userRolesRepository;
    }

    @Override
    public void saveNewUser(User user) {
        user.setPassword(BCrypt.hashpw(user.getPassword(), BCrypt.gensalt()));
        user.setConfirmPassword(user.getPassword());
        user.setEnabled(true);
        userRepository.save(user);
    }

    @Override
    public void save(User user) {

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setConfirmPassword(user.getPassword());
        user.setEnabled(true);
        user.setUserRoles(userRolesRepository.getOne(2));
        userRepository.save(user);
    }

    @Override
    public boolean comparePassword(String oldpwd, String newpwd) {

        return BCrypt.checkpw(newpwd, oldpwd);
    }

    @Override
    public void update(User user, String username) {

        user.setPassword(userRepository.findByUsername(username).getPassword());
        user.setConfirmPassword(userRepository.findByUsername(username).getConfirmPassword());
        user.setUserRoles(userRepository.findByUsername(username).getUserRoles());

        userRepository.save(user);
    }

    @Override
    public User newUser() {
        return new User();
    }

    @Override
    public UserDetails loadUserByUsername(String username) {

        User user = userRepository.findByUsername(username);

        org.springframework.security.core.userdetails.User.UserBuilder builder = null;

        if (user != null) {
            builder = org.springframework.security.core.userdetails.User.withUsername(username);
            builder.password(new BCryptPasswordEncoder().encode(user.getPassword()));
            builder.roles(user.getUserRoles().getRole());
        } else {
            throw new UsernameNotFoundException("User not found.");
        }

        return builder.build();

    }

    @Override
    public User find(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public Long quantityUsers(UserRoles userRoles) {
        return userRepository.countUsers(userRoles);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public List<User> findAllByUserRoles(UserRoles role) {
        return userRepository.findAllByUserRoles(role);
    }

    @Override
    public User findById(long id) {
        return userRepository.findById(id);
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }
}
