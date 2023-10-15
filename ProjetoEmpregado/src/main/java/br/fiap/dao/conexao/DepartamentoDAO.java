package br.fiap.dao.conexao;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.fiap.modelo.Departamento;

public class DepartamentoDAO extends DAO {
	
	
	public List<Departamento> listar() {
		List<Departamento> lista = new ArrayList();
		Conexao conexao = new Conexao();
		connection = conexao.conectar();
		Departamento departamento;
		
		sql = "select * from java_departamento";
		
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				departamento = new Departamento();
				departamento.setId(rs.getInt("id"));
				departamento.setNome(rs.getString("nome"));
				lista.add(departamento);
			}
			ps.close();
			conexao.desconectar();
		} catch (SQLException e) {
			System.out.println("Erro ao listar os departamentos " + e);
		}
		
		return lista;
	}

}
