package com.gatedcommunity.backend.service;

import com.gatedcommunity.backend.entity.dto.MonthlyFeeDTO;
import com.gatedcommunity.backend.entity.MonthlyFee;
import com.gatedcommunity.backend.entity.enums.FeeStatus;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.util.mapper.MonthlyFeeMapper;
import com.gatedcommunity.backend.repository.CashBoxRepository;
import com.gatedcommunity.backend.repository.MemberRepository;
import com.gatedcommunity.backend.repository.MonthlyFeeRepository;
import com.gatedcommunity.backend.service.interfaces.MonthlyFeeService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MonthlyFeeServiceImpl implements MonthlyFeeService {

    private final MonthlyFeeRepository monthlyFeeRepository;
    private final MemberRepository memberRepository;
    private final CashBoxRepository cashBoxRepository;
    private final MonthlyFeeMapper monthlyFeeMapper;

    public MonthlyFeeServiceImpl(
            MonthlyFeeRepository monthlyFeeRepository,
            MemberRepository memberRepository,
            CashBoxRepository cashBoxRepository,
            MonthlyFeeMapper monthlyFeeMapper
    ) {
        this.monthlyFeeRepository = monthlyFeeRepository;
        this.memberRepository = memberRepository;
        this.cashBoxRepository = cashBoxRepository;
        this.monthlyFeeMapper = monthlyFeeMapper;
    }

    //
    private void setMemberFromDTO(MonthlyFee fee, MonthlyFeeDTO dto) {
        if (dto.getMember() != null && dto.getMember().getId() != null) {
            fee.setMember(memberRepository.findById(dto.getMember().getId())
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Member not found with ID:" + dto.getMember().getId())));
        }
    }

    private void setCashBoxFromDTO(MonthlyFee fee, MonthlyFeeDTO dto) {
        if (dto.getCashBoxId() != null) {
            fee.setCashBox(cashBoxRepository.findById(dto.getCashBoxId())
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Cashbox not found with ID:" + dto.getCashBoxId())));
        }
    }

    private MonthlyFee findMonthlyFeeById(Long id) {
        return monthlyFeeRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Monthly fee not found with ID:" + id));
    }

    private void updateFromDTO(MonthlyFee fee, MonthlyFeeDTO dto) {
        fee.setAssignedAmount(dto.getAssignedAmount());
        fee.setPaid(dto.getPaid());
        fee.setStatus(FeeStatus.fromLabel(dto.getStatus()));
        setMemberFromDTO(fee, dto);
        setCashBoxFromDTO(fee, dto);
    }


    // ---- Métodos de servicio ----
    @Override
    public List<MonthlyFeeDTO> getAll() {
        return monthlyFeeRepository.findAll()
                .stream()
                .map(monthlyFeeMapper::toDTO)
                .toList();
    }

    @Override
    public MonthlyFeeDTO getById(Long id) {
        return monthlyFeeMapper.toDTO(findMonthlyFeeById(id));
    }

    @Override
    public MonthlyFeeDTO create(MonthlyFeeDTO dto) {
        MonthlyFee fee = monthlyFeeMapper.toEntity(dto);
        updateFromDTO(fee, dto);
        return monthlyFeeMapper.toDTO(monthlyFeeRepository.save(fee));
    }

    @Override
    public MonthlyFeeDTO update(Long id, MonthlyFeeDTO dto) {
        MonthlyFee fee = findMonthlyFeeById(id);
        updateFromDTO(fee, dto);
        return monthlyFeeMapper.toDTO(monthlyFeeRepository.save(fee));
    }

    @Override
    public void delete(Long id) {
        findMonthlyFeeById(id);
        monthlyFeeRepository.deleteById(id);
    }
}
