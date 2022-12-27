<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>

<html>
<head>
 <title>ApnaRoom Chat</title>

</head>
<body>

 <%
   Connection conn11 = null;
   ResultSet rs11 = null;
   Statement stmt11 = null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
   stmt11 = conn11.createStatement();
   String id1 = (String)session.getAttribute("userid");
   rs11 = stmt11.executeQuery("select * from chat_box where owner_user_id =" + id1);

   String chat_id ="";
   String message ="";

   while (rs11.next()){
      chat_id = rs11.getString("chat_id");
      message = rs11.getString("message");
   }
   
 %>

<textarea name=""><%=message%></textarea>

<form method="post" action="inp_data_chat_box2.jsp">
  <input type="hidden" name="chat_id" value="<%=chat_id%>" />
  <input type="hidden" name="msg" value="<%=message%>" />
  <input type="text" name="msg2">
  <input type="submit" value="Send" />
</form>

</body>
</html>