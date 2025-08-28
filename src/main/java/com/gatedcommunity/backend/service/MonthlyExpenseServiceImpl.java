package com.gatedcommunity.backend.service;

import com.gatedcommunity.backend.entity.dto.MonthlyExpenseDTO;
import com.gatedcommunity.backend.entity.MonthlyExpense;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.util.mapper.MonthlyExpenseMapper;
import com.gatedcommunity.backend.repository.CashBoxRepository;
import com.gatedcommunity.backend.repository.MonthlyExpenseRepository;
import com.gatedcommunity.backend.service.interfaces.MonthlyExpenseService;
import org.springframework.stereotype.Service;

import java.util.List;

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

    //private
    private void setCashBoxFromDTO(MonthlyExpense expense, MonthlyExpenseDTO dto) {
        if (dto.getCashBoxId() != null) {
            expense.setCashBox(cashBoxRepository.findById(dto.getCashBoxId())
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Cashbox not found with ID: " + dto.getCashBoxId())));
        }
    }

    private MonthlyExpense findMonthlyExpenseById(Long id) {
        return expenseRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Monthly expense not found with ID: " + id));
    }

    private void updateFromDTO(MonthlyExpense expense, MonthlyExpenseDTO dto) {
        expense.setDescription(dto.getDescription());
        expense.setAmount(dto.getAmount());
        expense.setDate(dto.getDate());
        setCashBoxFromDTO(expense, dto);
    }

    //Method implement
    @Override
    public List<MonthlyExpenseDTO> getAll() {
        return expenseRepository.findAll()
                .stream()
                .map(monthlyExpenseMapper::toDTO)
                .toList();
    }

    @Override
    public MonthlyExpenseDTO getById(Long id) {
        return monthlyExpenseMapper.toDTO(findMonthlyExpenseById(id));
    }

    @Override
    public MonthlyExpenseDTO create(MonthlyExpenseDTO dto) {
        MonthlyExpense expense = monthlyExpenseMapper.toEntity(dto);
        setCashBoxFromDTO(expense, dto);
        return monthlyExpenseMapper.toDTO(expenseRepository.save(expense));
    }

    @Override
    public MonthlyExpenseDTO update(Long id, MonthlyExpenseDTO dto) {
        MonthlyExpense expense = findMonthlyExpenseById(id);
        updateFromDTO(expense, dto);
        return monthlyExpenseMapper.toDTO(expenseRepository.save(expense));
    }

    @Override
    public void delete(Long id) {
        findMonthlyExpenseById(id);
        expenseRepository.deleteById(id);
    }
}
