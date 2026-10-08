<%-- 
    Document   : participantesEvento
    Created on : 5 de out. de 2026, 11:01:45
    Author     : Cledson Silva
--%>

<%@page import="java.util.List"%>
<%@page import="br.com.churrasco.model.Participante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Participante> participantes = (List<Participante>) request.getAttribute("participantes");
    
    Integer idEvento = (Integer)request.getAttribute("idEvento");
    
    List<Integer> participantesSelecionados = (List<Integer>) request.getAttribute("participantesSelecionados");
%>



<!DOCTYPE html>
<html>
    
    <head>
        <meta charset="UTF-8">
        <title>Participantes do Evento</title>
    </head>
    
    <style>
    
         body{
            font-family: Arial, sans-serif;
            margin: 30px;
        }

        .titulo{
            font-style: italic;
            border-bottom: 2px solid #1565C0;
        }

        .card{
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
        }

        .participante{
            margin-bottom: 10px;
            font-size: 15px;
        }

        .btn-salvar{
            display: inline-block;
            margin-top: 20px;
             padding: 10px 20px;
             background-color: #0d6efd;
             color: white;
             border: none;
             border-radius: 8px;
             cursor: pointer;
             font-weight: bold;
        }

        .btn-salvar:hover{
            background-color: #0b5ed7;
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
        
        input[type="checkbox"]{
            transform: scale(1.5);
            margin-right: 10px;
        }
    
</style>
    
    <body>
        
       <form method="post" action="GerenciarParticipantesEventosServlet">  
        
       <h1>
           
           <span class ="icone"> 👥 </span>
           <span class="titulo"> Participantes do Evento </span>
           
       </h1>

       <input type="hidden"  name="idEvento" value="<%= idEvento %>">

    <%
        
    if(participantes != null){
        for(Participante participante : participantes){
    %>
    
    <div class="participante">
        
        <input type="checkbox"
               name="id_participantes"
               value="<%= participante.getId() %>"
               <%= participantesSelecionados.contains(participante.getId())? "checked" :""%>>

        <%= participante.getNome() %>

        </div>

    <%
        }
    }
    %>

    <br>

    <input type="submit"
           value="💾Salvar Participantes"
           class="btn-salvar">

</form>
    
    <a href="home.jsp" class="btn-home">
        🏠 Página Inicial
    </a>
    
    </body>
</html>
