import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Login() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 	 
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","MANAN","2003");  
			PreparedStatement ps = con.prepareStatement("select * from quickkart_user_login where email = ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {
				//HttpSession session = request.getSession();
				//session.setAttribute("uemail", email);
				//response.sendRedirect("welcome.jsp");
							
				session.setAttribute("uemail", email);
				response.sendRedirect("index.jsp");
			}
			else {
				//request.setAttribute("status","failed");
				//dispatcher= request.getRequestDispatcher("index.jsp");
				
				session.setAttribute("login_fail", "login_fail");
				response.sendRedirect("login.jsp");
			}
			dispatcher.forward(request, response);
			con.close();
		}
		catch(Exception a) {
			a.printStackTrace();
		}
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 	 
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","MANAN","2003");  
			PreparedStatement ps = con.prepareStatement("select * from quickkart_user_login where email = ? and password = ?");
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet rst = ps.executeQuery();
			
			if(rst.next()) {
				String name = rst.getString(1);
				session.setAttribute("uname", name);
			}
		}
		catch(Exception a) {
			a.printStackTrace();
		}	
	}
}