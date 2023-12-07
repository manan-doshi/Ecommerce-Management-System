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

public class Contact_us extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Contact_us() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String contact_number = request.getParameter("contact_number");
		String email = request.getParameter("email");
		String message = request.getParameter("message");
		
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","MANAN","2003");
			
			PreparedStatement ps = con.prepareStatement("insert into contact_us values(?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, contact_number);
			ps.setString(3, email);
			ps.setString(4, message);
			
			int i = ps.executeUpdate();
			dispatcher = request.getRequestDispatcher("Contact_us.jsp");
			
			if(i > 0) {
				session.setAttribute("status", "success");
				response.sendRedirect("contact_us.jsp");
			}
			else {
				session.setAttribute("status_fail","status_fail");
			}
			
			con.close();
			
			
		}
		catch(Exception a) {
			a.printStackTrace();
		}
		
		
	}
}