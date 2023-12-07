import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public ForgotPassword() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
			PreparedStatement ps = con.prepareStatement("update quickkart_user_login set password=? where email=?");
			ps.setString(1, password);
			ps.setString(2, email);
			
			int i = ps.executeUpdate();
			if(i>0){
				//request.setAttribute("status","success");
				//dispatcher = request.getRequestDispatcher("forgot_password.jsp");
				
				
				session.setAttribute("forgot_pass", "forgot_pass");
				response.sendRedirect("forgot_password.jsp");
			}
			else {
				//request.setAttribute("status","failed");
				//dispatcher= request.getRequestDispatcher("forgot_password.jsp");
				
				
				session.setAttribute("forgot_fail", "forgot_fail");
				response.sendRedirect("forgot_password.jsp");
			}
			dispatcher.forward(request, response);
			con.close();
		}
		catch(Exception a) {
			a.printStackTrace();
		}
	}
}