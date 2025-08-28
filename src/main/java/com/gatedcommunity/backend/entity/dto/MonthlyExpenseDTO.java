package com.gatedcommunity.backend.entity.dto;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Data
public class MonthlyExpenseDTO {
    private  Long id;
    private  Long cashBoxId;
    private  String description;
    private  BigDecimal amount;
    private  LocalDate date;
}

