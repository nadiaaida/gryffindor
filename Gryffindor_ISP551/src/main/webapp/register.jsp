<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<style>
body {
	background-image: url('background.jpg');
	background-size: cover;
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
	background-image: url( image1.jpeg );
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	border-radius: 25px;
}

.register {
	width: auto; /* 167px */
	height: auto; /* 43px */
	overflow: visible;
	white-space: pre;
	font-family: "Inter", sans-serif;
	color: #ffffff;
	font-size: 36px;
	letter-spacing: 0px;
	line-height: 1.2;
}

.button {
	background-color: #EA29FF;
	text-align: center;
	border: none;
	color: white;
	padding: 2px 32px;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 8px;
}
</style>
<body>
	<div class="centered">
		<iframe class="frame"></iframe>
	</div>
	<div class="centered">
		<form action="RegisterServlet" method="post"
			onsubmit="return validate()">
			<div>
				<h3 class="register">REGISTRATION</h3>
			</div>
			<div>
				<i class="material-icons" style="font-size: 25px">person</i> <input
					style="width: 80%; font-size: 16px;" type="text" name="username"
					placeholder="Username">
			</div>
			<br>
			<div>
				<i class="material-icons" style="font-size: 25px">email</i> <input
					style="width: 80%; font-size: 16px;" type="text" name="email"
					placeholder="Email">
			</div>
			<br>
			<div>
				<i class="material-icons" style="font-size: 25px">lock_outline</i> <input
					style="width: 80%; font-size: 16px;" class="input100"
					type="password" name="password" placeholder="Password">
			</div>
			<br>
			<div>
				<i class="material-icons" style="font-size: 25px">lock_open</i> <input
					style="width: 80%; font-size: 16px;" class="input100"
					type="password" name="Cpassword" placeholder="Confirm Password">
			</div>
			<br>
			<%=(request.getAttribute("errMessage") == null) ? ""
         : request.getAttribute("errMessage")%>
			<br>
			<div>
				<center>
					<button class="button">Submit</button>
				</center>
			</div>
			<br>


		</form>
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
        
        
         
	function validate()
	{ 
		var username = document.form.username.value; 
     	var email = document.form.email.value; 
     	var password = document.form.password.value;
     	var Cpassword= document.form.conpassword.value;
     
     	if (username==null || username=="")
     	{ 
     	alert("Username can't be blank"); 
     	return false; 
     	}
     	else if (email==null || email=="")
     	{ 
     	alert("Email can't be blank"); 
     	return false; 
     	}
     	else if(password.length<6)
     	{ 
     	alert("Password must be at least 6 characters long."); 
     	return false; 
     	} 
     	else if (password!=Cpassword)
     	{ 
     	alert("Confirm Password should match with the Password"); 
     	return false; 
     	} 
 	} 
    </script>
</body>
</html>