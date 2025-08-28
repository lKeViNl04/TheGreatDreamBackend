package com.gatedcommunity.backend.entity;
import com.gatedcommunity.backend.entity.converters.FeeStatusConverter;
import com.gatedcommunity.backend.entity.enums.FeeStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Entity
@Table(name = "cuota_socio_cajachica")
@Getter
@Setter
public class MonthlyFee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_cuota")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "id_caja_chica", nullable = false)
    private CashBox cashBox;

    @ManyToOne
    @JoinColumn(name = "id_socio", nullable = false)
    private Member member;

    @Column(name = "monto_asignado")
    private BigDecimal assignedAmount;

    @Column(name = "abonado")
    private BigDecimal paid;

    @Column(name = "estado")
    @Convert(converter = FeeStatusConverter.class)
    private FeeStatus status;

}