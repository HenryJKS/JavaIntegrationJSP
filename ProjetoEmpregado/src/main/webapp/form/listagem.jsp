<%@page import="br.fiap.dao.conexao.EmpregadoDAO"%>
<%@page import="br.fiap.modelo.Empregado"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	</head>
<body>

	<% List<Empregado> lista = new EmpregadoDAO().listar(); %>
	
	<div class="container">
	
	 <table class="striped">
		
		<thead>
			<tr>
				<th>CPF</th>
				<th>Nome</th>
				<th>Departamento</th>
			</tr>
		</thead>

		<tbody>
		 <% for(Empregado empregado : lista) { %>
		 	
		 	<tr> 
		 		<td><%= empregado.getCpf()  %></td>
		 		<td><%= empregado.getNome() %></td>
		 		<td><%= empregado.getDepartamento().getNome() %></td>
		 	</tr>
		 	
		 <% } %>
		</tbody>	
	
	 </table>
	
	</div>

</body>
</html>