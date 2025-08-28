package com.gatedcommunity.backend.service.interfaces;

import com.gatedcommunity.backend.entity.dto.MonthlyFeeDTO;

import java.util.List;

public interface MonthlyFeeService {
    List<MonthlyFeeDTO> getAll();
    MonthlyFeeDTO getById(Long id);
    MonthlyFeeDTO create(MonthlyFeeDTO dto);
    MonthlyFeeDTO update(Long id, MonthlyFeeDTO dto);
    void delete(Long id);
}
