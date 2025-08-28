package com.gatedcommunity.backend.entity.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class MonthlyFeeDTO {
    private Long id;
    private Long cashBoxId;
    private MemberDTO member;
    private BigDecimal assignedAmount;
    private BigDecimal paid;
    private String status;
}

