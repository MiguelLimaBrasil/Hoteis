<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
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
            String nome;
            nome = request.getParameter("nome");

            try {
                PreparedStatement enviar = ConexaoDB.dml("SELECT * FROM quarto_vendedor WHERE nome_quarto LIKE ?");
                enviar.setString(1, "%" + nome + "%");
                ResultSet resultado = enviar.executeQuery();
        %>

        <table id="tabela_listar">
            <tr>
                <th>Nome</th>
            </tr>
            <%
                while (resultado.next()) {
            %>
            <tr>
                <td><%=resultado.getString("nome")%></td>
            </tr>
            <%
                }
            %>
        </table>

        <%
            } catch (Exception erro) {
                String mensagem_erro = erro.getMessage();
                out.println("Erro no sistema: " + mensagem_erro);
                out.println(". Entre em contato com o suporte");
            }
        %>
    </body>
</html>
