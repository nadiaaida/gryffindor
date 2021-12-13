<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!-- SERVLET FOR RETRIEVE PRODUCT -->
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("pID");
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
<!-- END SERVLET FOR RETRIEVE PRODUCT -->

<!DOCTYPE html>
<head>
<title>Main product</title>
</head>
<style>
body {
	background-image: url('images/backgroundISP.jpg');
	width: 100%;
}

h1 {
	text-align: center;
	text-size-adjust: bold;
	font-size: 64;
	font-family: sans-serif;
	color: #420B89;
	position: static;
	width: 318;
	height: 77;
}

div.option {
	color: #420B89;
}

#radios {
	position: relative;
	z-index: 10;
	font-size: 40;
	font-family: sans-serif;
	color: #420B89;
}

#bckgrnd, .labels {
	width: 255px;
	height: 45px;
	text-align: center;
	display: inline-block;
	padding-top: 25px;
	z-index: 2;
	cursor: pointer;
	outline: 1px solid #420B89;
}

#bckgrnd {
	background-color: #9150e7b2;
	position: absolute;
	left: 0;
	top: 0;
	z-index: -5;
}

#rad1:checked ~ #bckgrnd {
	transform: translateX(294px);
	transition: transform 0.5s ease-in-out;
}

#rad2:checked ~ #bckgrnd {
	transform: translateX(553px);
	transition: transform 0.5s ease-in-out;
}

#rad3:checked ~ #bckgrnd {
	transform: translateX(812px);
	transition: transform 0.5s ease-in-out;
}

