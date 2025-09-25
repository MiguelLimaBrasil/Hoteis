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
        nome_quarto = request.getParameter("nome");
        try{
        PreparedStatement enviar= ConexaoDB.dml("SELECT * FROM quarto_vendedor WHERE nome_quarto LIKE ?");
         enviar.setString(1,"%" + nome_quarto + "%");
         ResultSet resultado = enviar.executeQuery();
         %>
         <table id="tabela_listar">
            <tr>
                <th>id_quarto</th>
                <th>nome_quarto</th>
                <th>localizaçãos</th>
                <th>Preço</th>           
            </tr>
            <%
                while (resultado.next()) {
            %>
            <tr>
                <td><%=resultado.getString("id_quarto")%></td>
                <td><%=resultado.getString("nome_quarto")%></td>
                <td><%=resultado.getString("localização")%></td>
                <td><%=resultado.getString("preço")%></td>
                
            </tr>
          
            <%
                }
            %>
        </table>
         
   
         <%
            }catch(Exception erro){
              String mensagem_erro = erro.getMessage();
            out.print("Erro no sistema." + mensagem_erro);
            out.print("Entre em contato com o suporte");
            }        
        
        %>
    </body>
</html>
