<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<html>
<head>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver").newInstance();	
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");

    String user_email = request.getParameter("username");
    String password = request.getParameter("userpassword");
      
    Statement st = conn.createStatement();
    String query = "select * from sign_up_page";
   
    ResultSet rs = st.executeQuery(query);
    int flag=0;
    
while(rs.next())
{
  if(rs.getString("u_email").equals(user_email) && rs.getString("pssword").equals(password))
  {
    flag=1;
    break;
  }
}

if(flag==1)
{
  String userids=rs.getString("user_id"); 
  session.setAttribute("username", user_email);
  session.setAttribute("userid",userids);
  response.sendRedirect("home_page2.jsp");
}
else
{
    response.sendRedirect("login1.jsp");      
 }
%>

 <%
 rs.close();
 conn.close();
 %>       
</body>
 </html>