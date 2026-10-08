<%@page import="br.com.churrasco.model.Participante"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>

<%
List<Participante> listaParticipantes =
    (List<Participante>)
    request.getAttribute("listaParticipantes");
%>

<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">
    <title>Lista de Participantes</title>

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

        .acao-editar{
            color: #1565C0;
            font-weight: bold;
        }

        .acao-excluir{
            color: #D32F2F;
            font-weight: bold;
        }

        .mensagem-sucesso{
            background-color: #D4EDDA;
            color: #155724;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #C3E6CB;
            font-weight: bold;
        }

        .titulo{
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
        
        .btn-voltar{
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #6c757d;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
        }

        .btn-voltar:hover{
            background-color: #5c636a;
        }


    </style>

</head>

<body>

<h1>

    <span class="icone">👥</span>
    <span class="titulo">Lista de Participantes</span>

</h1>
    
<%
String sucesso = request.getParameter("sucesso");

if("participanteExcluido".equals(sucesso)) {
%>

<div class="mensagem-sucesso">
    ✅ Participante excluído com sucesso!
</div>

<%
}

if("participanteEditado".equals(sucesso)) {
%>

<div class="mensagem-sucesso">
    ✅ Participante editado com sucesso!
</div>

<%
}
%>

<table>

<tr>
    <th>ID</th>
    <th>Nome</th>
    <th>Telefone</th>
    <th>Email</th>
    <th>Contribuição</th>
    <th>Ações</th>
</tr>

<%
if(listaParticipantes != null){

    for(Participante participante : listaParticipantes){
%>

<tr>

    <td><%= participante.getId() %></td>

    <td><%= participante.getNome() %></td>

    <td><%= participante.getTelefone() %></td>

    <td><%= participante.getEmail() %></td>

    <td>
        R$
        <%= String.format("%.2f",
            participante.getValorContribuicao()) %>
    </td>

    <td>

        <a class="acao-editar" 
           href="EditarParticipanteServlet?id=<%=participante.getId()%>">
           Editar
        </a>

        |

        <a class="acao-excluir"
         href="ExcluirParticipanteServlet?id=<%= participante.getId() %>"
         onclick="return confirm('Deseja realmente excluir este participante?');">

   Excluir

</a>

    </td>

</tr>

<%
    }
}
%>

</table>

        <a href="home.jsp" class="btn-home">
            
            🏠 Página Inicial

        </a>
</body>

</html>