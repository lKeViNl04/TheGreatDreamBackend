package com.gatedcommunity.backend.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "caja_chica")
@Getter
@Setter
public class CashBox {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_caja_chica")
    private Long id;

    @Column(name = "mes")
    private Integer month;

    @Column(name = "anio")
    private Integer year;

    @Column(name = "monto_recaudado")
    private BigDecimal amountCollected;

    @Column(name = "gasto_total")
    private BigDecimal totalSpent;

    @Column(name = "saldo")
    private BigDecimal  balance;
}
