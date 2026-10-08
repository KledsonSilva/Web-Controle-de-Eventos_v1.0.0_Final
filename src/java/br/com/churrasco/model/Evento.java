/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package br.com.churrasco.model;

/**
 *
 * @author Cledson Silva
 */
public class Evento {
    
    private int id;
    private String descricao;
    private String dataEvento;
    private String localEvento;
    private String observacoes;
   
    
    public Evento() {
    }
    
        public int getId() {
            return id;
        }
        
        public void setId(int id) {
            this.id = id;
        }
        
        public void setDescricao(String descricao){
            this.descricao = descricao;
        }
        
        public String getDescricao() {
            return descricao;
        }
        
        public String getDataEvento() {
            return dataEvento;
        }
        
        public void setDataEvento(String dataEvento) {
            this.dataEvento = dataEvento;
        }
        
        public String getLocalEvento() {
            return localEvento;
        }
        
        public void setLocalEvento(String localEvento) {
            this.localEvento = localEvento;
        }
        
        public String getObservacoes() {
            return observacoes;
        } 
        
        public void setObservacoes(String observacoes) {
            this.observacoes = observacoes;
        }
    }
    

