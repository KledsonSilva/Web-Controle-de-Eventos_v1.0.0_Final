<%-- 
    Document   : editarEvento
    Created on : 26 de set. de 2026, 13:42:51
    Author     : Cledson Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.churrasco.model.Evento"%>

<%
    
    String sucesso = request.getParameter("sucesso");
    
%>    

<%
    Evento evento = (Evento) request.getAttribute("evento");

    // Validação para evitar NullPointerException caso a requisição chegue sem o atributo
    if (evento == null) {
        response.sendRedirect("ListarEventosServlet"); // Redireciona para a listagem ou página de erro
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
    
    <head>
        <meta charset="UTF-8">
        <title>Editar Evento</title>
        
        <style>
            
         body {
           font-family: Arial, sans-serif;
           margin: 30px;
        }
        
         .mensagem-sucesso {
           background-color: #D4EDDA;
           width: 48%;
           color: #155724;
           padding: 12px;
           margin-bottom: 15px;
           border-radius: 5px;
           border: 1px solid #C3E6CB;
           font-weight: bold;
        }
        
        form {
           width: 450px;
           max-width: 450px;
        }

        label {
           display: block;
           margin-top: 15px;
           font-weight: bold;
        }

        input {
           display: block;
           width: 50%;
           padding: 8px;
           margin-top: 5px;
           box-sizing: border-box;
           border-radius: 5px;
           border: 1px solid #CCC;
        }

        textarea {
           display: block;
           width: 50%;
           height: 80px;
           padding: 8px;
           margin-top: 5px;
           box-sizing: border-box;
           border-radius: 5px;
           border: 1px solid #CCC;
        }

        button {
           display: block;
           width: 10%;
           margin-top: 20px;
           padding: 10px;
           background-color: #0D6EFD;
           color: white;
           border: none;
           border-radius: 5px;
           cursor: pointer; 
        }

       button:hover {
           background-color: #0B5ED7;
       }
       
       .titulo {
           font-style: italic;
           border-bottom: 2px solid #1565C0;
       }
       
       .btn-home{
           display: inline-block;
           margin-top: 15px;
           padding: 10px 20px;
           background-color: #198754;
           color: white;
           text-decoration: none;
           border-radius: 8px;
           font-weight: bold;
       }

        .btn-home:hover{
           background-color: #157347;
        }
            
        </style>
        
    </head>
    
    <body>
        <form method="post" action="AtualizarEventoServlet">

            <h1>
                
                <span class="icone"> 📋 </span>
                <span class="titulo"> Editar Evento </span>
                
            </h1>
            
            <!-- Campo oculto para o ID do evento -->
            <input type="hidden" name="id" value= "<%= evento.getId() %>">

            <label for="descricao">Descrição:</label><br>
            <!-- Compara se há um texto, caso contrario exibe "required" -->
            <input type="text" id="descricao" name="descricao" value="<%= evento.getDescricao() != null ? evento.getDescricao() : "" %>" required>
            
            <label for="dataEvento">Data:</label><br>
            <!-- Certifique-se de que getDataEvento() retorne no formato ISO "yyyy-MM-dd" -->
            <input type="date" id="dataEvento" name="dataEvento" value="<%= evento.getDataEvento() != null ? evento.getDataEvento() : "" %>" required>
         
            <label for="localEvento">Local:</label><br>
            <input type="text" id="localEvento" name="localEvento" value="<%= evento.getLocalEvento() != null ? evento.getLocalEvento() : "" %>">
            
            <label for="observacoes">Observação:</label><br>
            <textarea id="observacoes" name="observacoes" rows="4" cols="50"><%= evento.getObservacoes() != null ? evento.getObservacoes() : "" %></textarea>
            
            <button type="submit"> 
            Atualizar
            </button>
            <br>
        </form>   
            
              <% 
              if ("eventoEditado".equals(sucesso)) {
              %>      
        
              <div class="mensagem-sucesso">
                ✅ Evento editado com sucesso!
              </div>  
              <%
               }
              %>
            
            <a href="home.jsp" class="btn-home">
            🏠 Página Inicial
            </a>
                        
    </body>
</html>