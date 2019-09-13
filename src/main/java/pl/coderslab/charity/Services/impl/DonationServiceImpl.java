package pl.coderslab.charity.Services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Repositories.DonationRepository;
import pl.coderslab.charity.Services.DonationService;

import java.util.List;

@Service
public class DonationServiceImpl implements DonationService {


    private DonationRepository donationRepository;

    @Autowired
    public DonationServiceImpl(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @Override
    public void save(Donation donation) {
        donationRepository.save(donation);
    }

    @Override
    public Long getQuantityDonations() {

        Long quantity = donationRepository.getQuantityDonations();

        if(quantity!=null){
            return quantity;
        } else {
            return 0L;
        }
    }

    @Override
    public Long getQuantityUserDonations(User user) {

        Long quantity = donationRepository.getQuantityUserDonations(user.getId());

        if(quantity!=null){
            return quantity;
        } else {
            return 0L;
        }
    }

    @Override
    public List<Donation> findAll() {
        return donationRepository.findAll();
    }


}
