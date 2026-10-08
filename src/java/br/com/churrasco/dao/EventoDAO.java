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
 * @author Cledson Silva
 */
public class EventoDAO {          
    
    public void salvar(Evento evento) {                                                                 //Método para a gravação no banco de dados.        
        
        String sql = """
          INSERT INTO eventos
            (descricao, data_evento, local_evento, observacoes)
            VALUES (?,?,?,?)
            """;
        try {
            
            Connection conn = Conexao.conectar();
            
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setString(1,evento.getDescricao());
            stmt.setString(2,evento.getDataEvento());
            stmt.setString(3,evento.getLocalEvento());
            stmt.setString(4,evento.getObservacoes());
            
            stmt.execute();
            
            stmt.close();
            conn.close();
            }
        
            catch (Exception e){
            
            System.out.println("Erro ao salvar:" + e.getMessage()
            );
            
            }
    }
    
    
    
    
    public List<Evento> listar(){
        List<Evento> lista = new ArrayList<>();
        String sql = "SELECT * FROM eventos ORDER BY id";
        
        try {

    Connection conn = Conexao.conectar();

    PreparedStatement stmt =
            conn.prepareStatement(sql);

    ResultSet rs =
            stmt.executeQuery();

    while (rs.next()) {

        Evento evento = new Evento();

        evento.setId(rs.getInt("id"));
        evento.setDescricao(rs.getString("descricao"));
        evento.setDataEvento(rs.getString("data_evento"));
        evento.setLocalEvento(rs.getString("local_evento"));
        evento.setObservacoes(rs.getString("observacoes"));

        lista.add(evento);
    }

} catch (Exception e) {
    e.printStackTrace();
}
    return lista;
}
    


public void excluir(int id){
    
    String sql = "DELETE FROM eventos WHERE id = ?";
    
     try {
         Connection conn = Conexao.conectar();
         PreparedStatement stmt = conn.prepareStatement(sql);
         stmt.setInt(1,id);
         stmt.executeUpdate();
         stmt.close();
         conn.close();
         }
        catch (Exception e) {
            e.printStackTrace();
        }
}




public Evento buscarPorId(int id) {
    
    Evento evento = null;
    
    String sql = "SELECT * FROM eventos WHERE id = ?";
    
        try{
            Connection conn = Conexao.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()){
                
                evento = new Evento();
                
                evento.setId(rs.getInt("id"));
                evento.setDescricao(rs.getString("descricao"));
                evento.setDataEvento(rs.getString("data_evento"));
                evento.setLocalEvento(rs.getString("local_evento"));
                evento.setObservacoes(rs.getString("observacoes"));
            }
            
            rs.close();
            stmt.close();
            conn.close();
        }
        
        catch (Exception e) {
            e.printStackTrace();
        }
        
        return evento;
}




public void atualizar(Evento evento){
    
    String sql = "UPDATE eventos " 
               + "SET descricao=?, data_evento=?, " 
               + "local_evento=?, observacoes=? "
               + "WHERE id=?";
                    
            try {
                
                Connection conn = 
                        Conexao.conectar();
                
                System.out.println(sql);
                
                PreparedStatement stmt = 
                        conn.prepareStatement(sql);
                
                stmt.setString(1, evento.getDescricao());
                stmt.setString(2, evento.getDataEvento());
                stmt.setString(3, evento.getLocalEvento());
                stmt.setString(4, evento.getObservacoes());
                stmt.setInt(5, evento.getId());
                
                stmt.executeUpdate();
                stmt.close();
                conn.close();
            }
            
            catch(Exception e){
                e.printStackTrace();
            }
}


public int contarEventos() {
    
    int total = 0;
    
    String sql = 
            
            "SELECT COUNT(*) FROM eventos";
                
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

} // Final do método


