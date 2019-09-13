package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.Models.Donation;

public interface DonationRepository extends JpaRepository<Donation,Long> {

    @Query("SELECT SUM(d.quantity) from Donation d")
    Long getQuantityDonations();

    @Query("SELECT SUM(d.quantity) from Donation d where user_id = ?1")
    Long getQuantityUserDonations(Long user_id);


    Donation findById(long id);
}
