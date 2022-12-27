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
    String room_owner_id = request.getParameter("room_owner_id");
    String customer_id = request.getParameter("customer_id");
    
    String customer_name = request.getParameter("customer_name");
    String customer_contact = request.getParameter("customer_contact");
    String customer_email = request.getParameter("customer_email_id");
    
    String message = customer_name + "\n" + "Wants to take a Visit at your room." + "\n" + "For More Details Please Contact at " + "\n" + customer_contact + " Email-ID -> " + customer_email;

    Class.forName("com.mysql.jdbc.Driver").newInstance();
    
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");


    PreparedStatement pst = conn.prepareStatement("INSERT INTO `notification` (`message_id`, `room_owner_id`,`customer_id`,  `message`) VALUES (default, ?, ?, ?)");
    pst.setString(1,room_owner_id);
    pst.setString(2,customer_id);
    pst.setString(3,message);
    

    int status = pst.executeUpdate();


    if(status!=0)
    {
       <script>
           alert("Notification Sent Sucessfully Owner will Soon Contact You.");
       </script>
       response.sendRedirect("room_details.jsp");
    }
    else
    {
      response.sendRedirect("room_details.jsp");
    }


  }
  catch(Exception e)
   {
      out.println("Exception :- "+e);
   }
%>


</body>
</html>