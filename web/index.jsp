<%--
    Document   : index
    Created on : Mar 17, 2022, 4:41:32 PM
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
<div class="container d-flex flex-column align-content-center text-center">
    <div class="errors">
        <%
            String message = (String) request.getAttribute("msg");
            if( message != null){
                out.println("<span class\"error-message\">" + message + "</span>");
            }
        %>
    </div>
    <form
        action="${pageContext.request.contextPath}/LoginServlet"
        method="post"
        class="d-flex flex-column form"
    >
        <input class="form-control" type="text" name="login" />
        <span class="error-login error"></span>
        <input class="form-control" type="password" name="password" />
        <span class="error-password error"></span>
        <button name="enter" type="submit" class="enter btn btn-primary">
            Entrar
        </button>
    </form>
</div>
</body>
</html>

