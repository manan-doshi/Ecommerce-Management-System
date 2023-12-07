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

public class Admin_add_products extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Admin_add_products() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text.html");
		PrintWriter out = response.getWriter();
		
		int id = Integer.parseInt(request.getParameter("id"));
		int price= Integer.parseInt(request.getParameter("price"));
		String name = request.getParameter("name");
		String categories = request.getParameter("categories");
		int discount = Integer.parseInt(request.getParameter("discount"));
		Part file=request.getPart("images");
		String images=file.getSubmittedFileName();
		String pathname="C:/Users/lenov/eclipse-workspace/Quickkart-Mini_Project/src/main/webapp/products_img/"+images;
		String description = request.getParameter("desc");
		

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
			FileOutputStream fos=new FileOutputStream(pathname);
			InputStream is=file.getInputStream();
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
					
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "MANAN", "2003");
			PreparedStatement ps = con.prepareStatement("insert into admin_add_products values(?,?,?,?,?,?,?)");
			ps.setInt(1,id);
			ps.setString(2, name);
			ps.setInt(3, price );
			ps.setInt(4, discount);
			ps.setString(5, images);
			ps.setString(6, categories);
			ps.setString(7, description);
			
			HttpSession session = request.getSession();
			RequestDispatcher dispatcher = null;
				
			int i = ps.executeUpdate();
			dispatcher = request.getRequestDispatcher("admin_add_product.jsp");
			
			if(i>0) {
				session.setAttribute("status", "success");
				response.sendRedirect("admin_add_product.jsp");
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