<%@page import="java.sql.PreparedStatement"%>
<%@page import="br.com.test.ConexaoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Cadastro de Vendedor</title>
</head>
<body>
    <%
        // Recebendo os parâmetros do formulário HTML
        String quartoStr = request.getParameter("quarto_vendedor");
        String nomeHotel = request.getParameter("nome_hotel");
        String emailVendedor = request.getParameter("email_vendedor");
        String cpf = request.getParameter("cpf");

        try {
            // Convertendo quarto para inteiro
            int quarto = Integer.parseInt(quartoStr);

            // Inserção na tabela login_vendedor
            PreparedStatement enviar = ConexaoDB.dml(
                "INSERT INTO login_vendedor (quarto_vendedor, nome_hotel, email_vendedor, cpf) VALUES (?, ?, ?, ?)"
            );
            enviar.setInt(1, quarto);
            enviar.setString(2, nomeHotel);
            enviar.setString(3, emailVendedor);
            enviar.setString(4, cpf);
            enviar.executeUpdate();

            out.println("<h2>Vendedor cadastrado com sucesso!</h2>");

        } catch (Exception e) {
            out.println("<h2>Erro ao cadastrar vendedor: " + e.getMessage() + "</h2>");
        }
    %>

    <br>
    <a href="cadastroVendedor.html">Voltar ao formulário</a>
</body>
</html>
