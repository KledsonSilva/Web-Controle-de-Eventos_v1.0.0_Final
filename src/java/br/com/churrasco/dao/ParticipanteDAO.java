/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.churrasco.dao;

import br.com.churrasco.model.Participante;
import br.com.churrasco.util.Conexao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
        

/**
 *
 * @author Cledson Silva
 */
public class ParticipanteDAO {

public void salvar (Participante participante) {
    
    String sql = 
            "INSERT INTO participantes "
            + "(nome, telefone, email, valor_contribuicao) "
            + "VALUES (?,?,?,?)";
    
            try{
                
                Connection conn =  Conexao.conectar();
                
                PreparedStatement stmt = conn.prepareStatement(sql);
                
                stmt.setString(1, participante.getNome());
                stmt.setString(2, participante.getTelefone());
                stmt.setString(3, participante.getEmail());               
                stmt.setDouble(4, participante.getValorContribuicao());
                
                

                int linhas = stmt.executeUpdate();
                System.out.println("Participantes cadastrados: " + linhas);
                
                stmt.close();
                conn.close();
            
            }
            
            catch (Exception e) {
                System.out.println("Erro ao salvar:" + e.getMessage());
                
                
            }
}
            
            
            
 public List<Participante> listar(){
     
     List<Participante> lista = new ArrayList<>();
     
     String sql = "SELECT * FROM participantes";
     
     try {
         
         Connection conn = Conexao.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         ResultSet rs = stmt.executeQuery();
         
         while(rs.next()) {
             Participante participante = new Participante();
             
             participante.setId(rs.getInt("id"));
             
             participante.setNome(rs.getString("nome"));
             
             participante.setTelefone(rs.getString("telefone"));
             
             participante.setEmail(rs.getString("email"));
             
             participante.setValorContribuicao(rs.getDouble("valor_contribuicao"));
             
             lista.add(participante);
         }
         
         rs.close();
         stmt.close();
         conn.close();
     }
     
        catch(Exception e) {
            
            e.printStackTrace();
        }
     
     System.out.println("Quantidade:" + lista.size());
     
     return lista;
 }           
 
 public void excluir (int id) {
     
     String sql = "DELETE FROM participantes WHERE id = ?";
     
        try {
            
            Connection conn = Conexao.conectar();
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, id);
            
            stmt.executeUpdate();
            
            stmt.close();
            
            conn.close();
        }
        
        catch(Exception e){
            
            e.printStackTrace();
        }
 }
 
 public Participante buscarPorId(int id) {
     
     Participante participante = null;
     
     String sql = "SELECT * FROM participantes WHERE id =?";
     
      try{
          Connection conn = Conexao.conectar();
          PreparedStatement stmt = conn.prepareStatement(sql);
          
          stmt.setInt(1, id);
          ResultSet rs = stmt.executeQuery();
          
          if (rs.next()) {
              
              participante = new Participante();
              
              participante.setId(rs.getInt("id"));
              participante.setNome(rs.getString("nome"));
              participante.setTelefone(rs.getString("telefone"));
              participante.setEmail(rs.getString("email"));
              participante.setValorContribuicao(rs.getDouble("valor_contribuicao"));
          }       
          
          rs.close();
          stmt.close();
          conn.close();
      }
      
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return participante;
              
 }


 
 public void atualizar(Participante participante) {
     
     String sql = "UPDATE participantes "
                + "SET nome=?, telefone=?,"
                + "email=?, valor_contribuicao=? " 
                + "WHERE id=?";   
                
            try{
                
                Connection conn = Conexao.conectar();
                
                PreparedStatement stmt = conn.prepareStatement(sql);
                
                stmt.setString(1, participante.getNome());
                stmt.setString(2, participante.getTelefone());
                stmt.setString(3, participante.getEmail());
                stmt.setDouble(4, participante.getValorContribuicao());
                stmt.setInt(5, participante.getId());
                
                stmt.executeUpdate();
                stmt.close();
                conn.close();
                    
               }
            
            catch (Exception e) {
                e.printStackTrace();
                }
            
 }
 
 
 public List<String> listarNomesParticipantesPorEvento (
        int idEvento) {
     
     List<String> nomes = new ArrayList<>();
     
     String sql = 
                    "SELECT p.nome "
                  + "FROM participantes p "
                  + "INNER JOIN evento_participante ep "
                  + "ON p.id = ep.id_participante "
                  + "WHERE ep.id_evento = ?";
     
                  try {
                      
                      Connection conn = Conexao.conectar();
                      
                      PreparedStatement stmt = conn.prepareStatement(sql);
                      
                      stmt.setInt(1, idEvento);
                      
                      ResultSet rs = stmt.executeQuery();
                      
                      while(rs.next()) {
                          nomes.add(rs.getString("nome"));
                      }
                      
                      rs.close();
                      stmt.close();
                      conn.close();
                  }
                  
                  catch (Exception e) {
                      
                      e.printStackTrace();
                  }
                  
                  return nomes;
 }
         
 public int contarParticipantes() {
     
     int total = 0;
     
     String sql = 
             
             "SELECT COUNT(*) FROM participantes";
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
 
  public void excluirParticipacoesDoEvento(int idEvento){

    String sql =
                 "DELETE FROM evento_participante "
                 + "WHERE id_evento = ?";

        try{

        Connection conn =
                Conexao.conectar();

        PreparedStatement stmt =
                conn.prepareStatement(sql);

        stmt.setInt(1, idEvento);

        stmt.executeUpdate();

        stmt.close();
        conn.close();

    }catch(Exception e){

        e.printStackTrace();
    }
}
         
 
} // Fim do método




        



