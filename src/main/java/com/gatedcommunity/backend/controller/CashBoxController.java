package com.gatedcommunity.backend.controller;

import com.gatedcommunity.backend.entity.dto.CashBoxDTO;
import com.gatedcommunity.backend.service.interfaces.CashBoxService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/cashbox")
public class CashBoxController{
    private final CashBoxService cashBoxService;

    public CashBoxController(CashBoxService cashBoxService) {
        this.cashBoxService = cashBoxService;
    }

    @GetMapping
    public ResponseEntity<List<CashBoxDTO>> getAll() {
        return ResponseEntity.ok(cashBoxService.getAll());
    }

    @GetMapping("/{id}")
    public ResponseEntity<CashBoxDTO> getById(@PathVariable Long id) {
        return ResponseEntity.ok(cashBoxService.getById(id));
    }

    @PostMapping
    public ResponseEntity<CashBoxDTO> create(@RequestBody CashBoxDTO dto) {
        return ResponseEntity.status(201).body(cashBoxService.create(dto));
    }

    @PutMapping("/{id}")
    public ResponseEntity<CashBoxDTO> update(@PathVariable Long id, @RequestBody CashBoxDTO dto) {
        return ResponseEntity.ok(cashBoxService.update(id, dto));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        cashBoxService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
