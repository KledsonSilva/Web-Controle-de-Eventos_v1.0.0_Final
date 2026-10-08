<%-- 
    Document   : home
    Created on : 24 de set. de 2026, 20:01:37
    Author     : Cledson Silva
--%>

<%@page import="br.com.churrasco.dao.EventoDAO"%>
<%@page import="br.com.churrasco.dao.EventoParticipanteDAO"%>
<%@page import="br.com.churrasco.dao.ParticipanteDAO"%>
        
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sistema de controle de Eventos</title>
    </head>
    
    <style>
        
        body{
            font-family: Arial, sans-serif;
            background-color: #F4F4F4;
            text-align: center;
            margin:0;
            padding: 0;
        }
        
        .container{
            width: 700px;
            margin: 100px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 2px 10px rgba(0,0,0,0.2);
            
        }
        
        h1{
            color: #1565C0;
            margin-bottom: 10px;
        }
        
        /* Deixa os botôes alinhados com os textos centralizados*/
        .btn{                                
            display: inline-block;
            width: 180px;
            margin:10px;
            padding: 12px 20px;
            background: #1565C0;
            color:white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            text-align: center;
        }
        
        .btn:hover{
            background: #0D47A1
        }
        
        /*.btn-sair{
            display: inline-block;
            margin: 10px;
            padding: 12px 20px;
            background: #D32F2F;           Futuro botão de sair do login
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }
        
        .btn-sair:hover{
            background: #B71C1C;
        }*/
        
        .menu{
            background-color: #1565C0;
            padding: 15px;
            width: 100%;
            
        }
        
        .menu a{
            color: white;
            text-decoration: none;
            margin: 0 15px;
            font-weight: bold;
        }
        
        
        .menu :hover{
            text-decoration: underline;
        }
        
        .dashboard {
           display:flex;
           justify-content: center;
           gap:20px;
           margin-bottom:30px;
        }

        .card{
           background:#f8f9fa;
           width:180px;
           padding:20px;
           border-radius:1px;
           box-shadow:0px 2px 5px rgba(0,0,0,0.3);
        }

       .card h2{
           margin:0;
           color:#1565C0;
        }

       .card p{
          font-size:30px;
          font-weight:bold;
        }
        
        
    </style>    
    
    
    
    <body>
        
         <!-- Classe menur criada para colocar todos os botões na barra superior -->
         <div class="menu">
            
            <a href="home.jsp">
               🏠 Home 
            </a>
             
            
            <a href="cadastroEvento.jsp">
               ➕ Cadastrar Evento 
            </a>
             
            
            <a href="ListarEventosServlet">
               📋 Listar Eventos 
            </a>
             
             
             <a href="cadastroParticipante.jsp">
               👥 Cadastrar Participante
             </a>
             
             <a href="sobre.jsp">
               ℹ️ Sobre
             </a>
             
        </div>
         
         
         
        <%
            
          EventoDAO eventoDAO = new EventoDAO();
          
          ParticipanteDAO participanteDAO = new ParticipanteDAO();

          EventoParticipanteDAO eventoParticipanteDAO = new EventoParticipanteDAO();

          int totalEventos = eventoDAO.contarEventos();

          int totalParticipantes = participanteDAO.contarParticipantes();

          int totalParticipacoes = eventoParticipanteDAO.contarParticipacoes();
         
        %> 
        
        
        
        <!-- Classe conteiner criada para colocar todos os botões na home -->
        <div class="container">                                   
        
        <h1>📅 Sistema de Controle de Eventos Versão 1.0.0</h1>
          
        <a href="cadastroEvento.jsp" class="btn">
           Cadastrar Evento
        </a>
        
        
        <a href="ListarEventosServlet" class="btn">
            Listar Eventos    
        </a>  
        
        
        <a href="cadastroParticipante.jsp" class="btn">
            Cadastrar Participante
        </a>
        
        
        <a href="ListarParticipantesServlet" class="btn">
           Listar Participantes
        </a>
        <br><br>
        
        
        <div class="dashboard">

        <div class="card">
        <br>
        <h2>📅 Eventos</h2>
        <p><%= totalEventos %></p>
        </div>

        <div class="card">
        <h2>👥 Participantes</h2>
        <p><%= totalParticipantes %></p>
        </div>

        <div class="card">
        <h2>🔗 Participações</h2>
        <p><%= totalParticipacoes %></p>
        </div>

</div>
           
        <!-- Para o futuro botao sair do login-->
        <!--a href="home.jsp" class="btn-sair"-->
        <!--Sair*/-->
        <!-- /a -->
     
        </div>

    </body>
    
</html>
