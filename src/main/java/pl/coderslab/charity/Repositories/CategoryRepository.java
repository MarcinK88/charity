package pl.coderslab.charity.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.charity.Models.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {
}
