package com.example.university.controller;

import com.example.university.entity.University;
import com.example.university.service.UniversityService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/universities")
public class UniversityController {
    private final UniversityService universityService;

    public UniversityController(UniversityService universityService) {
        this.universityService = universityService;
    }

    @GetMapping
    public List<University> getAllUniversities() {
        return universityService.getAllUniversities();
    }

    @GetMapping("/{id}")
    public University getUniversityById(@PathVariable Long id) {
        return universityService.getUniversityById(id);
    }

    @PostMapping
    public University createUniversity(@RequestBody University university) {
        return universityService.saveUniversity(university);
    }

    @DeleteMapping("/{id}")
    public void deleteUniversity(@PathVariable Long id) {
        universityService.deleteUniversity(id);
    }
}
