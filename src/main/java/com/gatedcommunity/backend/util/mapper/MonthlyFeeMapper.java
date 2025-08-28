package com.gatedcommunity.backend.util.mapper;
import com.gatedcommunity.backend.entity.dto.MonthlyFeeDTO;
import com.gatedcommunity.backend.entity.MonthlyFee;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface MonthlyFeeMapper {
    @Mapping(source = "cashBox.id", target = "cashBoxId")
    @Mapping(source = "status.label", target ="status")
    MonthlyFeeDTO toDTO(MonthlyFee monthlyFee);

    @Mapping(source = "cashBoxId", target = "cashBox.id")
    @Mapping(target = "status", expression = "java(com.gatedcommunity.backend.entity.enums.FeeStatus.fromLabel(dto.getStatus()))")
    @Mapping(target = "member.status", expression = "java(com.gatedcommunity.backend.entity.enums.MemberStatus.fromLabel(memberDTO.getStatus()))")
    MonthlyFee toEntity(MonthlyFeeDTO dto);
}
