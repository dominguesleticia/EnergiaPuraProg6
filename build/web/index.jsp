<%-- 
    Document   : index
    Created on : 08/06/2016, 20:05:14
    Author     : Leticia
--%>




<%@page language="java" contentType="text/html" pageEncoding="UTF-8" import="com.lw.energiapura.SalaController" import="com.lw.energiapura.model.SalaModel" import="java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <style type="text/css">
            <%@ include file="../../css/bootstrap.css" %>
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <nav class="navbar navbar-default navbar-inverse">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="index.jsp">Energia Pura</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Sobre Nós</a></li>
                    </ul>
                    <form method="POST" class="navbar-form navbar-right" action="">
                        <div class="form-group">
                            <input type="text" name="email" class="form-control" placeholder="E-mail">
                        </div>
                        <div class="form-group">
                            <input type="password" name="senha" class="form-control" placeholder="Senha">
                        </div>
                        <button type="submit" value="Acessar" class="btn btn-default">Login</button>
                    </form>
                    
                    
                    
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="jumbotron">
            <h1><strong>Energia Pura - FAESP</strong></h1>
            <h1>Efetue o Login</h1>
        </div>

        <% 
			try {
					
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/energiapura", "root", "faesp");
					
					Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					
					String email = request.getParameter("email");
					String senha = request.getParameter("senha");

					if ((email != null) && (senha != null)) {					
						ResultSet rs = st.executeQuery("SELECT * FROM usuario WHERE email='"+email+"' AND senha = '"+senha+"';");

						if ( rs.next() ) {
							response.sendRedirect("index1.jsp");
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
