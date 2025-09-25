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
            int id_quarto;
            id_quarto = Integer.parseInt(request.getParameter("codigo"));

            try {
                PreparedStatement enviar = ConexaoDB.dml("SELECT * FROM quarto_vendedor WHERE id_quarto=?");
                enviar.setInt(1, id_quarto);
                ResultSet resultado = enviar.executeQuery();

                if (!resultado.next()) {
                    out.println("Produto não encontrado...");
                } else {
        %>

        <form method="post" action="alterar_produtos.jsp">
            <table>
                <tr>
                    <td><label for="codigo">Código: </label></td>
                    <td><input type="text" name="codigo" id="codigo" value="<%=resultado.getString("codigo")%>" readonly></td>
                </tr>
                <tr>
                    <td><label for="nome">Nome: </label></td>
                    <td><input type="text" name="nome" id="nome" size="50" maxlength="50" value="<%=resultado.getString("nome")%>"></td>
                </tr>
                <tr>
                    <td><label for="marca">Marca: </label></td>
                    <td><input type="text" name="marca" id="marca" size="50" maxlength="50" value="<%=resultado.getString("marca")%>"></td>
                </tr>
                <tr>
                    <td><label for="preco">Preço: </label></td>
                    <td><input type="number" step="0.01" name="preco" id="preco" value="<%=resultado.getString("preco")%>"></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Salvar Alterações"></td>
                </tr>
            </table>
        </form>

        <%
                }

            } catch (Exception erro) {
                String mensagem_erro = erro.getMessage();
                out.println("Entre em contato com o suporte. ERRO: " + mensagem_erro);
            }
        %>
    </body>
</html>
