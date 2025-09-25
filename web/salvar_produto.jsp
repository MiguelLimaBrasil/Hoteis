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
            //Recebendo os dados digitados no formulário
            String nome, localização;
            double preco;

            nome = request.getParameter("nome");
            localização = request.getParameter("localização");
            preco = Double.parseDouble(request.getParameter("preco"));

            //Fazendo a conexão com o Banco de Dados
            //DB: eletroloja
            //Table: produtos
            try {
                /*
                Connection conectar;
                PreparedStatement enviar;
                Class.forName("com.mysql.cj.jdbc.Driver");

                conectar = DriverManager.getConnection("jdbc:mysql://localhost:3306/eletroloja", "root", "root");

                //Inserir os dados na tabela "produtos"
                enviar = conectar.prepareStatement("INSERT INTO produtos VALUES (?,?,?,?)");
                 */
                
                PreparedStatement enviar = ConexaoDB.dml("INSERT INTO quarto_vendedor (nome_quarto, localização, preço) VALUES (?,?,?)");
                enviar.setString(1, nome);
                enviar.setString(2, localização);
                enviar.setDouble(3, preco);
                enviar.executeUpdate();
                out.println("Produto cadastrado com SUCESSO!");
            } catch (Exception x) {
                out.println("ERRO: " + x.getMessage());
            }

        %>
    </body>
</html>
