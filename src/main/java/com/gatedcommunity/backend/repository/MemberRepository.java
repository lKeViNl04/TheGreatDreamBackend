package com.gatedcommunity.backend.repository;

import com.gatedcommunity.backend.entity.Member;
import com.gatedcommunity.backend.entity.enums.MemberStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MemberRepository extends JpaRepository<Member, Long> {
    List<Member> findByStatus(MemberStatus status);
}
