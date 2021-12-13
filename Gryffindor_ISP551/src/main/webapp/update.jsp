<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pID = request.getParameter("pID");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "db_gryffindor";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product where pID="+pID;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<!DOCTYPE html>
<html>

<style>
body {
	background-image: url('images/background.jpg');
	background-size: cover;
	color: white;
}

.centered {
	position: fixed;
	top: 50%;
	left: 50%;
	/* bring your own prefixes */
	transform: translate(-50%, -50%);
}

.frame {
	width: 710px;
	height: 397px;
	overflow: visible;
	background-image: url(images/image1.jpeg );
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	border-radius: 25px;
}
</style>
<body>
	<div class="centered">
		<iframe class="frame"></iframe>
	</div>
	<div class="centered">

		<h1>Update Product</h1>
		<form class="myForm" action="update-process.jsp" method="Post">
			<input type="hidden" name="pID"
				value="<%=resultSet.getString("pID") %>"> <br>

			<div id="left" class="width-6 container-padding">
				<p>
					<label>Product Name <input type="text" name="pName"
						value="<%=resultSet.getString("pName") %>">
					</label>
				</p>
				<p>
					<label>Product Description <input type="text" name="pDesc"
						value="<%=resultSet.getString("pDesc") %>">
					</label>
				</p>
				<p>
					<label>Price: RM <input type="number" name="price"
						value="<%=resultSet.getString("price") %>">
					</label>
				</p>
				<p>
					<label>Quantity <input type="number" name="pQty"
						value="<%=resultSet.getString("pQty") %>">
					</label>
				</p>
				<center>
					<button onCLick="myFunction()">Back</button>
					<input type="submit" value="Submit">
				</center>
			</div>
		</form>
		<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
	
</body>
</html>