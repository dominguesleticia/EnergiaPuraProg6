/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lw.energiapura.model;

/**
 *
 * @author Leticia
 */
public class Users {

    private int Id;
    private String Name;
    private String Idade;
    private String Email;
    private String Nivel;
    private String Senha;
    
    public Users() {
    }

    public Users(int Id, String Name, String Idade, String Email, String Nivel, String Senha) {
        this.Id = Id;
        this.Name = Name;
        this.Idade = Idade;
        this.Email = Email;
        this.Nivel = Nivel;
        this.Senha = Senha;
    }
    
    public Users(String Name, String Email, String Senha) {
        this.Name = Name;
        this.Email = Email;
        this.Senha = Senha;
    }
    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getIdade() {
        return Idade;
    }

    public void setIdade(String Idade) {
        this.Idade = Idade;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getNivel() {
        return Nivel;
    }

    public void setNivel(String Nivel) {
        this.Nivel = Nivel;
    }

    public String getSenha() {
        return Senha;
    }

    public void setSenha(String Senha) {
        this.Senha = Senha;
    }
    
    
    
}
