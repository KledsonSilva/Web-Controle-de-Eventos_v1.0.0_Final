/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import br.com.churrasco.dao.EventoDAO;
import br.com.churrasco.model.Evento;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Cledson Silva
 */

@WebServlet("/AtualizarEventoServlet")
public class AtualizarEventoServlet extends HttpServlet {

    
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("Entrou no atualizarEventoServlet");                  //Verificação de debuggin no log Apache
        
        Evento evento = new Evento();
        
        evento.setId(Integer.parseInt(request.getParameter("id")));
        
        evento.setDescricao(request.getParameter("descricao"));
        
        evento.setDataEvento(request.getParameter("dataEvento"));
        
        evento.setLocalEvento(request.getParameter("localEvento"));
        
        evento.setObservacoes(request.getParameter("observacoes"));
        
        EventoDAO dao = new EventoDAO();
        
        dao.atualizar(evento);
        
        response.sendRedirect("ListarEventosServlet?sucesso=eventoEditado");
       }
}

