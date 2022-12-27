<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" import="java.sql.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.util.*" %>
<html>

  <head>
    <title>Verify Password</title>
    <link rel="shortcut icon" href="./logo.jpeg" type="image/x-icon">
   </head>

	<body>

		<%
		String adminemail=request.getParameter("email");
		String adminpassword=request.getParameter("password");

    Connection conn=null;
  	ResultSet rs=null;
  	Statement stmt=null;
  	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn=
  DriverManager.getConnection("jdbc:mysql://localhost:3309/sportsholic","root","");
  	stmt=conn.createStatement();
    String query = "SELECT  email,password FROM `login_page` WHERE `email` = '"+adminemail+"' AND `password` = '"+adminpassword+"' ";
    out.println(query);

    rs=stmt.executeQuery(query);

    if(rs.next()) 
    {
     // session.setAttribute("email",adminemail); 
     // session.setAttribute("password",adminpassword);
    	response.sendRedirect("adminpanel.jsp");

    } 
    else
    {
         // out.println(query);
          session.setAttribute("Invalid_Login","true"); 
          //session.setAttribute("QUWRY",query); 
      	 response.sendRedirect("addlogin.jsp");
    }
    %>

    <%
    rs.close();
    conn.close();
    %>
 </body>
</html>