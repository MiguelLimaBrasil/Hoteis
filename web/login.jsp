<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.test.ConexaoDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nome, senha;

            nome = request.getParameter("nome");
            senha = request.getParameter("senha");

            try {
                PreparedStatement enviar = ConexaoDB.dml("SELECT nome, email_comprador FROM login_comprador WHERE nome LIKE ? AND senha LIKE ?");
                enviar.setString(1, nome);
                enviar.setString(2, senha);
                ResultSet resultado = enviar.executeQuery();
                if (resultado.next()) {
                    response.sendRedirect("inicio.html");
                } else {
                    out.println("Usuario não encontrado!");
                }
            } catch (Exception erro) {
                out.print(erro.getMessage());
            }
        %>
    </body>
</html>
