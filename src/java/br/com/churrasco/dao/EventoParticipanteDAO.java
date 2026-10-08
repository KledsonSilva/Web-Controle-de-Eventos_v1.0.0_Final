/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.churrasco.dao;

import br.com.churrasco.model.Evento;
import br.com.churrasco.util.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;

/**
 *
 * @author cleds
 */
public class EventoParticipanteDAO {
    
    public void adicionarParticipanteAoEvento(
            int idEvento,
            int idParticipante) {
        
        String sql = "INSERT INTO evento_participante "
                   + "(id_evento, id_participante) "
                   + "VALUES (?, ?)";
        
        try {
            
            Connection conn = Conexao.conectar();
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, idEvento);
            stmt.setInt(2, idParticipante);
            
            stmt.executeUpdate();
            
            stmt.close();
            conn.close();
        }
        
        catch(Exception e) {
            e.printStackTrace();
        }
    }
    
    
public List<Integer> listarParticipantesDoEvento(
        int idEvento) {

    List<Integer> participantes =
            new ArrayList<>();

    String sql =
        "SELECT id_participante "
      + "FROM evento_participante "
      + "WHERE id_evento = ?";

    try {

        Connection conn =
                Conexao.conectar();

        PreparedStatement stmt =
                conn.prepareStatement(sql);

        stmt.setInt(1, idEvento);

        ResultSet rs =
                stmt.executeQuery();

        while(rs.next()) {

            participantes.add(
                    rs.getInt("id_participante"));
        }

        rs.close();
        stmt.close();
        conn.close();

    } catch(Exception e) {

        e.printStackTrace();
    }

    return participantes;
}


    public List<String> listarNomesParticipantesPorEvento(
        int idEvento) {

    List<String> nomes =
            new ArrayList<>();

    String sql =
        "SELECT p.nome "
      + "FROM participantes p "
      + "INNER JOIN evento_participante ep "
      + "ON p.id = ep.id_participante "
      + "WHERE ep.id_evento = ?";

    try {

        Connection conn =
                Conexao.conectar();

        PreparedStatement stmt =
                conn.prepareStatement(sql);

        stmt.setInt(1, idEvento);

        ResultSet rs =
                stmt.executeQuery();

        while(rs.next()) {

            nomes.add(
                rs.getString("nome"));
        }

        rs.close();
        stmt.close();
        conn.close();

    } catch(Exception e) {

        e.printStackTrace();
    }

    return nomes;
}
    
    public int contarParticipacoes() {
        
        int total = 0;
        
        String sql = 
                
                "SELECT COUNT(*) FROM evento_participante";
        
         try {
                    
                    Connection conn = Conexao.conectar();
                    
                    PreparedStatement stmt = conn.prepareStatement(sql);
                    
                    ResultSet rs = stmt.executeQuery();
                    
                    if(rs.next()) {
                        
                        total = rs.getInt(1);
                    }
                    
                    rs.close();
                    stmt.close();
                    conn.close();
                }
                
                catch (Exception e) {
                    
                    e.printStackTrace();
                }
                
                return total;
    }
    
    public void excluirParticipacoesDoEvento(
        int idEvento) {

    String sql =
        "DELETE FROM evento_participante "
      + "WHERE id_evento = ?";

    try {

        Connection conn =
                Conexao.conectar();

        PreparedStatement stmt =
                conn.prepareStatement(sql);

        stmt.setInt(1, idEvento);

        stmt.executeUpdate();

        stmt.close();
        conn.close();

    } catch(Exception e) {

        e.printStackTrace();
    }
}

    

 } // Fim do método.
   

    


