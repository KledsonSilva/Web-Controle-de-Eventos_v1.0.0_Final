<%-- 
    Document   : listarEventos
    Created on : 25 de set. de 2026, 13:54:51
    Author     : Cledson Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="br.com.churrasco.model.Evento"%>
<%@page import="br.com.churrasco.dao.EventoParticipanteDAO"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Eventos</title>

    <style>

        body{
            font-family: Arial, sans-serif;
            margin: 30px;
        }

        table{
            border-collapse: collapse;
            width: 100%;
        }

        th, td{
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th{
            background-color: #0d6efd;
            color: white;
        }
        
        .participantes {
            
            background-color: #F8F9Fa;
            padding: 8px;
            border-radius: 5px;
            line-height: 1.5;
            font-size: 14px;
        }
        
        .participantes-titulo {
            font-weight: bold;
            color: #6f42C1;
            margin-bottom: 5px
        }
        
        .acao-editar {
            color: #1565C0;
            font-weight: bold;
        }
        
        .acao-excluir {
            color: #D32F2F;
            font-weight: bold;
        }
        
        .acao-participantes {
            color: #6f42C1;
            font-weight: bold;
        }
        
        .mensagem-sucesso {
            background-color: #D4EDDA;
            color: #155724;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #C3E6CB;
            font-weight: bold;
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

<h1>
    
    <span class="icone">📋</span>
    <span class="titulo"> Lista de Eventos </span>
    
</h1>

<%
String sucesso = request.getParameter("sucesso");

if("eventoExcluido".equals(sucesso)) {
%>

<div class="mensagem-sucesso">
    ✅ Evento excluído com sucesso!
</div>

<%
}

if("eventoEditado".equals(sucesso)) {
%>

<div class="mensagem-sucesso">
    ✅ Evento atualizado com sucesso!
</div>

<%
}
%>

<table>

    <tr>
        <th>ID</th>
        <th>Descrição</th>
        <th>Data</th>
        <th>Local</th>
        <th>Observações</th>
        <th>Participantes</th>
        <th>Ações</th>
    </tr>

<%                                                                                  // Executa o Java 
         List<Evento> eventos =
         (List<Evento>) request.getAttribute("eventos");

         if (eventos != null) {

         for (Evento evento : eventos) {
             
         EventoParticipanteDAO eventoParticipanteDAO = new EventoParticipanteDAO();
         
         List<String> nomesParticipantes = eventoParticipanteDAO.listarNomesParticipantesPorEvento(evento.getId());         
%>

<tr>
    <td><%= evento.getId() %></td>
    <td><%= evento.getDescricao() %></td>
    <td><%= evento.getDataEvento() %></td>
    <td><%= evento.getLocalEvento() %></td>
    <td><%= evento.getObservacoes() %></td>
    
    <td>

        <div class="participantes">   <!<!-- Chama o CSS para o visual dos participantes -->                                                
        
    👥 Total Participantes:
    <%= nomesParticipantes.size() %>

    <br><br>

    <%
        if(nomesParticipantes.isEmpty()){
    %>

    Nenhum participante

    <%
       }else{

         for(String nome : nomesParticipantes){
    %>

         • <%= nome %><br>

    <%
      }
    }
    %>
    
    </div>

</td>
   
    
    <td>
       
        <a class="acao-editar" href="EditarEventoServlet?id=<%=evento.getId()%>"> <!-- Chama a classe CSS e coloca o hyperlink nas palavras chamando no Servlet -->
        Editar 
        </a>
        |
        <a class="acao-excluir" href="ExcluirEventoServlet?id=<%=evento.getId()%>" onclick="return confirm ('Deseja realmente excluir este evento?');">
        Excluir
        </a>
        |
        <a class="acao-participantes" href="GerenciarParticipantesEventosServlet?id=<%=evento.getId()%>">
        Adicionar Participante    
        </a> 
    </td>
     

</td>

  <%                                                                               //Executa  a tabela 
    }
    }
  %>
  
</table>
  
        <a href="home.jsp" class="btn-home">
            
            🏠 Página Inicial

        </a>

</body>
</html>
