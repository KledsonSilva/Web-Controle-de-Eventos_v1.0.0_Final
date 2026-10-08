/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import br.com.churrasco.dao.ParticipanteDAO;
import br.com.churrasco.model.Participante;

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
@WebServlet("/ParticipanteServlet")
public class ParticipanteServlet extends HttpServlet {
    
    @Override 
    protected void doGet  (HttpServletRequest request,
        HttpServletResponse response)
            throws ServletException, IOException {
        
        request.getRequestDispatcher("/cadastroParticipante.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
                        
            throws ServletException, IOException {
        
        System.out.println("=== ENTROU NO PARTICIPANTESSERVLET ===");              //Imprime no log para ver se entrou no metodo doPost;
        System.out.println(request.getParameter("nome"));                          //Imprime no log o nome do participante

        
        Participante participante = new Participante();
        
        System.out.println("Entrou no ParticipanteServlet");                       //Imprime no log para indicar que entrou no servlet e mostra a quantidade de participante
                                                                                   //cadastrado.
        participante.setNome(
                request.getParameter("nome"));
        
        participante.setTelefone(
                request.getParameter("telefone"));
        
        participante.setEmail(
                request.getParameter("email"));
        
        participante.setValorContribuicao(
                Double.parseDouble(
                        request.getParameter("valorContribuicao")));
        
        ParticipanteDAO dao = new ParticipanteDAO();
        
        dao.salvar(participante);
        
        response.sendRedirect("cadastroParticipante.jsp?sucesso=participanteCadastrado");
    }
    
}
