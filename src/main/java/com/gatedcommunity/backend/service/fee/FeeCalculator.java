package com.gatedcommunity.backend.service.fee;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import java.math.BigDecimal;
import java.math.RoundingMode;

@Component
public class FeeCalculator {
    private final BigDecimal baseAmount;

    public FeeCalculator(@Value("${cashbox.base-amount}") BigDecimal baseAmount) {
        this.baseAmount = baseAmount;
    }

    public BigDecimal calculate(String slot) throws NumberFormatException {
        if (slot == null || slot.isBlank()) {
            return BigDecimal.ZERO;
        }
        String s = slot.trim();
        if (s.contains("/")) { // fracción: ej. "1/2", "3/4"
            String[] p = s.split("/");
            BigDecimal num = new BigDecimal(p[0].trim());
            BigDecimal den = new BigDecimal(p[1].trim());
            if (den.compareTo(BigDecimal.ZERO) == 0) return BigDecimal.ZERO;
            return baseAmount.multiply(num).divide(den, 2, RoundingMode.HALF_UP);
        }
        // entero o decimal: ej. "1", "2", "1.5"
        BigDecimal factor = new BigDecimal(s.replace(',', '.'));
        return baseAmount.multiply(factor).setScale(2, RoundingMode.HALF_UP);
    }



}
