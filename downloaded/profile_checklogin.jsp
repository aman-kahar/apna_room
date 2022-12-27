<html>
<%
String username =(String)session.getAttribute("username");
if(username!=null)
{

 out.println("LOGGED IN"+username);

 response.sendRedirect("user_profile1.jsp");
}else
{
  response.sendRedirect("login.jsp");
}
  %>
  <logic:redirect forward=show_room.jsp" paramId="roomId" paramName="roomId" />
</html>

