package com.gatedcommunity.backend.entity;

import jakarta.persistence.*;
import lombok.Data;


import java.math.BigDecimal;

@Entity
@Table(name = "cashbox")
@Data
public class CashBox {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer month;
    private Integer year;

    @Column(nullable = false)
    private BigDecimal totalCollected = BigDecimal.ZERO;

    @Column(nullable = false)
    private BigDecimal totalSpent = BigDecimal.ZERO;

    @Column(nullable = false)
    private BigDecimal  totalBalance = BigDecimal.ZERO;
}
