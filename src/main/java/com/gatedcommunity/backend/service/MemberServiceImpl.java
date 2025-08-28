package com.gatedcommunity.backend.service;


import com.gatedcommunity.backend.entity.dto.MemberDTO;
import com.gatedcommunity.backend.entity.Member;
import com.gatedcommunity.backend.entity.enums.MemberStatus;
import com.gatedcommunity.backend.exception.ResourceNotFoundException;
import com.gatedcommunity.backend.util.mapper.MemberMapper;
import com.gatedcommunity.backend.repository.MemberRepository;
import com.gatedcommunity.backend.service.interfaces.MemberService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService {

    private final MemberRepository memberRepository;
    private final MemberMapper memberMapper;

    public MemberServiceImpl(MemberRepository memberRepository, MemberMapper memberMapper) {
        this.memberRepository = memberRepository;
        this.memberMapper = memberMapper;
    }

    private Member findMemberById(Long id) {
        return memberRepository.findById(id).orElseThrow(
                () -> new ResourceNotFoundException("Member not found with ID: " + id)
        );
    }

    private void updateFromDTO(Member member, MemberDTO dto) {
        member.setFirstName(dto.getFirstName());
        member.setLastName(dto.getLastName());
        member.setSlot(dto.getSlot());
        member.setStatus(MemberStatus.fromLabel(dto.getStatus()));
    }

    //Method implement
    @Override
    public List<MemberDTO> getAll() {
        return memberRepository.findAll()
                .stream()
                .map(memberMapper::toDTO)
                .toList();
    }

    @Override
    public MemberDTO getById(Long id) {
        return memberMapper.toDTO(findMemberById(id));
    }

    @Override
    public MemberDTO create(MemberDTO dto) {
        return memberMapper.toDTO(memberRepository.save(memberMapper.toEntity(dto)));
    }

    @Override
    public MemberDTO update(Long id, MemberDTO dto) {
        Member member = findMemberById(id);
        updateFromDTO(member, dto);
        return memberMapper.toDTO(memberRepository.save(member));
    }


    @Override
    public void delete(Long id) {
        findMemberById(id);
        memberRepository.deleteById(id);
    }

}
