package br.fiap.dao.conexao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.fiap.modelo.Departamento;
import br.fiap.modelo.Empregado;

public class EmpregadoDAO extends DAO {

	//Método para retornar os dados (cpf, nome e departamento) do empregado
	public List<Empregado> listar() {
		List<Empregado> lista = new ArrayList();
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		Empregado empregado;
		Departamento departamento;
		
		sql = "select E.nome, E.cpf, D.nome as deptnome from java_empregado E," +
		"java_departamento D where E.id_departamento = D.id order by E.nome";
		
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				departamento = new Departamento();
				empregado = new Empregado();
				departamento.setNome(rs.getString("deptnome"));
				empregado.setCpf(rs.getString("cpf"));
				empregado.setNome(rs.getString("nome"));
				empregado.setDepartamento(departamento);
				lista.add(empregado);
			}
			ps.close();
			conexao.desconectar();
		} catch (SQLException e) {
			System.out.println("Erro ao listar empregados" + e);
		}
		
		return lista;
	}
	
}
