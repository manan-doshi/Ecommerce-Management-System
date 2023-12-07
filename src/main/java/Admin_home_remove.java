import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Admin_home_remove extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Admin_home_remove() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String product_name = request.getParameter("product_name");

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
            String query = "DELETE FROM customer_order_confirm WHERE product_name = ?";
          
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1,product_name);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("admin_home.jsp"); // Redirect to your page after deletion
    }
}