package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import pl.coderslab.charity.Models.PasswordResetToken;
import pl.coderslab.charity.Models.User;

public interface PasswordResetTokenRepository extends JpaRepository<PasswordResetToken, Long> {

    @Query("select t from PasswordResetToken t where t.user = ?1")
    PasswordResetToken findByUser(User user);

    @Query("select t from PasswordResetToken t where t.token = ?1")
    PasswordResetToken findByToken(String token);
}
