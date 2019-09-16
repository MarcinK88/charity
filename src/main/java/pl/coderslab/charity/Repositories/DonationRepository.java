package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.Models.Donation;
import pl.coderslab.charity.Models.User;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation,Long> {

    @Query("SELECT SUM(d.quantity) from Donation d")
    Long getQuantityDonations();

    @Query("SELECT SUM(d.quantity) from Donation d where user_id = ?1")
    Long getQuantityUserDonations(Long user_id);


    Donation findById(long id);

    @Query("Select d from Donation d where d.user = ?1")
    List<Donation> findAllofUser(User user);

    @Query("delete from Donation d where d.user = ?1")
    void deleteByUser(User user);
}
