import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class About_survey extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public About_survey() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
    	Long mobile_number = Long.parseLong(request.getParameter("mobile_number"));
		String categories = request.getParameter("categories");
		String future_categories = request.getParameter("future_categories");
		String technical_issue = request.getParameter("technical_issue");
		String experience = request.getParameter("experience");
		String suggestion = request.getParameter("suggestion");
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","MANAN","2003");
			PreparedStatement ps = con.prepareStatement("insert into customer_survey values (?,?,?,?,?,?,?)");
			ps.setString(1, email);
			ps.setLong(2, mobile_number);
			ps.setString(3, categories);
			ps.setString(4, future_categories);
			ps.setString(5, technical_issue);
			ps.setString(6, experience);
			ps.setString(7, suggestion);
			
			int i = ps.executeUpdate();
			
			if(i > 0) {
				response.sendRedirect("about_us.jsp");
			}
		}
		catch(Exception a) {
			a.printStackTrace();
		}
	}
}