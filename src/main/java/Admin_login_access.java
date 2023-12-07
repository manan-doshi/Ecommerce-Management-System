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

public class Admin_login_access extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Admin_login_access() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); 	 
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","MANAN","2003");  
			PreparedStatement ps = con.prepareStatement("select * from admin_credential where username = ? and email = ? and password = ?");
			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, password);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) {						
				session.setAttribute("uemail_admin", "email");
				response.sendRedirect("admin_home.jsp");
			}
			else {				
				session.setAttribute("login_fail_admin", "login_fail");
				response.sendRedirect("admin_login.jsp");
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
			PreparedStatement ps = con.prepareStatement("select * from admin_credential where username=?");
			ps.setString(1, username);
			
			ResultSet rst = ps.executeQuery();
			
			if(rst.next()) {
				String name = rst.getString(1);
				session.setAttribute("u_name", name);
			}
		}
		catch(Exception a) {
			a.printStackTrace();
		}
	}
}