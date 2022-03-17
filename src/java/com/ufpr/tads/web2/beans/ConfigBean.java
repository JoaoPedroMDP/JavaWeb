/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ufpr.tads.web2.beans;

import java.io.Serializable;

/**
 *
 * @author joao
 */
public class ConfigBean implements Serializable {
    public String adminEmail;

    public ConfigBean() {
        adminEmail = "admin@email.com";
    }

    public ConfigBean(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }
}
