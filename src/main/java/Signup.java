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

public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public Signup() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String contact_number = request.getParameter("contact_number");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
			PreparedStatement pst = con.prepareStatement("SELECT * FROM quickkart_user_login WHERE email = ?");
			PreparedStatement pt = con.prepareStatement("SELECT * FROM quickkart_user_login WHERE contact_number = ?");
            pst.setString(1, email);
            pt.setString(1, contact_number);
            ResultSet resultSet1 = pst.executeQuery();	
            ResultSet resultSet2 = pt.executeQuery();

            if (resultSet1.next()) {
            	request.setAttribute("error", "<i4 class=\"fa-solid fa-circle-exclamation\" style=\"color: #eb0505;\"></i4> The Email is already registered.");
            	RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
            	rd.forward(request, response);
            }
            if(resultSet2.next()){
            	request.setAttribute("error_number", "<i4 class=\"fa-solid fa-circle-exclamation\" style=\"color: #eb0505;\"></i4> The Number is already registered.");
            	RequestDispatcher rd=request.getRequestDispatcher("signup.jsp");
            	rd.forward(request, response);
            }
            else {
			PreparedStatement ps = con.prepareStatement("insert into quickkart_user_login values(?,?,?,?)");

			ps.setString(1, username);
			ps.setString(2, email);
			ps.setString(3, contact_number);
			ps.setString(4, password);
			
			int rowcount= ps.executeUpdate();
			dispatcher = request.getRequestDispatcher("signup.jsp");
			
			if(rowcount > 0) {
				session.setAttribute("status", "success");
				response.sendRedirect("signup.jsp");
			}
			else {
				session.setAttribute("status_fail",	 "status_fail");
			}
			dispatcher.forward(request, response);
			con.close();			
		}
	}
		catch(Exception a) {
			a.printStackTrace();
		}
	}
}