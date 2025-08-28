package com.gatedcommunity.backend.entity;

import com.gatedcommunity.backend.entity.converters.MemberStatusConverter;
import com.gatedcommunity.backend.entity.enums.MemberStatus;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "member")
@Data
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)

    private Long id;
    private String firstName;
    private String lastName;
    private String slot;

    @Convert(converter = MemberStatusConverter.class)
    private MemberStatus status;
}
