/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import br.com.churrasco.dao.ParticipanteDAO;
import br.com.churrasco.dao.EventoParticipanteDAO;
import br.com.churrasco.model.Participante;
import java.util.List;

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
@WebServlet("/GerenciarParticipantesEventosServlet")
public class GerenciarParticipantesEventosServlet extends HttpServlet {

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        int idEvento = Integer.parseInt(request.getParameter("id"));
        
        ParticipanteDAO participanteDAO = new ParticipanteDAO();
        
        List<Participante> participantes =  participanteDAO.listar();
        
        EventoParticipanteDAO dao = new EventoParticipanteDAO();
        
        List<Integer> participantesSelecionados = dao.listarParticipantesDoEvento(idEvento);
        
        request.setAttribute("participantes", participantes);
        
        request.setAttribute("participantesSelecionados", participantesSelecionados);
        
        request.setAttribute("idEvento", idEvento);
                
        request.getRequestDispatcher("participantesEvento.jsp").forward(request, response);

    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
            System.out.println("idEvento = " + request.getParameter("idEvento"));                                                             // Mostrar no log do TomEE a quantidade de participantes para ver se esta ok.
            
            String[] participantesSelecionados = request.getParameterValues("id_participantes");
            
            System.out.println("Quantidade selecionados = " + (participantesSelecionados == null? 0 : participantesSelecionados.length));     // Mostrar no log do TomEE a quantidade de participantes selecionados para ver se esta ok.
            
            int idEvento = Integer.parseInt(request.getParameter("idEvento"));
            
                EventoParticipanteDAO dao = new EventoParticipanteDAO();
            
                for(String idParticipante : participantesSelecionados) {                             //Percorre
                    dao.adicionarParticipanteAoEvento(idEvento, Integer.parseInt(idParticipante));
                    
                response.sendRedirect("GerenciarParticipantesEventosServlet?id=" + idEvento);                                                  // Retorna para a tela para não ficar em branco.
                
                return;                                                                                                                         
                }
                    
    }
        
}
