<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.test.ConexaoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nome, CPF, email, senha;

            nome = request.getParameter("nome");
            CPF = request.getParameter("cpf");
            email = request.getParameter("email");
            senha = request.getParameter("senha");

            try {
                PreparedStatement enviar = ConexaoDB.dml("INSERT INTO login_comprador (nome, email_comprador, cpf, senha) VALUES (?,?,?,?)");
                enviar.setString(1, nome);
                enviar.setString(2, email);
                enviar.setString(3, CPF);
                enviar.setString(4, senha);
                enviar.executeUpdate();
                out.println(nome + " Cadastrado com sucesso!");

            } catch (Exception Erro) {
                out.println(Erro.getMessage());
            }
        %>
    </body>
</html>
