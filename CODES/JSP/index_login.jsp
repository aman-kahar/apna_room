<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
  <head>
    <title>LOGIN_PAGE</title>
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />

    <link
      href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../CSS/login_page2.css" />
  </head>

  <body>
    <div class="background-image">
      <form action="verify_login.jsp" method="post" class="box">
        <h1 class="heading">LOGIN</h1>
        <input type="text" name="username" placeholder="username" required="required" />
        <input type="password" name="userpassword" placeholder="password" required="required" />
        <a href="forgetpasswordEmail.jsp" target="_blank">Forget Password</a>
        <input type="submit" value="LOGIN" />
      <p class="sign-up-not">Don't have an account <a href="../HTML/sign_up_page1.html">Sign Up</a></p>
      </form>
    </div>


  </body>
</html>
