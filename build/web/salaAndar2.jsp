<%-- 
    Document   : index
    Created on : 15/05/2016, 23:47:55
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
                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="E-mail">
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Senha">
                        </div>
                        <button type="submit" class="btn btn-default">Login</button>
                    </form>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>

        <div class="jumbotron">
            <h1>Energia Pura - FAESP</h1>
            <p>SELECIONE A SALA</p>
            <table>
                <tr>
                    <%
                        SalaController buscarLampadas = new SalaController();
                        buscarLampadas.buscaLampadasSala(2);
                        int salaTemp = 0;
                        for(SalaModel lamp : buscarLampadas.getLampadasSala()){
                            if(lamp.getNumSala() != salaTemp){
                                switch (lamp.getNumSala()) {
                                    case 11:
                                        out.println("<td><a class='btn btn-primary btn-lg' href='#' role='button'>Banheiro</a></td>");
                                        break;
                                    case 10:
                                        out.println("<td><a class='btn btn-primary btn-lg' href='#' role='button'>Corredores</a></td>");
                                        break;
                                    default:
                                         out.println("<td><a class='btn btn-primary btn-lg' href='#' role='button'>"+lamp.getNumSala()+"</a></td>");
                                 }
                                salaTemp = lamp.getNumSala();
                            }
                        }
                    %>
                </tr>
            </table>
        </div>

    </body>
</html>
