/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.churrasco.util;

import java.sql.Connection;

/**
 *
 * @author Cledson Silva
 */
public class TesteConexao {                                                              //Classe criada para realizar o teste de conexão,
    public static void main(String[] args) {                                             //Caso conecte ok e caso contrário, exibe a mensagem
        try (Connection con = Conexao.conectar()) {                                      //com o tratamento de erro.
            System.out.println("Conectado com sucesso ao MySql!");
        } catch (Exception e) {
            System.out.println("Erro:" + e.getMessage());
        }
    }
    
}
