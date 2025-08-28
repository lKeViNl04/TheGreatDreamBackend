package com.gatedcommunity.backend.repository;

import com.gatedcommunity.backend.entity.CashBox;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CashBoxRepository extends JpaRepository<CashBox, Long> {
}
