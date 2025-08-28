package com.gatedcommunity.backend.controller;

import com.gatedcommunity.backend.entity.dto.MonthlyExpenseDTO;
import com.gatedcommunity.backend.service.interfaces.MonthlyExpenseService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/expenses")
public class MonthlyExpenseController {

    private final MonthlyExpenseService expenseService;

    public MonthlyExpenseController(MonthlyExpenseService expenseService) {
        this.expenseService = expenseService;
    }

    @GetMapping
    public ResponseEntity<List<MonthlyExpenseDTO>> getAll() {
        return ResponseEntity.ok(expenseService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<MonthlyExpenseDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(expenseService.getById(id));
    }

    @PostMapping
    public ResponseEntity<MonthlyExpenseDTO> create(@RequestBody MonthlyExpenseDTO dto) {
        return ResponseEntity.status(201).body(expenseService.create(dto));
    }

    @PutMapping("/{id}")
    public ResponseEntity<MonthlyExpenseDTO> update(@PathVariable Long id, @RequestBody MonthlyExpenseDTO dto) {
        return ResponseEntity.ok(expenseService.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        expenseService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
