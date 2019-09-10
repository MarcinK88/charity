package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Models.User;

public interface DonationService {

    void save(Donation donation);
    Long getQuantityDonations();
    Long getQuantityUserDonations(User user);
}
