<%-- 
    Document   : cadastroEvento
    Created on : 24 de set. de 2026, 23:25:43
    Author     : Cledson Silva
--%>

<%@ page contentType="text/html;charset=UTF-8" %>

    <% 
    String sucesso = request.getParameter("sucesso");
    %> 

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Evento</title>
    
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
           margin-top: 20px;
           padding: 10px 20px;
           background-color: #198754;
           color: white;
           text-decoration: none;
           border-radius: 5px;
           font-weight: bold;
        }
       
     </style>
     
        
</head>

<body>

    <h1> 
        
        <span class="icone"> 📅 </span>
        <span class="titulo"> Cadastro de Evento </span>
         
    </h1>
    
     
    <form action="EventoServlet" method="post">
        
        <label>Descrição</label>
        <input type="text" name="descricao" required>

        <label>Data do Evento</label>
        <input type="date" name="dataEvento" required>

        <label>Local</label>
        <input type="text" name="localEvento">

        <label>Observações</label>
        <textarea name="observacoes"></textarea>

        <button type="submit">
        Salvar Evento
        </button>
        <br>
        
        <a href="home.jsp" class="btn-home">
            
             🏠 Página Inicial
            
        </a>    
        
    </form>
    
        <% 
          if ("eventoCadastrado".equals(sucesso)) {
        %>      
        
              <div class="mensagem-sucesso">
                ✅ Evento cadastrado com sucesso!
              </div>  
              
        <%
         }
        %>

</body>
</html>















