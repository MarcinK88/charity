package pl.coderslab.charity.Models;

import lombok.Data;
import pl.coderslab.charity.Validations.FieldMatch;


import javax.persistence.*;
import javax.validation.Valid;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


@Entity
@Data
@FieldMatch(first = "password", second = "confirmPassword", message = "Pola musza być takie same")
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String username;

    @NotEmpty(message = "pole nie może byc puste")
    private String password;

    private String name;

    private String surname;

    @Transient
    private String confirmPassword;

    private boolean enabled;

    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name ="userRoles_userRoleId",referencedColumnName = "user_role_id")
    private UserRoles userRoles;

    public User() {
    }


    public User(String username, String password, String confirmPassword, boolean enabled, UserRoles userRoles, String name, String surname) {
        this.username = username;
        this.password = password;
        this.confirmPassword = confirmPassword;
        this.enabled = false;
        this.userRoles = userRoles;
        this.name = name;
        this.surname = surname;

    }

    public String getUserRolesName() {
        return userRoles.getRole();
    }

}
