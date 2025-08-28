package com.gatedcommunity.backend.entity;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "cashbox_expense")
@Data
public class MonthlyExpense {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_cashbox", nullable = false)
    private CashBox cashBox;

    private String description = "New Description Expense";

    private BigDecimal amount = null;

    private LocalDate date = null;
}
