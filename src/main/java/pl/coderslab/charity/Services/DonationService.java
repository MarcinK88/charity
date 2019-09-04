package pl.coderslab.charity.Services;

import pl.coderslab.charity.Models.Donation;

public interface DonationService {

    //sygnatury metod które chce użyć np getemptydonation

    void save(Donation donation);
    int getQuantityDonations();


}
