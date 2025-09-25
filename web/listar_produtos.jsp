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
            try {
                PreparedStatement enviar = ConexaoDB.dml("SELECT * FROM quarto_vendedor");
                ResultSet resultado = enviar.executeQuery();
        %>
        <table id="tabela_listar">
            <tr>
                <th>id_quarto</th>
                <th>Nome</th>
                <th>Localização</th>
                <th>Preço</th>
                <th>Ação</th>
            </tr>
            <%
                while (resultado.next()) {
            %>
            <tr>
                <td><%=resultado.getString("id_quarto")%></td>
                <td><%=resultado.getString("nome_quarto")%></td>
                <td><%=resultado.getString("localização")%></td>
                <td><%=resultado.getString("preço")%></td>
                <td id="acao"><a href="excluir_produto.jsp?codigo=<%=resultado.getString("id_quarto")%>"> <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash-fill" viewBox="0 0 16 16">
                        <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                        </svg></a></td>
            </tr>
            <%
                }
            %>
        </table>
        <%
            } catch (Exception x) {
                out.println("ERRO: " + x.getMessage());
            }
        %>
    </body>
</html>
