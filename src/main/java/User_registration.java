import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class User_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public User_registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 	String useraname = request.getParameter("username");
	        String email = request.getParameter("email");
	        String contact_number = request.getParameter("contact_number");
	        String password = request.getParameter("password");
	        
	        Connection connection = null;
	        PreparedStatement ps = null;
	        
	        try {

			Class.forName("oracle.jdbc.driver.OracleDriver"); 	 
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","MANAN","2003"); 


	            // Create a SQL INSERT statement
	            String sql = "INSERT INTO quickkart_user_login (username, email, contact_number, password) VALUES (?, ?, ?, ?)";
	            
	            ps = connection.prepareStatement(sql);
	            ps.setString(1, useraname);
	            ps.setString(2, email);
	            ps.setString(3, contact_number);
	            ps.setString(4, password);

	        
	            // Execute the INSERT statement
	            int rowsAffected = ps.executeUpdate();

	            if (rowsAffected > 0) {
	                response.sendRedirect("student_list.jsp"); // Redirect back to the display page
	            } else {
	                // Handle the case where the insert operation failed
	                // You can redirect or display an error message as needed
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (ps != null) {
	                    ps.close();
	                }
	                if (connection != null) {
	                    connection.close();
	                }
	            } catch (Exception i) {
	                i.printStackTrace();
	            }
	        }
	    }
	}