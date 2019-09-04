package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.Donation;

public interface DonationService {

    void save(Donation donation);
    int getQuantityDonations();


}
