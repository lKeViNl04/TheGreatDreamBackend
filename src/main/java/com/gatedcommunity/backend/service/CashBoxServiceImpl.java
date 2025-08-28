package com.gatedcommunity.backend.service;

import com.gatedcommunity.backend.entity.MonthlyFee;
import com.gatedcommunity.backend.entity.dto.CashBoxDTO;
import com.gatedcommunity.backend.entity.CashBox;
import com.gatedcommunity.backend.entity.enums.MemberStatus;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.repository.MemberRepository;
import com.gatedcommunity.backend.repository.MonthlyFeeRepository;
import com.gatedcommunity.backend.service.fee.FeeCalculator;
import com.gatedcommunity.backend.util.mapper.CashBoxMapper;
import com.gatedcommunity.backend.repository.CashBoxRepository;
import com.gatedcommunity.backend.service.interfaces.CashBoxService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import java.util.List;

@Slf4j
@Service
public class CashBoxServiceImpl implements CashBoxService {

    private final CashBoxRepository cashBoxRepository;
    private final CashBoxMapper cashBoxMapper;

    private final MemberRepository memberRepository;
    private final MonthlyFeeRepository monthlyFeeRepository;

    private final FeeCalculator feeCalculator;

    public CashBoxServiceImpl(
            CashBoxRepository cashBoxRepository,
            CashBoxMapper cashBoxMapper,
            MemberRepository memberRepository,
            MonthlyFeeRepository monthlyFeeRepository,
            FeeCalculator feeCalculator) {
        this.cashBoxRepository = cashBoxRepository;
        this.cashBoxMapper = cashBoxMapper;
        this.memberRepository = memberRepository;
        this.monthlyFeeRepository = monthlyFeeRepository;
        this.feeCalculator = feeCalculator;
    }

    private CashBox findCashBoxById(Long id) {
        return cashBoxRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Cashbox not found with ID: " + id)
        );
    }

    private void generateMonthlyFees(CashBox box) {
        var fees = memberRepository.findByStatus(MemberStatus.ACTIVE)
                .stream()
                .map(member -> {
                    var fee = new MonthlyFee();
                    fee.setCashBox(box);
                    fee.setMember(member);
                    fee.setAssignedAmount(feeCalculator.calculate(member.getSlot()));
                    return fee;
                })
                .toList();
        monthlyFeeRepository.saveAll(fees);
    }

    //Method implement
    @Override
    public List<CashBoxDTO> getAll() {
        return cashBoxRepository.findAll()
                .stream()
                .map(cashBoxMapper::toDTO)
                .toList();
    }

    @Override
    public CashBoxDTO getById(Long id) {
        return cashBoxMapper.toDTO(findCashBoxById(id));
    }

    @Override
    public CashBoxDTO create(CashBoxDTO dto) {
        CashBox box = cashBoxMapper.toEntity(dto);
        CashBox saved = cashBoxRepository.save(box);
        generateMonthlyFees(saved);
        return cashBoxMapper.toDTO(saved);
    }

    @Override
    public CashBoxDTO update(Long id, CashBoxDTO dto) {
        CashBox cashbox = findCashBoxById(id);
        cashbox.setMonth(dto.getMonth());
        cashbox.setYear(dto.getYear());
        return cashBoxMapper.toDTO(cashBoxRepository.save(cashbox));
    }

    @Override
    public void delete(Long id) {
        findCashBoxById(id);
        cashBoxRepository.deleteById(id);
    }
}
