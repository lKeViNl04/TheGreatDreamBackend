package com.gatedcommunity.backend.controller;

import com.gatedcommunity.backend.entity.dto.MonthlyFeeDTO;
import com.gatedcommunity.backend.service.interfaces.MonthlyFeeService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/fees")
public class MonthlyFeeController {
    private final MonthlyFeeService feeService;

    public MonthlyFeeController(MonthlyFeeService feeService) {
        this.feeService = feeService;
    }

    @GetMapping
    public ResponseEntity<List<MonthlyFeeDTO>> getAll() {
        return ResponseEntity.ok(feeService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<MonthlyFeeDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(feeService.getById(id));
    }

    @PostMapping
    public ResponseEntity<MonthlyFeeDTO> create(@RequestBody MonthlyFeeDTO dto) {
        return ResponseEntity.status(201).body(feeService.create(dto));
    }

    @PutMapping("/{id}")
    public ResponseEntity<MonthlyFeeDTO> update(@PathVariable Long id, @RequestBody MonthlyFeeDTO dto) {
        return ResponseEntity.ok(feeService.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        feeService.delete(id);
        return ResponseEntity.noContent().build();
    }

}
