<%-- 
    Document   : sobre
    Created on : 7 de out. de 2026, 16:05:46
    Author     : Cledson Silva
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Sobre o Sistema</title>

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
    box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
    margin-top: 20px;
}

.btn-home{
    display: inline-block;
    margin-top: 20px;
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
    <span>ℹ️</span>
    <span class="titulo">Sobre o Sistema</span>
</h1>

<div class="card">

<h3>Objetivo</h3>

<p>
Sistema desenvolvido para gerenciamento de eventos e participantes,
permitindo cadastro, edição, exclusão e associação entre eventos e participantes.
</p>

<h3>Tecnologias Utilizadas</h3>

<ul>
    <li>Java Web</li>
    <li>JSP</li>
    <li>Servlets</li>
    <li>JDBC</li>
    <li>MySQL</li>
    <li>HTML5</li>
    <li>CSS3</li>
    <li>Apache Tomcat</li>
</ul>

<h3>Arquitetura</h3>

<p>
O projeto foi desenvolvido utilizando o padrão MVC
(Model View Controller), com separação entre:
</p>

<ul>
    <li>Model (Entidades)</li>
    <li>View (JSP)</li>
    <li>Controller (Servlets)</li>
    <li>DAO (Acesso ao Banco de Dados)</li>
</ul>

<h3>Funcionalidades Implementadas</h3>

<ul>
    <li>Cadastro de Eventos</li>
    <li>Listagem de Eventos</li>
    <li>Edição de Eventos</li>
    <li>Exclusão de Eventos</li>
    <li>Cadastro de Participantes</li>
    <li>Listagem de Participantes</li>
    <li>Edição de Participantes</li>
    <li>Exclusão de Participantes</li>
    <li>Relacionamento Evento x Participante</li>
    <li>Dashboard Estatístico</li>
</ul>

<h3>Projeto Acadêmico</h3>

<p>
Projeto desenvolvido para a disciplina de Engenharia de Software, na Universidade Cruzeiro do Sul
com foco em desenvolvimento Web utilizando Java, CSS e Banco de Dados Relacional.

</p>

<p>
Professor(a) Katia Alves Bezerra
</p>
<p>
Tutor(a) Fabiana Sabai Rodrigues
</p>

<p>
Desenvolvedor: Cledson da Silva RGM 1833464979    
</p>

</div>

        <a href="home.jsp" class="btn-home">
            
        🏠 Página Inicial

        </a>

</body>

</html>
