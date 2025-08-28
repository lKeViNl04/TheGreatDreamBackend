package com.gatedcommunity.backend.entity.dto;

import java.math.BigDecimal;

public class MonthlyFeeDTO {
    public Long id; // opcional si es POST
    public Long cashBoxId;
    public MemberDTO member;
    public BigDecimal assignedAmount;
    public BigDecimal paid;
    public String status;
}

