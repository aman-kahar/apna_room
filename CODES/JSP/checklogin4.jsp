<html>
<%
String username =(String)session.getAttribute("username");
if(username!=null)
{
 response.sendRedirect("get_notified.jsp");
}else
{
  response.sendRedirect("login1.jsp");
}
  %>
  <logic:redirect forward="show_room.jsp" paramId="roomId" paramName="roomId" />
</html>