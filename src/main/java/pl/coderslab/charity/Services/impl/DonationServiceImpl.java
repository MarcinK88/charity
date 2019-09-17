package pl.coderslab.charity.Services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Repositories.DonationRepository;
import pl.coderslab.charity.Services.DonationService;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

@Service
public class DonationServiceImpl implements DonationService {


    private DonationRepository donationRepository;

    @Autowired
    public DonationServiceImpl(DonationRepository donationRepository) {
        this.donationRepository = donationRepository;
    }

    @Override
    public void save(Donation donation) {

        Calendar calendar = Calendar.getInstance();
//        calendar.setTimeZone(TimeZone.getTimeZone("Europe/Warsaw"));
        donation.setRecordDate(calendar.getTime());
        donation.setPickedUp(false);
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

    @Override
    public void pickUp(boolean pickedup, long id) {

        Calendar calendar = Calendar.getInstance();
        Donation donation = donationRepository.findById(id);
        donation.setPickedUp(pickedup);
        donation.setPickupRealDate(calendar.getTime());



        donationRepository.save(donation);
    }

    @Override
    public Donation find(int id) {
        return donationRepository.findById(id);
    }

    @Override
    public List<Donation> findAllOfUser(User user) {
        return donationRepository.findAllofUser(user);
    }

    @Override
    public void deleteUserDonations(User user) {
        donationRepository.deleteByUser(user);
    }

    @Override
    public void delete(Donation donation) {
        donationRepository.delete(donation);
    }


}
