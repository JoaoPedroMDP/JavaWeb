/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.ufpr.tads.web2.servlets;

import com.ufpr.tads.web2.beans.LoginBean;
import com.ufpr.tads.web2.dao.ConnectionFactory;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.exceptions.DAOException;
import com.ufpr.tads.web2.dao.exceptions.LoginException;
import com.ufpr.tads.web2.dao.UsuarioDAO;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joao
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private Usuario getUserToLogin(String login, String password) throws DAOException, LoginException {
        Usuario user = new UsuarioDAO(new ConnectionFactory().getConnection()).getByLogin(login);
        if(user == null)
            throw new DAOException("Usuário não encontrado");

        if(!user.getPassword().equals(password))
            throw new LoginException("Credenciais inválidas");

        return user;
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");

        try {
            String login = request.getParameter("login");
            String password = request.getParameter("password");

            Usuario user = getUserToLogin(login, password);
            LoginBean loginBean = new LoginBean(user);

            request.getSession().setAttribute("loginBean", loginBean);
            response.sendRedirect("portal.jsp");
            return;
        }catch(LoginException e) {
            request.setAttribute("msg", e.getMessage());
        }catch(DAOException e) {
            request.setAttribute("msg", "Erro ao buscar usuário");
        }

        request.setAttribute("page", "index.html");
        RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
        rd.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}