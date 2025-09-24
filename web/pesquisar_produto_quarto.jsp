<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="br.com.test.ConexaoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="stylesTable.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String nome_quarto;
            nome_quarto = request.getParameter("nome_quarto");

            try {
                PreparedStatement enviar = ConexaoDB.dml("SELECT * FROM quarto_vendedor WHERE nome_quarto LIKE ?");
                enviar.setString(1, "%" + nome_quarto + "%");
                ResultSet resultado = enviar.executeQuery();
        %>

        <table id="tabela_listar">
            <tr>
                <th>nome_quarto</th>
                <th>localização</th>
                <th>Preço</th>
                <th>Ação</th>
            </tr>
            <%
                while (resultado.next()) {
            %>
            <tr>
                <td><%=resultado.getString("nome_quarto")%></td>
                <td><%=resultado.getString("localização")%></td>
                <td><%=resultado.getString("preço")%></td>
                <td><a href="excluir_produto.jsp?codigo=<%=resultado.getString("codigo")%>">Excluir</a></td>
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
