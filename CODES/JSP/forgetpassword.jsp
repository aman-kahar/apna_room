
<%@ page import="java.io.*" %>
<%@ page import ="java.util.*"%>
<%@ page import="java.sql.*"%>

<html>
<head>
       <meta charset="UTF-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <title>Forget Password</title>

<body>




<%
    Class.forName("com.mysql.jdbc.Driver").newInstance();	
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");

    String user_email = request.getParameter("email");
    String user_mobile = request.getParameter("mobile");
      
    Statement st = conn.createStatement();
    String query = "SELECT * FROM `sign_up_page` where u_email = '"+ user_email +"' and mobile = '"+ user_mobile+"'";
   
    ResultSet rs = st.executeQuery(query);
    int flag=0;

     while(rs.next())
     {
       if(rs.getString("u_email").equals(user_email) && (rs.getString("mobile").equals(user_mobile) || rs.getString("oth_mobile").equals(user_mobile)))
       {
         flag=1;
         break;
       }
     }
     
     if(flag==1)
     {
         String userids = rs.getString("user_id"); 
         session.setAttribute("username", user_email);
         session.setAttribute("userid",userids);
         response.sendRedirect("enterotp.jsp");

     }
     else if(flag == 0)
     {
         session.setAttribute("Email/Mobile Does Not Exists","right");
         response.sendRedirect("forgetpasswordEmail.jsp");      
      }
     %>
     
      <%
      rs.close();
      conn.close();
      %>  







</body>
</html>


