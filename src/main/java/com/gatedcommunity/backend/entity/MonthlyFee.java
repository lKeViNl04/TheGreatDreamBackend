package com.gatedcommunity.backend.entity;
import com.gatedcommunity.backend.entity.converters.FeeStatusConverter;
import com.gatedcommunity.backend.entity.enums.FeeStatus;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Entity
@Table(name = "cashbox_fee")
@Data
public class MonthlyFee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_cashbox", nullable = false)
    private CashBox cashBox;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_member", nullable = false)
    private Member member;

    private BigDecimal assignedAmount = BigDecimal.ZERO;
    private BigDecimal paid = BigDecimal.ZERO;

    @Convert(converter = FeeStatusConverter.class)
    private FeeStatus status = FeeStatus.UNPAID;

}