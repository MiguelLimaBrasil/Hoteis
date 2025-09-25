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
            int id_quarto;
            String nome_quarto, localização;
            double preco;

            id_quarto = Integer.parseInt(request.getParameter("id_quarto"));
            nome_quarto = request.getParameter("nome_quarto");
            localização = request.getParameter("localização");
            preco = Double.parseDouble(request.getParameter("preço"));

            try {

                PreparedStatement enviar = ConexaoDB.dml("UPDATE quarto_vendedor SET nome_quarto=?, localização=?, preço=? WHERE id_quarto=?");
                enviar.setInt(4, id_quarto);
                enviar.setString(1, nome_quarto);
                enviar.setString(2, localização);
                enviar.setDouble(3, preco);
                enviar.executeUpdate();
                out.println("Produto editado com SUCESSO!");

            } catch (Exception erro) {
                String mensagem_erro = erro.getMessage();
                out.println("Entre em contado com o suporte.ERRO: " + mensagem_erro);
            }
        %>
    </body>
</html>
