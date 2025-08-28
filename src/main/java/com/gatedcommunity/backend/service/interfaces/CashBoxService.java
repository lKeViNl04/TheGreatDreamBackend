package com.gatedcommunity.backend.service.interfaces;

import com.gatedcommunity.backend.entity.dto.CashBoxDTO;

import java.util.List;

public interface CashBoxService {
    List<CashBoxDTO> getAll();
    CashBoxDTO getById(Long id);
    CashBoxDTO create(CashBoxDTO dto);
    CashBoxDTO update(Long id, CashBoxDTO dto);
    void delete(Long id);
}
