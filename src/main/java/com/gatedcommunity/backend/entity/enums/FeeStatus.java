package com.gatedcommunity.backend.entity.enums;

import com.fasterxml.jackson.annotation.JsonValue;

import java.util.Arrays;

public enum FeeStatus {
    PAID("Pagado"),
    UNPAID("No pagado"),
    PARTIAL_PAID("Pago parcial"),
    TRANSFER_PAID ("Pagado con Transferencia");

    private final String label;

    FeeStatus(String label) {
        this.label = label;
    }

    @JsonValue
    public String getLabel() {
        return label;
    }

    public static FeeStatus fromLabel(String label) {
        return Arrays.stream(FeeStatus.values())
                .filter(fs -> fs.label.equalsIgnoreCase(label))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Estado inválido: " + label));
    }

}

