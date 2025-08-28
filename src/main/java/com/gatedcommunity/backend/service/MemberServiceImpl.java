package com.gatedcommunity.backend.service;


import com.gatedcommunity.backend.entity.dto.MemberDTO;
import com.gatedcommunity.backend.entity.Member;
import com.gatedcommunity.backend.entity.enums.MemberStatus;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.mapper.MemberMapper;
import com.gatedcommunity.backend.repository.MemberRepository;
import com.gatedcommunity.backend.service.interfaces.MemberService;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final MemberMapper memberMapper;

    public MemberServiceImpl(MemberRepository memberRepository, MemberMapper memberMapper) {
        this.memberRepository = memberRepository;
        this.memberMapper = memberMapper;
    }

    //Method implement
    @Override
    public List<MemberDTO> getAll() {
        return memberRepository.findAll()
                .stream()
                .map(memberMapper::toDTO)
                .collect(Collectors.toList());
    }

    @Override
    public MemberDTO getById(Long id) {
        Member member = memberRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Socio no encontrado con ID: " + id));
        return memberMapper.toDTO(member);
    }

    @Override
    public MemberDTO create(MemberDTO dto) {
        Member member = memberMapper.toEntity(dto);
        Member saved = memberRepository.save(member);
        return memberMapper.toDTO(saved);
    }

    @Override
    public MemberDTO update(Long id, MemberDTO dto) {
        Member existing = memberRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Socio no encontrado con ID: " + id));
        existing.setFirstName(dto.firstName);
        existing.setLastName(dto.lastName);
        existing.setSlots(dto.slots);
        existing.setStatus(MemberStatus.fromLabel(dto.status));
        return memberMapper.toDTO(memberRepository.save(existing));
    }


    @Override
    public void delete(Long id) {
        if (!memberRepository.existsById(id)) {
            throw new ResourceNotFoundException("Socio no encontrado con ID: " + id);
        }
        memberRepository.deleteById(id);
    }

}
