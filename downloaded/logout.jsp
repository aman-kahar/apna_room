<%
session.invalidate();
out.println("success");
response.sendRedirect("main_room_show.jsp");
%>