<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<html>
<head>
 <title>Notification</title>
</head>
<body>

<%
 try
 {
    String message_id = request.getParameter("message_id");
    String room_owner_id = request.getParameter("room_owner_id");
    String customer_id = request.getParameter("customer_id");
    
    String message = request.getParameter("message");

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");


    PreparedStatement pst = conn.prepareStatement("INSERT INTO `chat_box` (`chat_id`,`message_id`, `owner_user_id`,`customer_user_id`,  `message`) VALUES (default, ?, ?, ?, ?)");
    pst.setString(1,message_id);
    pst.setString(2,room_owner_id);
    pst.setString(3,customer_id);
    pst.setString(4,message);
    

    int status = pst.executeUpdate();


    if(status!=0)
    {
     response.sendRedirect("chat_box.jsp");
    }
    else
    {
      response.sendRedirect("checklogin.jsp");
    }


}
catch(Exception e)
{
      out.println("Exception :- "+e);
}
%>



</body>
</html>