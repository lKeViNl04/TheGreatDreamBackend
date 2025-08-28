package com.gatedcommunity.backend.util.mapper;
import com.gatedcommunity.backend.entity.dto.CashBoxDTO;
import com.gatedcommunity.backend.entity.CashBox;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface CashBoxMapper {
    CashBoxDTO toDTO(CashBox entity);

    @Mapping(target = "totalCollected", defaultExpression = "java(java.math.BigDecimal.ZERO)")
    @Mapping(target = "totalSpent", defaultExpression = "java(java.math.BigDecimal.ZERO)")
    @Mapping(target = "totalBalance", defaultExpression = "java(java.math.BigDecimal.ZERO)")
    CashBox toEntity(CashBoxDTO dto);
}
