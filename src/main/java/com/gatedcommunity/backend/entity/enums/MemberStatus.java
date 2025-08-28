package com.gatedcommunity.backend.entity.enums;

import com.fasterxml.jackson.annotation.JsonValue;

import java.util.Arrays;

public enum MemberStatus {
    ACTIVE("Activo"),
    EXMEMBER("EXmiembro");

    private final String label;

    MemberStatus(String label) {
        this.label = label;
    }

    @JsonValue
    public String getLabel() {
        return label;
    }

    public static MemberStatus fromLabel(String label) {
        return Arrays.stream(MemberStatus.values())
                .filter(ms -> ms.label.equalsIgnoreCase(label))
                .findFirst()
                .orElseThrow(() -> new IllegalArgumentException("Estado inválido: " + label));
    }
}
