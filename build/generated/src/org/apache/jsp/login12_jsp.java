package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class login12_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			"", true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\r\n");
      out.write("<!doctype html>\r\n");
      out.write("<html>\r\n");
      out.write("\t<head>\r\n");
      out.write("\t\t<meta charset=\"utf-8\">\r\n");
      out.write("\t\t<title>Login FAESP</title>\r\n");
      out.write("\t</head>\r\n");
      out.write("\t<body>\r\n");
      out.write("\t\t<img src=\"imagens/logo.png\">\r\n");
      out.write("\t\t<form method=\"POST\" action=\"\">\r\n");
      out.write("\t\t\tNome <input type=\"text\" name=\"nome\" size=\"40\">\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\tSenha <input type=\"text\" name=\"senha\" size=\"3\">\r\n");
      out.write("\t\t\t<br>\r\n");
      out.write("\t\t\t<input type=\"submit\" value=\"Acessar\">\r\n");
      out.write("\t\t</form>\r\n");
      out.write("\t\t");
 
			try {
					
					Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/AulaProg6", "postgres", "postgres");
					
					Statement st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
					
					String nome = request.getParameter("nome");
					String senha = request.getParameter("senha");

					if ((nome != null) && (nome != null)) {					
						ResultSet rs = st.executeQuery("SELECT * FROM LOGIN WHERE LOG_USUARIO = '" + nome + "' AND LOG_SENHA = '" + senha + "'"); 
						
						if ( rs.next() ) {
							response.sendRedirect("principal.jsp");
						}
						else {
							out.println("Nome ou senha incorretos!");
						}
					}
				} catch(SQLException erroSQL) {
					out.println("Erro de conexao com o banco: " + erroSQL);
				}					
			
      out.write("\r\n");
      out.write("\t</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
