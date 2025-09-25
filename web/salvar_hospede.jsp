<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultado do Cadastro</title>
</head>
<body>

<%
    String nome = request.getParameter("nome");
    String email = request.getParameter("email_comprador");
    String cpf = request.getParameter("cpf");
    String senha = request.getParameter("senha");

    String mensagem = "";

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conexao = DriverManager.getConnection(url, usuario, senhaBD);

        String sql = "INSERT INTO hospedes (nome, email_comprador, cpf, senha) VALUES (?, ?, ?, ?)";
        PreparedStatement stmt = conexao.prepareStatement(sql);
        stmt.setString(2, nome);
        stmt.setString(3, email);
        stmt.setString(4, cpf);
        stmt.setString(5, senha); // Em produção, use hash

        int linhasAfetadas = stmt.executeUpdate();

        if (linhasAfetadas > 0) {
            mensagem = "Hóspede cadastrado com sucesso!";
        } else {
            mensagem = "Erro ao cadastrar hóspede.";
        }

        stmt.close();
        conexao.close();
    } catch (Exception e) {
        mensagem = "Erro: " + e.getMessage();
    }
%>
    <h2><%= mensagem %></h2>
    <a href="cadastro_hospede.html">Voltar ao cadastro</a>
</body>
</html>
