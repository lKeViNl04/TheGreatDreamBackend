package com.gatedcommunity.backend.entity.dto;

import lombok.Data;

@Data
public class MemberDTO {
    private Long id;
    private String firstName;
    private String lastName;
    private String slot;
    private String status;
}

