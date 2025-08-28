package com.gatedcommunity.backend.util.mapper;
import com.gatedcommunity.backend.entity.dto.MonthlyExpenseDTO;
import com.gatedcommunity.backend.entity.MonthlyExpense;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface MonthlyExpenseMapper {
    @Mapping(source = "cashBox.id", target = "cashBoxId")
    MonthlyExpenseDTO toDTO(MonthlyExpense monthlyExpense);

    @Mapping(source = "cashBoxId", target = "cashBox.id")
    MonthlyExpense toEntity(MonthlyExpenseDTO monthlyFeeDTO);
}
