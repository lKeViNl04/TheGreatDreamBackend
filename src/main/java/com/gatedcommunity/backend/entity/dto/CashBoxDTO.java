package com.gatedcommunity.backend.entity.dto;

import java.math.BigDecimal;

public class CashBoxDTO {
    public Long id;
    public Integer month;
    public Integer year;
    public BigDecimal  amountCollected;
    public BigDecimal totalSpent;
    public BigDecimal  balance;
}
