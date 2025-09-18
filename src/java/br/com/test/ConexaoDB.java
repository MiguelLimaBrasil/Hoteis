package br.com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDB {

    public static PreparedStatement dml(String sql) throws ClassNotFoundException, SQLException{
        //Fazendo a conexão com o Banco de Dados
        //DB: eletroloja
        //Table: produtos
        
        Connection conectar;
        Class.forName("com.mysql.cj.jdbc.Driver");
        conectar = DriverManager.getConnection("jdbc:mysql://localhost:3306/airbnb", "root", "root");
        return conectar.prepareStatement(sql);
    }
}
