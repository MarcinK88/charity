package pl.coderslab.charity.Models;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.*;
import javax.validation.Valid;

@Entity
@Data
public class User {


    @Id
    private String username;

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
        this.enabled = enabled;
        this.userRoles = userRoles;
        this.name = name;
        this.surname = surname;
    }
}
