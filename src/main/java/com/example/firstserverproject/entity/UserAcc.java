package com.example.firstserverproject.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Entity
@Table(name = "useracc")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class UserAcc implements Serializable
{
    @Id
    private String login;
    private String password;

}
