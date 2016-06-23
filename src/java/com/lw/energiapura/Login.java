/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.lw.energiapura;

import com.lw.energiapura.model.SalaModel;
import com.lw.energiapura.model.Users;
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
public class Login {
    Statement comando;
    Connection conexao;
    Users usuario;
    
    public boolean login(String email, String senha) throws ClassNotFoundException{
        
        comparaUsuario(email, senha);
        
        Users usuarioVerificar = getUsuario();
        
        if(usuarioVerificar!=null){
            return true;
        }else{
            return false;
        }
    }
    
    public void comparaUsuario(String email, String senha) throws ClassNotFoundException {

        String sql = "SELECT * FROM usuario WHERE email='"+email+"' AND senha = '"+senha+"';";

        String driverName = "com.mysql.jdbc.Driver";
        Class.forName(driverName);

        // Abre a Conexão		
        String url = "jdbc:mysql://localhost:3306/energiapura";
        String user = "root";
        String password = "faesp";

        try {
            conexao = DriverManager.getConnection(url, user, password);

            ResultSet resultado;

            comando = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

            resultado = comando.executeQuery(sql);

            while (resultado.next()) {

                usuario = new Users(resultado.getString("nome"),
                            resultado.getString("email"),
                            resultado.getString("senha"));
            }

            resultado.close();
            conexao.close();
        } catch (SQLException ex) {

            out.println("Erro de conexao com o banco: " + ex.getMessage());
        }

    }

    public Users getUsuario() {
        return usuario;
    }
}
