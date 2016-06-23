/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lw.energiapura;

import com.lw.energiapura.model.SalaModel;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Leticia
 */
public class SalaController {

    Statement comando;
    Connection conexao;
    List<SalaModel> sala = new ArrayList<SalaModel>();
    int i;

    public void buscaLampadasSala(int andar) throws ClassNotFoundException {

        String sql = "SELECT * FROM salas WHERE andar='"+andar+"' ORDER BY numSala;";

        String driverName = "com.mysql.jdbc.Driver";
        Class.forName(driverName);

        // Abre a Conexão		
        String url = "jdbc:mysql://localhost:3306/energiapura";
        String user = "root";
        String password = "faesp";

        try {
            conexao = DriverManager.getConnection(url, user, password);

            ResultSet resultado;
            SalaModel salasProv;

            comando = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            resultado = comando.executeQuery(sql);

            while (resultado.next()) {

                salasProv = new SalaModel(resultado.getInt("numSala"),
                            resultado.getInt("andar"),
                            resultado.getString("bloco"));
                sala.add(salasProv);
                i++;
            }

            resultado.close();
            conexao.close();
        } catch (SQLException ex) {

            out.println("Erro de conexao com o banco: " + ex.getMessage());
        }

    }

    public List<SalaModel> getLampadasSala() {
        return sala;
    }
    
}
