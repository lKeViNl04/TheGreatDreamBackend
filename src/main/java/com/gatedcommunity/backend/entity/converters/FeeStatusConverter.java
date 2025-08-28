package com.gatedcommunity.backend.entity.converters;

import com.gatedcommunity.backend.entity.enums.FeeStatus;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class FeeStatusConverter implements AttributeConverter<FeeStatus, String> {

    @Override
    public String convertToDatabaseColumn(FeeStatus attribute) {
        return attribute != null ? attribute.getLabel() : null;
    }

    @Override
    public FeeStatus convertToEntityAttribute(String dbData) {
        return dbData != null ? FeeStatus.fromLabel(dbData) : null;
    }
}

