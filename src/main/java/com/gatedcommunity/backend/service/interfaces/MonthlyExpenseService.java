package com.gatedcommunity.backend.service.interfaces;

import com.gatedcommunity.backend.entity.dto.MonthlyExpenseDTO;

import java.util.List;

public interface MonthlyExpenseService {
    List<MonthlyExpenseDTO> getAll();
    MonthlyExpenseDTO getById(Long id);
    MonthlyExpenseDTO create(MonthlyExpenseDTO dto);
    MonthlyExpenseDTO update(Long id, MonthlyExpenseDTO dto);
    void delete(Long id);
}
