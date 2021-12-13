

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DummyLoginServlet
 */
@WebServlet("/DummyLoginServlet")
public class DummyLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DummyLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String username = request.getParameter("username");
		String password = request.getParameter("passw");
		
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html><html><body>");
		out.print("Username:" + username + "<br>");
		out.print("Password:"+ password + "<br>");
		
		out.print("</body></html>");
		
		try {
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_gryffindor","root","");
            Statement st = conn.createStatement();
           
            ResultSet sql = st.executeQuery("SELECT * FROM admin WHERE aName = '" + username + "' AND passw = '" + password + "'");
            if(sql.next()) {
            	response.sendRedirect("product.jsp");
                out.println("Data is Successfully Inserted into Student Table");
            }
            
            out.println("Wrong username/password");
        }
		
		catch (ClassNotFoundException e) {
			e.printStackTrace();
        } 
		
		catch (SQLException e) {
            e.printStackTrace();
        }
	}

}
