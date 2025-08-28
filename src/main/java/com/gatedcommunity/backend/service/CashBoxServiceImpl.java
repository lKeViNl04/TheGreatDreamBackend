package com.gatedcommunity.backend.service;

import com.gatedcommunity.backend.entity.dto.CashBoxDTO;
import com.gatedcommunity.backend.entity.CashBox;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.mapper.CashBoxMapper;
import com.gatedcommunity.backend.repository.CashBoxRepository;
import com.gatedcommunity.backend.service.interfaces.CashBoxService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CashBoxServiceImpl implements CashBoxService {

    private final CashBoxRepository cashBoxRepository;
    private final CashBoxMapper cashBoxMapper;

    public CashBoxServiceImpl(CashBoxRepository cashBoxRepository, CashBoxMapper cashBoxMapper) {
        this.cashBoxRepository = cashBoxRepository;
        this.cashBoxMapper = cashBoxMapper;
    }

    //Method implement
    @Override
    public List<CashBoxDTO> getAll() {
        return cashBoxRepository.findAll()
                .stream()
                .map(cashBoxMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public CashBoxDTO getById(Long id) {
        CashBox cashBox = cashBoxRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Caja chica no encontrada con ID: " + id));
        return cashBoxMapper.toDTO(cashBox);
    }

    @Override
    public CashBoxDTO create(CashBoxDTO dto) {
        CashBox box = cashBoxMapper.toEntity(dto);
        return cashBoxMapper.toDTO(cashBoxRepository.save(box));
    }

    @Override
    public CashBoxDTO update(Long id, CashBoxDTO dto) {
        CashBox existing = cashBoxRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Caja chica no encontrada con ID: " + id));

        existing.setMonth(dto.month);
        existing.setYear(dto.year);
        existing.setAmountCollected(dto.amountCollected);
        existing.setTotalSpent(dto.totalSpent);
        existing.setBalance(dto.balance);

        return cashBoxMapper.toDTO(cashBoxRepository.save(existing));
    }

    @Override
    public void delete(Long id) {
        if (!cashBoxRepository.existsById(id)) {
            throw new ResourceNotFoundException("Caja chica no encontrada con ID: " + id);
        }
        cashBoxRepository.deleteById(id);
    }
}
