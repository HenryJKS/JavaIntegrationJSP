<%@page import="br.fiap.dao.conexao.DepartamentoDAO"%>
<%@page import="br.fiap.modelo.Departamento"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Document</title>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$('select').material_select('destroy');	
		});
	</script>
</head>
<body>
	
	<% List<Departamento> lista = new DepartamentoDAO().listar(); %>


	<div class="container">
		<div class="row">
		<form class="col s12" action="">
			<div class="row">
				<div class="input-field col s6">
          			<input id="nome" name="nome" type="text">
          			<label for="nome">Nome</label>
        		</div>			
			</div>
			<div class="row">
				<div class="input-field col s6">
          			<input id="cpf" name="cpf" type="text">
          			<label for="cpf">CPF</label>
        		</div>			
			</div>
			<div class="row">
				<label>Departamento</label>
				<select>
      				<option value="" disabled selected>Escolha o departamento</option>
      				<% for(Departamento departamento : lista) { %>
      					<option value="<%= departamento.getId()%>"><%= departamento.getNome() %></option>
      				<% } %>
    			</select>    			
			</div>
			<div class="row">
				<button class="btn waves-effect waves-teal" type="submit">Cadastrar<i class="material-icons right">send</i></button>
			</div>
		</form>
	</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
	    	$('select').material_select();
	    	$('.modal').modal();
		});
	</script>
</body>
</html>