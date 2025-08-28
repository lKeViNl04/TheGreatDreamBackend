package com.gatedcommunity.backend.mapper;
import com.gatedcommunity.backend.entity.dto.MemberDTO;
import com.gatedcommunity.backend.entity.Member;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface MemberMapper {
    @Mapping(source = "status.label", target = "status")
    MemberDTO toDTO(Member entity);

    @Mapping(target = "status", expression = "java(com.gatedcommunity.backend.entity.enums.MemberStatus.fromLabel(dto.status))")
    Member toEntity(MemberDTO dto);
}
