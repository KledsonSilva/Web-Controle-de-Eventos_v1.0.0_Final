<%-- 
    Document   : editarParticipante
    Created on : 3 de out. de 2026, 18:29:02
    Author     : Cledson Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.com.churrasco.model.Participante"%>

<%
    Participante participante = (Participante) request.getAttribute("participante");
    
    // Validação para evitar NullPointerException caso a requisição chegue sem o atributo
    
    if (participante == null) {
        // Redireciona para a listagem ou a página de erro
        response.sendRedirect("ListarParticipantesServlet");
        return;
    }
%>



<!DOCTYPE html>
<html lang="pt-BR">
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Participante</title>
        
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
       
         .btn-voltar{
            display: inline-block;
            margin-top: 20px;
            padding: 10px ;
            background-color: #6C757D;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .btn-voltar:hover{
            background-color: #5C636A;
        }
                
        </style>
        
    </head>
    
    <body>
        
        <form method="post" action="AtualizarParticipanteServlet">
              
            <h1>
                
                <span class="icone"> 👥 </span>
                <span class="titulo"> Editar Participante </span>
                
            </h1>
            
            <!-- Campo oculto para o ID do evento -->
            <input type="hidden" name="id" value= "<%=participante.getId()%>">
                   
            <label for="nome">Nome </label>
            <input type="text" id="nome" name="nome" value="<%= participante.getNome() != null ? participante.getNome() : "" %>" required>
            
            <label for="telefone">Telefone </label>
            <input type="text" id="telefone" name="telefone" value="<%= participante.getTelefone() != null ? participante.getTelefone(): "" %>" required>
            
            <label for="email">E-mail </label>
            <input type="text" id="email" name="email" value="<%= participante.getEmail()!= null ? participante.getEmail(): "" %>" required>
            
            <!<!-- Formata o valor para ser exibido  -->
            <label for="valor_contribuicao">Valor da Contribuição (R$) </label>
            <input type="number" step="0.01" id="valor_contribuicao" name="valor_contribuicao" value="<%= participante.getValorContribuicao() %>">
            
            <button type="submit">
            Atualizar
            </button>
            
             
            <a href="ListarParticipantesServlet" class="btn-voltar">
               
            ⬅ Voltar
               
            </a>
            
    </body>
    
    </form>
           
    
</html>



