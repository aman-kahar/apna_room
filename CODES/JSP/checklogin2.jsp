<html>
<%
String username =(String)session.getAttribute("username");
if(username!=null)
{
 String roomId =  request.getParameter("roomid");
 out.println("LOGGED IN"+roomId);
 session.setAttribute("roomId",roomId);
 response.sendRedirect("room_details.jsp");
}else
{
  response.sendRedirect("index_login.jsp");
}
  %>
  <logic:redirect forward="show_room.jsp" paramId="roomId" paramName="roomId" />
</html>
