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
@WebServlet("/EditarEventoServlet")
public class EditarEventoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        
        EventoDAO dao  = new EventoDAO();
        
        Evento evento = dao.buscarPorId(id);
        
        request.setAttribute("evento", evento);
        
        request.getRequestDispatcher("editarEvento.jsp")
                .forward(request, response);
    
    }

}
