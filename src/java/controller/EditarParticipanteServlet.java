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
@WebServlet("/EditarParticipanteServlet")
public class EditarParticipanteServlet extends HttpServlet {

   
    
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        ParticipanteDAO dao = new ParticipanteDAO();
        
        Participante participante = dao.buscarPorId(id);
        
        request.setAttribute("participante", participante);
        
        System.out.println("Indo para editarParticipante.jsp");
        
        request.getRequestDispatcher("editarParticipante.jsp").forward(request, response);
    }

}
