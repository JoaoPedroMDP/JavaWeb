package com.ufpr.tads.web2.dao.interfaces;

import com.ufpr.tads.web2.dao.exceptions.DAOException;

import java.util.List;

public interface DAO<T> {
    T get(long id) throws DAOException;
    List<T> getAll() throws DAOException;
    void insert(T t) throws DAOException;
    void update(T t) throws DAOException;
    void delete(T t) throws DAOException;
    void closeConnection();
}
