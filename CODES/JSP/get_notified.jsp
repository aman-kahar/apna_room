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
   Connection conn11 = null;
   ResultSet rs11 = null;
   Statement stmt11 = null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
   stmt11 = conn11.createStatement();
   String id1 = (String)session.getAttribute("userid");
   //out.print(id1);
   rs11 = stmt11.executeQuery("select * from notification where room_owner_id =" + id1);

   String message_id = "";
   String owner_id = "";
   String customer_id = "";
   String notify = "";

   while (rs11.next()){
     message_id = rs11.getString("message_id");
      owner_id = rs11.getString("room_owner_id");
      customer_id = rs11.getString("customer_id");
      notify = rs11.getString("message");
   }

   out.print(notify);

   String message = "Request Approved.";
   
 %>

   <form action="inp_data_chat_box.jsp">
      <input type="hidden" name="message_id" value="<%=message_id%>" />
      <input type="hidden"name="room_owner_id" value="<%=owner_id%>" />
      <input type="hidden" name="customer_id" value="<%=customer_id%>" />
      <input type="hidden" name ="message" value="<%=message%>" />
      <button type="submit" name="approve">Approve Request</button> 
   </form>




 <script>
   let btnSend = document.querySelector('button');

    btnSend.addEventListener('click', () =>{
      btnSend.innerText = 'Approved';
    });
 </script> 

</body>
</html>