<%-- 
    Document   : cadastroParticipante
    Created on : 27 de set. de 2026, 08:25:53
    Author     : Cledson Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

 <% 
    String sucesso = request.getParameter("sucesso");
 %> 


<!DOCTYPE html>
<html>
    
    
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Participante</title>
        
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
           width: 100%;
           padding: 8px;
           margin-top: 5px;
           box-sizing: border-box;
           border-radius: 5px;
           border: 1px solid #CCC;
        }
        
        button {
           display: block;
           width: 50%;
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
             margin-top: 20px;
             padding: 10px 20px;
             background-color: #198754;
             color: white;
             text-decoration: none;
             border-radius: 5px;
             font-weight: bold;
        }

        .btn-home:hover{
            background-color: #157347;
        }
          
       </style>
        
    </head>
    
    
    <body>
        
        <h1> 
            
            <span class"icone"> 👥 </span>
            <span class="titulo"> Cadastro de Participante </span>
             
        </h1>
        
        <form action="ParticipanteServlet" method="post">
            
            <label>Nome</label>
            <input type="text" name="nome" required>
            
            <label>Telefone</label>
            <input type="text" name="telefone" required>
             
            <label>Email</label>
            <input type="email" name="email">
           
            <label>Valor de contribuição (R$)</label>
            <input type="number" step="0.01" name="valorContribuicao">
            
            <button type="submit">
            Cadastrar Participante
            </button>
            <br>
            
        </form>
        
        <% 
          if ("participanteCadastrado".equals(sucesso)) {
        %>      
        
              <div class="mensagem-sucesso">
                ✅ Participante cadastrado com sucesso!
              </div>  
              
        <%
         }
        %>
        
        <a href="home.jsp" class="btn-home">
            
        🏠 Página Inicial

        </a>
        
    </body>
    
</html>
