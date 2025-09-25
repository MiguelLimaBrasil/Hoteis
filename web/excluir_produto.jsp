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
            id_quarto = Integer.parseInt(request.getParameter("codigo"));
            try {
                PreparedStatement enviar = ConexaoDB.dml("DELETE FROM quarto_vendedor WHERE id_quarto = ?");
                enviar.setInt(1, id_quarto);

                int verificar = enviar.executeUpdate();
                if (verificar == 0) {
                    out.println("Produto não cadastrado...");
                } else {
                    out.println("Produto de código: "+ id_quarto +" excluído com sucesso");
                }

            } catch (Exception erro) {
                String mensagem_erro = erro.getMessage();
                out.println("Erro no sistema: " + mensagem_erro);
                out.println(". Entre em contato com o suporte");
            }

        %>
    </body>
</html>
