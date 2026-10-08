/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.churrasco.util;

import java.sql.Connection;                                                                   //Importa as conexões do MySql
import java.sql.DriverManager;

/**
 *
 * @author Cledson Silva
 */
public class Conexao {
    private static final String URL = "jdbc:mysql://localhost:3306/churrasco_db";
    
    private static final String USUARIO = "root";                                            //Faz a conexão com o MySql colocando o usuário e senha.
    private static final String SENHA = "123456";
    
    public static Connection conectar() {
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
            URL,
            USUARIO,
            SENHA
            );
        } catch (Exception e) {
            throw new RuntimeException("Erro ao conectar com o banco:" + e.getMessage()     //Faz o tratamento de erro caso não conecte, exibindo o nome do banco de dados.
            );
        }
    }
    
}
