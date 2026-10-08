/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import br.com.churrasco.dao.EventoDAO;
import br.com.churrasco.model.Evento;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 *
 * @author Cledson Silva
 */
@WebServlet("/ListarEventosServlet")
public class ListarEventos extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            
            throws ServletException, IOException{
                EventoDAO dao = new EventoDAO();
                List<Evento> eventos = dao.listar();
                request.setAttribute("eventos", eventos);
                request.getRequestDispatcher("/listarEventos.jsp").forward(request, response);
    }
}

