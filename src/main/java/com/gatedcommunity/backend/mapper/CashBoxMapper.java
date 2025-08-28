package com.gatedcommunity.backend.mapper;
import com.gatedcommunity.backend.entity.dto.CashBoxDTO;
import com.gatedcommunity.backend.entity.CashBox;
import org.mapstruct.Mapper;

@Mapper(componentModel = "spring")
public interface  CashBoxMapper {
    CashBoxDTO toDTO(CashBox entity);
    CashBox toEntity(CashBoxDTO dto);
}
