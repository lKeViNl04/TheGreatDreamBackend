package com.gatedcommunity.backend.entity;

import com.gatedcommunity.backend.entity.converters.MemberStatusConverter;
import com.gatedcommunity.backend.entity.enums.MemberStatus;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "socio")
@Getter
@Setter
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_socio")
    private Long id;

    @Column(name = "nombre")
    private String firstName;

    @Column(name = "apellido")
    private String lastName;

    @Column(name = "cupos")
    private String slots;

    @Column(name = "estado")
    @Convert(converter = MemberStatusConverter.class)
    private MemberStatus status;
}
