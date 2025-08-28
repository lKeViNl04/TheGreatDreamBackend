package com.gatedcommunity.backend.entity;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "gasto_mes_cajachica")
@Getter
@Setter
public class MonthlyExpense {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_gasto_mes")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_caja_chica")
    private CashBox cashBox;

    @Column(name = "descripcion")
    private String description;

    @Column(name = "monto")
    private BigDecimal amount;

    @Column(name = "Fecha")
    private LocalDate date;
}
