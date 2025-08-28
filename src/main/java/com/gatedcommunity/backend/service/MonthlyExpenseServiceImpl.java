package com.gatedcommunity.backend.service;

import com.gatedcommunity.backend.entity.dto.MonthlyExpenseDTO;
import com.gatedcommunity.backend.entity.MonthlyExpense;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.mapper.MonthlyExpenseMapper;
import com.gatedcommunity.backend.repository.CashBoxRepository;
import com.gatedcommunity.backend.repository.MonthlyExpenseRepository;
import com.gatedcommunity.backend.service.interfaces.MonthlyExpenseService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MonthlyExpenseServiceImpl implements MonthlyExpenseService {

    private final MonthlyExpenseRepository expenseRepository;
    private final CashBoxRepository cashBoxRepository;
    private final MonthlyExpenseMapper monthlyExpenseMapper;

    public MonthlyExpenseServiceImpl(
            MonthlyExpenseRepository expenseRepository,
            CashBoxRepository cashBoxRepository,
            MonthlyExpenseMapper monthlyExpenseMapper) {
        this.expenseRepository = expenseRepository;
        this.cashBoxRepository = cashBoxRepository;
        this.monthlyExpenseMapper = monthlyExpenseMapper;
    }
    //
    private void setCashBoxFromDTO(MonthlyExpense expense, MonthlyExpenseDTO dto) {
        if (dto.cashBoxId != null ) {
            expense.setCashBox(cashBoxRepository.findById(dto.cashBoxId)
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Caja chica no encontrada con ID: " + dto.cashBoxId)));
        }
    }
    //Method implement
    @Override
    public List<MonthlyExpenseDTO> getAll() {
        return expenseRepository.findAll()
                .stream()
                .map(monthlyExpenseMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public MonthlyExpenseDTO getById(Long id) {
        MonthlyExpense expense = expenseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Gasto mensual no encontrado con ID: " + id));
        return monthlyExpenseMapper.toDTO(expense);
    }

    @Override
    public MonthlyExpenseDTO create(MonthlyExpenseDTO dto) {
        MonthlyExpense expense = monthlyExpenseMapper.toEntity(dto);
        setCashBoxFromDTO(expense, dto);
        return monthlyExpenseMapper.toDTO(expenseRepository.save(expense));
    }

    @Override
    public MonthlyExpenseDTO update(Long id, MonthlyExpenseDTO dto) {
        MonthlyExpense existing = expenseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Gasto mensual no encontrado con ID: " + id));
        existing.setDescription(dto.description);
        existing.setAmount(dto.amount);
        existing.setDate(dto.date);
        setCashBoxFromDTO(existing, dto);
        return monthlyExpenseMapper.toDTO(expenseRepository.save(existing));
    }

    @Override
    public void delete(Long id) {
        if (!expenseRepository.existsById(id)) {
            throw new ResourceNotFoundException("Gasto mensual no encontrado con ID: " + id);
        }
        expenseRepository.deleteById(id);
    }
}
