<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
       <meta charset="UTF-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="../CSS/forgetpasswordEmail.css" />
       <title>Forget Password Email</title>
</head>

<body>

 <%

   String value = (String)session.getAttribute("Email/Mobile Does Not Exists");
   if(value != null && value.equals("right")){
       %>
         <script>
            alert("Email/Mobile Does Not Exists\nTRY AGAIN...");
            <%
              session.invalidate();
            %>
         </script>
       <%  
         }
    %>


<div class="design">
<form method="post" action="forgetpassword.jsp">
      <div>
        <label for="em">Enter Your Regested Email :</label><br> 
        <input type="email" id="email" name="email" required>
      </div><br>
      <div>
        <label for="em">Enter Your Regested Mobile Number :</label><br> 
        <input type="text" id="mobile" name="mobile" required>
      </div><br>
      <input type="submit" id="submit" name="submit" value="Submit">
    </div>
</form>

</body>

</html>