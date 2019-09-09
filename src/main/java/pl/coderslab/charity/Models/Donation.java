package pl.coderslab.charity.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;
import java.time.LocalDate;
import java.util.Date;
import java.util.Set;

@Entity
@Data
@AllArgsConstructor
public class Donation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private int quantity;

    @OneToMany
    private Set<Category> categories;

    @ManyToOne
    private Institution institution;

    @ManyToOne
    private User user;

    private String street;

    private String city;

    private String zipcode;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate pickUpDate;

    @Temporal(TemporalType.TIME)
    @DateTimeFormat(pattern = "HH:mm")
    private Date pickUpTime;

    private String pickUpComment;

    private String phone;

    public Donation() {
    }

    public Donation(int quantity, Set<Category> categories, Institution institution, String street, String city, String zipcode, LocalDate pickUpDate, Date pickUpTime, String pickUpComment, String phone, User user) {
        this.quantity = quantity;
        this.categories = categories;
        this.institution = institution;
        this.street = street;
        this.city = city;
        this.zipcode = zipcode;
        this.pickUpDate = pickUpDate;
        this.pickUpTime = pickUpTime;
        this.pickUpComment = pickUpComment;
        this.phone = phone;
        this.user = user;
    }


}

