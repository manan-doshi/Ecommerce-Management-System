import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig

public class Admin_insert_categories extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Admin_insert_categories() {
        super();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text.html");
	PrintWriter out = response.getWriter();
	
	String category_id = request.getParameter("category_id");
	String name = request.getParameter("name");
	String count = request.getParameter("count");
	Part file=request.getPart("images");
	String images=file.getSubmittedFileName();
	String pathname="C:/Users/lenov/eclipse-workspace/Quickkart-Mini_Project/src/main/webapp/img/"+images;
	
	HttpSession session = request.getSession();
	RequestDispatcher dispatcher = null;
	
	try {
	FileOutputStream fos=new FileOutputStream(pathname);
	InputStream is=file.getInputStream();
	byte[] data=new byte[is.available()];
	is.read(data);
	fos.write(data);
	fos.close();
	System.out.println(pathname);
		
	} catch (Exception e) {
		out.println(e);
		
	}	
	try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
		PreparedStatement ps = con.prepareStatement("insert into PRODUCT_CATEGORIES values(?,?,?,?)");
		ps.setString(1, category_id);
		ps.setString(2, name);
		ps.setString(3, images);
		ps.setString(4, count);
		
		int i = ps.executeUpdate();
		dispatcher = request.getRequestDispatcher("admin_insert_categories.jsp");
		
		if(i>0) {
			session.setAttribute("status", "success");
			response.sendRedirect("admin_insert_categories.jsp");
		}
		else{
			session.setAttribute("status_fail", "status_fail");
		}
		
		ps.close();
		con.close(); 
		}
	catch(Exception e) {
		out.println(e);
	}
  }
}