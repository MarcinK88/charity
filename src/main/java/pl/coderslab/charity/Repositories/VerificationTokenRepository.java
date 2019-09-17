package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.Models.User;
import pl.coderslab.charity.Models.VerificationToken;

public interface VerificationTokenRepository extends JpaRepository<VerificationToken, Long> {


    VerificationToken getByUser(User user);

    @Query("select t from VerificationToken t where token = ?1")
    VerificationToken findByToken(String token);
}
