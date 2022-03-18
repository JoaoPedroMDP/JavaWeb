<%-- 
    Document   : erro
    Created on : Mar 15, 2022, 8:59:26 PM
    Author     : joao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Erro</title>
    </head>
    <body>
        <div class="wrap">
            <div class="main">
                <h1><%=request.getAttribute("msg")%></h1>
                <a href="<%=request.getAttribute("page")%>">Continuar</a>
            </div>
        </div>

    </body>
    <style>
        html, body {
            height: 100%;
        }

        .wrap {
            min-height: 100%;
        }

        .main {
            overflow:auto;
            padding-bottom: 180px;
        }  /* must be same height as the footer */

        .footer {
            position: relative;
            margin-top: -180px; /* negative value of footer height */
            height: 180px;
            clear:both;
        }
    </style>
    <jsp:include page="WEB-INF/jspf/footer.jspf"></jsp:include>
</html>
