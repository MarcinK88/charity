package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.Models.User;

public interface UserRepository extends JpaRepository<User,Long> {
}