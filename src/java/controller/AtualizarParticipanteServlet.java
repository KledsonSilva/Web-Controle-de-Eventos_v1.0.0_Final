/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import br.com.churrasco.dao.ParticipanteDAO;
import br.com.churrasco.model.Participante;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author Cledson Silva
 */
@WebServlet("/AtualizarParticipanteServlet")
public class AtualizarParticipanteServlet extends HttpServlet {

     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Participante participante = new Participante();
        
        participante.setId(Integer.parseInt(request.getParameter("id")));
        
        participante.setNome(request.getParameter("nome"));
        
        participante.setTelefone(request.getParameter("telefone"));
        
        participante.setEmail(request.getParameter("email"));
        
        participante.setValorContribuicao(Double.parseDouble(request.getParameter("valor_contribuicao")));
        
        ParticipanteDAO dao = new ParticipanteDAO();
        
        dao.atualizar(participante);
        
        response.sendRedirect("ListarParticipantesServlet?sucesso=participanteEditado");
    }

}
