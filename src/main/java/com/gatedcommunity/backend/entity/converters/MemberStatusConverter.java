package com.gatedcommunity.backend.entity.converters;

import com.gatedcommunity.backend.entity.enums.MemberStatus;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class MemberStatusConverter implements AttributeConverter<MemberStatus, String> {

    @Override
    public String convertToDatabaseColumn(MemberStatus attribute) {
        return attribute != null ? attribute.getLabel() : null;
    }

    @Override
    public MemberStatus convertToEntityAttribute(String dbData) {
        return dbData != null ? MemberStatus.fromLabel(dbData) : null;
    }
}

