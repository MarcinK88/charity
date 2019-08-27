package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.Models.Donation;

public interface DonationRepository extends JpaRepository<Donation,Long> {
}
