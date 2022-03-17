<%@ page import="com.ufpr.tads.web2.beans.LoginBean" %>
<%@ page import="com.ufpr.tads.web2.dao.UsuarioDAO" %>
<%@ page import="com.ufpr.tads.web2.beans.Usuario" %>
<%@ page import="com.ufpr.tads.web2.dao.exceptions.DAOException" %>
<%@ page import="com.ufpr.tads.web2.dao.ConnectionFactory" %>
<%@ page import="java.util.List" %><%--
    Document   : portal
    Created on : Mar 15, 2022, 8:40:56 PM
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal</title>
    </head>
    <body>
        <% if(session.getAttribute("loginBean") == null){
                request.setAttribute("msg", "Você precisa estar logado para acessar essa página");
                request.setAttribute("page", "index.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
                rd.forward(request, response);} %>

        <jsp:useBean id="loginBean" class="com.ufpr.tads.web2.beans.LoginBean" scope="session"></jsp:useBean>
        <h1><jsp:getProperty name="loginBean" property="userName"/></h1>

        <%
            try {
                List<Usuario> usuarios = new UsuarioDAO(new ConnectionFactory().getConnection()).getAll();
                out.println("<ul>");
                for(Usuario usuario : usuarios){
                    out.println("<li>" + usuario.getName());
                }
                out.println("<ul>");
        %>
        <%
            }catch(DAOException e){
                out.println("<h1>Não foi possível acessar o banco de dados</h1>");
            }
        %>
        <a href="inserir.jsp">Inserção de usuários</a>
        <a href="LogoutServlet">Logout</a>
    </body>
</html>
