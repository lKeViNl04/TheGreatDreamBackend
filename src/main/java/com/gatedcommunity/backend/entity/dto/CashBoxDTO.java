package com.gatedcommunity.backend.entity.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class CashBoxDTO {
    private Long id;
    private Integer month;
    private Integer year;
    private BigDecimal  totalCollected;
    private BigDecimal totalSpent;
    private BigDecimal  totalBalance;
}
