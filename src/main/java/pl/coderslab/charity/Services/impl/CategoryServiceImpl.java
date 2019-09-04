package pl.coderslab.charity.Services.impl;

import org.springframework.stereotype.Service;
import pl.coderslab.charity.Models.Category;
import pl.coderslab.charity.Repositories.CategoryRepository;
import pl.coderslab.charity.Services.CategoryService;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    private CategoryRepository categoryRepository;

    public CategoryServiceImpl(CategoryRepository categoryRepository) {
        this.categoryRepository = categoryRepository;
    }

    @Override
    public List<Category> findAll() {
        return categoryRepository.findAll();
    }
}
