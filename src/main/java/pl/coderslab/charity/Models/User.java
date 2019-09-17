package pl.coderslab.charity.Models;

import lombok.Data;
import pl.coderslab.charity.Validations.FieldMatch;


import javax.persistence.*;
import javax.validation.Valid;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.constraints.*;


@Entity
@Data
@FieldMatch(first = "password", second = "confirmPassword", message = "Pola musza być takie same")
public class User {


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Pattern(regexp = "[_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*\\.([a-zA-Z]{2,}){1}", message = "podaj prawidłowy adres e-mail")
    private String username;

    @NotEmpty(message = "pole nie może byc puste")
    @Pattern(regexp = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$", message = "hasło musi mieć co najmniej 8 znaków, małą literę, wielką literę, cyfrę i znak specjalny")
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
