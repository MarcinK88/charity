package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.VerificationToken;

public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {


    VerificationToken getByUser(User user);

}
