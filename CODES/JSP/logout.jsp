<%
session.invalidate();
out.println("success");
response.sendRedirect("../HTML/index.html");
%>