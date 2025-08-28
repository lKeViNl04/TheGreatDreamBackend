package com.gatedcommunity.backend.entity.dto;
import java.math.BigDecimal;
import java.time.LocalDate;

public class MonthlyExpenseDTO {
    public Long id; // opcional si es POST
    public Long cashBoxId;
    public String description;
    public BigDecimal amount;
    public LocalDate date;
}

