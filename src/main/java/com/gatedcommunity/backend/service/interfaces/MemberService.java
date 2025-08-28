package com.gatedcommunity.backend.service.interfaces;

import com.gatedcommunity.backend.entity.dto.MemberDTO;

import java.util.List;

public interface MemberService {
    List<MemberDTO> getAll();
    MemberDTO getById(Long id);
    MemberDTO create(MemberDTO dto);
    MemberDTO update(Long id, MemberDTO dto);
    void delete(Long id);
}
