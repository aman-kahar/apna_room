

<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
	<%
	Connection conn=null;
	ResultSet rs=null;
	Statement stmt=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt=conn.createStatement();
	rs=stmt.executeQuery("select * from sign_up_page ");
  %>
  <%
 while(rs.next())
 {
%>
  <div>
      <h2> USER photo  :</h2>
  </div>
   <%-- <h2> USER ID : <%=rs.getString("user_id")%></h2> --%>
   <h2> USER NAME : <%=rs.getString("u_name")%></h2>
   <h2> USER EMAIL : <%=rs.getString("u_email")%></h2>
   <%-- <h2> DOB : <%=rs.getString("dob")%></h2> --%>
   <h2> AGE : <%=rs.getString("age")%></h2>
  <h2> MOBLIE: <%=rs.getString("mobile")%></h2>
   <h2> gender : <%=rs.getString("gender")%></h2>
  <div><img src="<%=rs.getString("u_photos")%>" width="200"> </div>

 <%
 }
 rs.close();
 stmt.close();
 conn.close();
 %>
