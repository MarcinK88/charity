package pl.coderslab.charity.Models;

import lombok.Data;
import pl.coderslab.charity.Validations.FieldMatch;

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
    @GeneratedValue
    private Long id;

    private String email;

    @NotEmpty(message = "pole nie może byc puste")
    private String password;

    @Transient
    @NotEmpty(message = "pole nie może byc puste")
    private String confirmPassword;

    public User() {
    }

    public User(Long id, String email, String password, String confirmPassword) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.confirmPassword = confirmPassword;
    }


}
