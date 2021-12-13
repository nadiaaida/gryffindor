<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/db_gryffindor";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String pID = request.getParameter("pID");
String pName=request.getParameter("pName");
String pDesc=request.getParameter("pDesc");
String price=request.getParameter("price");
String pQty=request.getParameter("pQty");
if(pID != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(pID);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update product set pName=?,pDesc=?,price=?,pQty=? where pID="+pID;
ps = con.prepareStatement(sql);
ps.setString(1,pID);
ps.setString(2, pName);
ps.setString(3, pDesc);
ps.setString(4, price);
ps.setString(5, pQty);
int i = ps.executeUpdate();
if(i > 0)
{
	response.sendRedirect("product.jsp");
}
else
{
out.print("There is a problem in updating Record.");
}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%>