<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
  <head>
       <meta charset="UTF-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <title>CHECK OTP</title>
  </head>
  <body>
   <%
    String user_otp = request.getParameter("otp");
    String generated_otp = request.getParameter("generated_otp");


    if(user_otp != null && generated_otp!=null){
        if(user_otp.equals(generated_otp)){
            response.sendRedirect("newpassword.jsp");
        }
        else{
          session.setAttribute("OTP Does Not Matched","wrong");
          response.sendRedirect("enterotp.jsp");
    }
    }
    
   %>
  </body>

</html>