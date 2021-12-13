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




<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Product</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

</head>

<script>
function validateForm() {
  let x = document.forms["myForm"]["fname"].value;
  if (x == "") {
    alert("Error");
    return false;
  }
}
</script>

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

		<%
	try{
	connection = DriverManager.getConnection(connectionUrl+database, userid, password);
	statement=connection.createStatement();
	String sql ="select * from product where pID=" + pID;
	resultSet = statement.executeQuery(sql);
	while(resultSet.next()){
	%>

		<h1><%=resultSet.getString("pName") %></h1>

		<p>
			Description:<%=resultSet.getString("pDesc") %></p>
		<p>
			Price: RM<%=resultSet.getString("price") %></p>
		<p>
			Quantity:
			<%=resultSet.getString("pQty") %></p>

		<%
	}
	connection.close();
	} catch (Exception e) {
	e.printStackTrace();
	}
	%>

		<button onCLick="myFunction()">Back</button>
	</div>
	<script>
		function myFunction(){
			window.location="product.jsp?id=show2";
		}
	</script>


</body>
</html>