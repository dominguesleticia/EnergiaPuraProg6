<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Login FAESP</title>
	</head>
	<body>
		<img src="imagens/logo.png">
		<form method="POST" action="">
			Nome <input type="text" name="nome" size="40">
			<br>
			Senha <input type="text" name="senha" size="3">
			<br>
			<input type="submit" value="Acessar">
		</form>
		<% 
			try {
					
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/AulaProg6", "postgres", "postgres");
					
					Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					
					String nome = request.getParameter("nome");
					String senha = request.getParameter("senha");

					if ((nome != null) && (nome != null)) {					
						ResultSet rs = st.executeQuery("SELECT * FROM LOGIN WHERE LOG_USUARIO = '" + nome + "' AND LOG_SENHA = '" + senha + "'"); 
						
						if ( rs.next() ) {
							response.sendRedirect("index_1.jsp");
						}
						else {
							out.println("Nome ou senha incorretos!");
						}
					}
				} catch(SQLException erroSQL) {
					out.println("Erro de conexao com o banco: " + erroSQL);
				}					
			%>
	</body>
</html>

