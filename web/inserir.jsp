<%-- 
    Document   : inserir
    Created on : Mar 15, 2022, 8:53:28 PM
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserção</title>
        <link
                rel="stylesheet"
                href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
                crossorigin="anonymous"
        />
        <script
                src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
                crossorigin="anonymous"
        ></script>
        <script src="validation.js"></script>
        <link rel="stylesheet" href="/css/form.css" />
    </head>
    <body>
        <% if(session.getAttribute("loginBean") == null){
            request.setAttribute("msg", "Você precisa estar logado para acessar essa página");
            request.setAttribute("page", "index.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
            rd.forward(request, response);} %>

        <div class="container d-flex justify-content-center">
            <form action="${pageContext.request.contextPath}/CadastrarUsuarioServlet" method="post" class="d-flex flex-column form" >
                <input class="form-control" type="text" name="name" placeholder="name"/>
                <span class="error-name error"></span>

                <input class="form-control" type="text" name="login" placeholder="login"/>
                <span class="error-login error"></span>

                <input class="form-control" type="password" name="password" placeholder="password" />
                <span class="error-password error"></span>

                <button name="enter" type="submit" class="enter btn btn-primary">Salvar</button>
            </form>
        </div>
    </body>
</html>
