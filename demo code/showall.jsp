<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
	<%
	Connection conn=null;
	ResultSet rs=null;
	Statement stmt=null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","");
	stmt=conn.createStatement();
	rs=stmt.executeQuery("select * from employee");
  %>
  <%
 while(rs.next())
 {
%>
   <h2>EID : <%=rs.getString("eid")%></h2>
   <h2> NAME : <%=rs.getString("name")%></h2>
   <h2> NAME : <%=rs.getString("email")%></h2>
   <h2> NAME : <%=rs.getString("address")%></h2>
   <h2> NAME : <%=rs.getString("position")%></h2>
   <h2> NAME : <%=rs.getString("status")%></h2>

 <%
 }
 rs.close();
 stmt.close();
 conn.close();
 %>
