package com.example.firstserverproject.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "usertext")
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class UserText
{
    @Id
    private String login;
    private String usertext;

    public UserText(String login)
    {
        this.login = login;
    }
}
