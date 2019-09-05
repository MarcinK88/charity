package pl.coderslab.charity.Models;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Transient;
import javax.validation.Valid;

@Entity
@Data
public class User {

    @Id
    @GeneratedValue
    private Long id;

    private String email;

    private String password;

    @Transient
    private String confirmPassword;

    public User() {
    }

    public User(Long id, String email, String password) {
        this.id = id;
        this.email = email;
        this.password = password;
    }


}