.hide {
	display: none;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

.row {
	display: block;
}

.width-6 {
	display: inline-block;
	position: relative;
	width: 30%;
	float: left;
}

.container-padding {
	padding: 1em 10%;
}

.myForm {
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	font-size: 0.8em;
	width: 100em;
	padding: 1em;
	border: none;
}

.myForm fieldset {
	border: none;
	width: 100%;
	padding: 0;
}

.myForm legend, .myForm label {
	padding: 0;
	font-weight: bold;
}

.myForm label.choice {
	font-size: 0.9em;
	font-weight: normal;
}

.myForm label {
	text-align: left;
	display: block;
}

.myForm label_child {
	text-align: right;
	display: block;
}

.myForm input[type="text"], .myForm input[type="number"], .myForm select,
	.myForm textarea {
	float: right;
	width: 60%;
	border: 1px solid #ccc;
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	font-size: 0.9em;
	padding: 0.3em;
}

.myForm input[type="file"] {
	float: right;
	width: 60%;
	font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
	padding: 0.3em;
}

.myForm input[type="checkbox"] {
	margin-left: 40%;
}

.myForm button {
	padding: 1em;
	border-radius: 0.5em;
	background: #eee;
	border: none;
	font-weight: bold;
	margin-left: 90%;
	margin-top: 1.8em;
}

.myForm button:hover {
	background: #ccc;
	cursor: pointer;
}
</style>
<body>

	<h1>PRODUCT</h1>
	<div id="radios" align="center" class="header">
		<b> <input style="display: none" id="rad1" type="radio"
			name="radioBtn" onclick="changeContent1();" value="1" checked>
			<label class="labels" for="rad1">ADD</label> <input
			style="display: none" id="rad2" type="radio" name="radioBtn"
			onclick="changeContent2();" value="2"> <label class="labels"
			for="rad2">LIST</label> <input style="display: none" id="rad3"
			type="radio" name="radioBtn" onclick="changeContent3();" value="3">
			<label class="labels" for="rad3">ARCHIVE/DELETE</label>

			<div id="bckgrnd"></div></b>

		<!-- --FIRST SECTION-- -->

		<div id="show1" class="hide">
			<form class="myForm" action="AddProductServlet" method="Post">

				<div class="row">
					<div id="left" class="width-6 container-padding">
						<p>
							<label>Category <select name="cName" id="cName" required>
									<option value="none" selected disabled>Select a
										category</option>
									<option value="Women's clothes">Women's clothes</option>
									<option value="Book">Book</option>
									<option value="Food">Food</option>
							</select>
							</label>
						</p>

						<p>
							<label>Product Name <input type="text" name="pName"
								placeholder="Insert product name" required>
							</label>
						</p>
						<p>
							<label>Product Details <textarea name="pDesc" id=""
									cols="5" rows="3" placeholder="Insert description" required></textarea>
							</label>
						</p>
						<br>
						<br>

					</div>

					<div class="width-6 container-padding">

						<p>
							<label>Image <input type="file" id="myFile" name="pPics">
							</label>
						</p>

						<p>
							<label>Price: RM <input type="number" name="price" id=""
								required>
							</label>
						</p>

						<p>
							<label>Quantity <input type="number" name="pQty" id=""
								required>
							</label>
						</p>
					</div>

					<input type="submit" value="Submit"> <input type="reset"
						value="Reset">
			</form>
		</div>
	</div>
	<!-- --SECOND SECTION-- -->

	<div id="show2" class="hide">
		<br> <br>
		<table style="width: 100%">
			<tr>
				<th>No.</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Edit</th>
			</tr>
			<%
					try{
					connection = DriverManager.getConnection(connectionUrl+database, userid, password);
					statement=connection.createStatement();
					String sql ="select * from product";
					resultSet = statement.executeQuery(sql);
					while(resultSet.next()){
					%>
			<tr>
				<td><%=resultSet.getString("pID") %></td>
				<td><a
					href="readProduct.jsp?pID=<%=resultSet.getString("pID")%>"><%=resultSet.getString("pName") %></td>
				<td><%=resultSet.getString("price") %></td>
				<td><%=resultSet.getString("pQty") %></td>
				<td><a href="update.jsp?pID=<%=resultSet.getString("pID") %>"><button
							type="button" class="edit">Edit</button></a></td>
			</tr>
			<%
					}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
					%>

		</table>
	</div>

	<!-- --THIRD SECTION-- -->

	<div id="show3" class="hide">
		<br> <br>
		<table style="width: 100%">
			<tr>
				<th>No.</th>
				<th>Product Name</th>
				<th>Price</th>
				<th>Quantity</th>
				<th>Delete</th>
			</tr>

			<%
					try{
						connection = DriverManager.getConnection(connectionUrl+database, userid, password);
						statement=connection.createStatement();
						String sql ="select * from product";
						resultSet = statement.executeQuery(sql);
						while(resultSet.next()){
				%>
			<tr>
				<td><%=resultSet.getString("pID") %></td>
				<td><%=resultSet.getString("pName") %></td>
				<td><%=resultSet.getString("price") %></td>
				<td><%=resultSet.getString("pQty") %></td>
				<td><a
					href="deleteProduct.jsp?id=<%=resultSet.getString("pID") %>"><button
							type="button" class="delete"
							onclick="return confirm('Are you sure you want to delete this item?');">Delete</button></a></td>
			</tr>
			<%
					}
					connection.close();
					} catch (Exception e) {
					e.printStackTrace();
					}
				%>

		</table>
	</div>
	</div>
	<script>
        $(document).ready(function(){
            $('#radios').append('<div id="bckgrnd"></div>');
        });

        //1) functions for removing unnecessary elements for add/list/archive products
        function changeContent1() {
            document.getElementById("show1").classList.remove("hide");
            document.getElementById("show2").classList.add("hide");
            document.getElementById("show3").classList.add("hide");
        }

        function changeContent2() {
            document.getElementById("show1").classList.add("hide");
            document.getElementById("show2").classList.remove("hide");
            document.getElementById("show3").classList.add("hide");
        }
        function changeContent3() {
            document.getElementById("show2").classList.add("hide");
            document.getElementById("show3").classList.remove("hide");
            document.getElementById("show1").classList.add("hide");
        }
        //end 1)
    </script>

</body>