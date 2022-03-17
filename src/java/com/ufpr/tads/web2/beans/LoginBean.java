/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ufpr.tads.web2.beans;

/**
 *
 * @author joao
 */
public class LoginBean {
    private Integer userId;
    private String userName;

    public LoginBean(){}

    public LoginBean(Integer userId, String userName) {
        this.userId = userId;
        this.userName = userName;
    }

    public LoginBean(Usuario user){
        this.userId = user.getId();
        this.userName = user.getLogin();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
