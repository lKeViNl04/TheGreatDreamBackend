package com.gatedcommunity.backend.repository;

import com.gatedcommunity.backend.entity.MonthlyFee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MonthlyFeeRepository extends JpaRepository<MonthlyFee, Long> {
}
