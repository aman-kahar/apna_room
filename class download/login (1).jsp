<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>


	</head>
	<body>
		<h2>USER LOGIN</h2>
		<fieldset>
			<legend><b>Login:</b></legend>
			<form action="validation.jsp" method="post">
			<table>
				<tr><td>USER NAME</td><td><input type="text" name="username"></td></tr>
				<tr><td>PASS WORD</td><td><input type="password" name="password"></td></tr>
				<tr><td></td><td><button type="submit">Login</button></td></tr>
			</table>
			</form>
		</fieldset>
	</body>
</html>
