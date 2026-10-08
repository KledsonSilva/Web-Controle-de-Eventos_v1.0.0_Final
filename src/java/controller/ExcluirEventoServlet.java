/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package br.com.churrasco.servlet;

import br.com.churrasco.dao.EventoDAO;
import br.com.churrasco.dao.EventoParticipanteDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ExcluirEventoServlet")
public class ExcluirEventoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id =
                Integer.parseInt(
                    request.getParameter("id"));

            EventoParticipanteDAO epDAO =
                    new EventoParticipanteDAO();

            // Remove primeiro os vínculos
            epDAO.excluirParticipacoesDoEvento(id);

            EventoDAO eventoDAO =
                    new EventoDAO();

            // Depois remove o evento
            eventoDAO.excluir(id);

            response.sendRedirect(
                "ListarEventosServlet?sucesso=eventoExcluido");

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                "ListarEventosServlet");
        }
    }
}