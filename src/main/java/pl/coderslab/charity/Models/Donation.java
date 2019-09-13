package pl.coderslab.charity.Models;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.sql.Time;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
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
    private List<Category> categories;

    @ManyToOne
    private Institution institution;

    @ManyToOne
    private User user;

    private String street;

    private String city;

    private String zipcode;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pickUpDate;

    @Temporal(TemporalType.TIME)
    @DateTimeFormat(pattern = "HH:mm")
    private Date pickUpTime;

    private String pickUpComment;

    private String phone;

    @Temporal(TemporalType.TIMESTAMP)
    private Date recordDate;

    @Temporal(TemporalType.TIMESTAMP)
    private Date pickupRealDate;

    private boolean pickedUp;

    public Donation() {
    }

    public Donation(int quantity, List<Category> categories, Institution institution, String street, String city, String zipcode, Date pickUpDate, Date pickUpTime, String pickUpComment, String phone, User user, Date recordDate, Date pickupRealDate, boolean pickedUp) {
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
        this.recordDate = recordDate;
        this.pickupRealDate = pickupRealDate;
        this.pickedUp = pickedUp;
    }


}

