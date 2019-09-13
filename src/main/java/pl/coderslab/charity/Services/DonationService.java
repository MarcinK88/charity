package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Models.User;

import java.util.List;

public interface DonationService {

    void save(Donation donation);
    Long getQuantityDonations();
    Long getQuantityUserDonations(User user);

    List<Donation> findAll();

    void pickUp(boolean pickedup, long id);

    Donation find(int id);

    List<Donation> findAllOfUser(User user);
}
