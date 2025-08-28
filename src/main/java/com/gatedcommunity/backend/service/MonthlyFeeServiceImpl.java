package com.gatedcommunity.backend.service;

import com.gatedcommunity.backend.entity.dto.MonthlyFeeDTO;
import com.gatedcommunity.backend.entity.MonthlyFee;
import com.gatedcommunity.backend.entity.enums.FeeStatus;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.mapper.MonthlyFeeMapper;
import com.gatedcommunity.backend.repository.CashBoxRepository;
import com.gatedcommunity.backend.repository.MemberRepository;
import com.gatedcommunity.backend.repository.MonthlyFeeRepository;
import com.gatedcommunity.backend.service.interfaces.MonthlyFeeService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

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
        if (dto.member != null && dto.member.id != null) {
            fee.setMember(memberRepository.findById(dto.member.id)
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Socio no encontrado con ID: " + dto.member.id)));
        }
    }

    private void setCashBoxFromDTO(MonthlyFee fee, MonthlyFeeDTO dto) {
        if (dto.cashBoxId != null ) {
            fee.setCashBox(cashBoxRepository.findById(dto.cashBoxId)
                    .orElseThrow(() -> new ResourceNotFoundException(
                            "Caja chica no encontrada con ID: " + dto.cashBoxId)));
        }
    }

    // ---- Métodos de servicio ----
    @Override
    public List<MonthlyFeeDTO> getAll() {
        return monthlyFeeRepository.findAll()
                .stream()
                .map(monthlyFeeMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public MonthlyFeeDTO getById(Long id) {
        MonthlyFee fee = monthlyFeeRepository.findById(id)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Cuota no encontrada con ID: " + id));
        return monthlyFeeMapper.toDTO(fee);
    }

    @Override
    public MonthlyFeeDTO create(MonthlyFeeDTO dto) {
        MonthlyFee fee = monthlyFeeMapper.toEntity(dto);
        setMemberFromDTO(fee, dto);
        setCashBoxFromDTO(fee, dto);
        return monthlyFeeMapper.toDTO(monthlyFeeRepository.save(fee));
    }

    @Override
    public MonthlyFeeDTO update(Long id, MonthlyFeeDTO dto) {
        MonthlyFee existing = monthlyFeeRepository.findById(id)
                .orElseThrow(() ->
                        new ResourceNotFoundException("Cuota no encontrada con ID: " + id));
        existing.setAssignedAmount(dto.assignedAmount);
        existing.setPaid(dto.paid);
        existing.setStatus(FeeStatus.fromLabel(dto.status));
        setMemberFromDTO(existing, dto);
        setCashBoxFromDTO(existing, dto);
        return monthlyFeeMapper.toDTO(monthlyFeeRepository.save(existing));
    }

    @Override
    public void delete(Long id) {
        if (!monthlyFeeRepository.existsById(id)) {
            throw new ResourceNotFoundException("Cuota no encontrada con ID: " + id);
        }
        monthlyFeeRepository.deleteById(id);
    }
}
