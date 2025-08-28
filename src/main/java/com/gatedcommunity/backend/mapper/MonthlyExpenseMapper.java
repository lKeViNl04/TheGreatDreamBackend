package com.gatedcommunity.backend.mapper;
import com.gatedcommunity.backend.entity.dto.MonthlyExpenseDTO;
import com.gatedcommunity.backend.entity.MonthlyExpense;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface MonthlyExpenseMapper {
    @Mapping(source = "cashBox.id", target = "cashBoxId")
    MonthlyExpenseDTO toDTO(MonthlyExpense monthlyExpense);
    MonthlyExpense toEntity(MonthlyExpenseDTO monthlyFeeDTO);
}
