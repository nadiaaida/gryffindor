<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<style>
body {
	background-image: url('images/background.jpg');
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
	background-image: url(images/image1.jpeg );
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
	border-radius: 25px;
}

.memberLogin {
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
	padding: 8px 32px;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 8px;
}

.button1 {
	width: 40%;
}
</style>
<body>
	<div class="centered">
		<iframe class="frame"></iframe>
	</div>
	<div class="centered">
		<form action="LoginSServlet" method="post">
			<h3 class="memberLogin">
				<center>SELLER LOGIN</center>
			</h3>

			<div data-validate="Valid email is required: ex@abc.xyz">
				<center>
					<i class="material-icons" style="font-size: 25px">email</i> <input
						style="width: 80%; font-size: 16px;" type="email" name="email"
						placeholder="Email">
				</center>
			</div>
			<br>

			<div data-validate="Password is required">
				<center>
					<i class="material-icons" style="font-size: 25px">lock</i> <input
						style="width: 80%; font-size: 16px;" type="password"
						name="password" placeholder="Password">
				</center>
			</div>
			<br>

			<div>
				<center>
					<button class="button button1">Login</button>
				</center>
			</div>
			<br>

			<div>
				<center>
					<a class="txt2" href="#"> Sign up now </a>
				</center>
			</div>

		</form>

	</div>
</body>
</html>