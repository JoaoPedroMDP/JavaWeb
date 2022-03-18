<%@ page import="com.ufpr.tads.web2.dao.UsuarioDAO" %>
<%@ page import="com.ufpr.tads.web2.beans.Usuario" %>
<%@ page import="com.ufpr.tads.web2.dao.exceptions.DAOException" %>
<%@ page import="com.ufpr.tads.web2.dao.ConnectionFactory" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link
            rel="stylesheet"
            href="${pageContext.request.contextPath}/css/menu.css"
        />
        <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
            integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
            crossorigin="anonymous"
        />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous">
        </script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Portal</title>
    </head>
    <body>
        <%
            if(session.getAttribute("loginBean") == null){
                request.setAttribute("msg", "Usuário deve se autenticar para acessar o sistema");
                request.setAttribute("page", "index.jsp");
                RequestDispatcher rd = request.getRequestDispatcher("erro.jsp");
                rd.forward(request, response);
            }
        %>
        <h1><jsp:getProperty name="loginBean" property="userName"/></h1>
        <%
            try {
                List<Usuario> usuarios = new UsuarioDAO(new ConnectionFactory().getConnection()).getAll();
                out.println("<ul>");
                for(Usuario usuario : usuarios){
                    out.println("<li>" + usuario.getName());
                }
                out.println("</ul>");
            }catch(DAOException e){
                out.println("<h1>Não foi possível acessar o banco de dados</h1>");
            }
        %>
        <div class="menu">
            <ul class="list-group">
                <a href="inserir.jsp"><li class="list-group-item">Cadastro de clientes</li></a>
                <a href="/LogoutServlet"><li class="list-group-item">Sair</li></a>
            </ul>
        </div>

        <jsp:include page="WEB-INF/jspf/footer.jspf"></jsp:include>
    </body>
</html>
