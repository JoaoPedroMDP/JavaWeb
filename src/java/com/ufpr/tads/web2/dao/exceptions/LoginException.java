package com.ufpr.tads.web2.dao.exceptions;

public class LoginException extends Exception{
    public LoginException(){}

    public LoginException(String string){
        super(string);
    }

    public LoginException(String string, Throwable t){
        super(string, t);
    }
}
