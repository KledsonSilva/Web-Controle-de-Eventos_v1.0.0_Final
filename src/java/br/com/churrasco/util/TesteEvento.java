/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.churrasco.util;

import br.com.churrasco.dao.EventoDAO;
import br.com.churrasco.model.Evento;

/**
 *
 * @author Cledson Silva
 */
public class TesteEvento {
    
    public static void main(String[] args) {
        
        Evento evento = new Evento();
        
        evento.setDescricao("Churrasco dos Amigos");
        evento.setDataEvento("2026-10-10");
        evento.setLocalEvento("Campinas");
        evento.setObservacoes("Primeiro evento de teste");
        
        EventoDAO dao = new EventoDAO();
        
        dao.salvar(evento);
        
        System.out.println("Teste concluído");
    }    
}
