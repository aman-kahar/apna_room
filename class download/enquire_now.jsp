<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>

 <html>
 <head>

     <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <link rel="stylesheet" href="enquire_now.css"/>
    <title>ENQUIRE NOW</title>

 </head>

 <body>
	<%
			String username =(String)session.getAttribute("username");

			if(null!=username)
			{
					String profile_pic = (String)session.getAttribute("profile_pic");
			  %>

				<h3><%=username%></h3>
				<form action="logout.jsp" method="post">
					<input class="logout" type="submit" value="LOGOUT"/>
				</form>
				<img src="images<%=profile_pic%>" WIDTH="30" HEIGHT="30" ALIGN="RIGHT" BORDER="1">

				<%
			}else
			{
				%>
				<h3><a href="login.jsp"/> Login</h3>
				<%
			}

			%>






 <%
	Connection conn1 = null;
	ResultSet rs1 = null;
	Statement stmt1 = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt1 = conn1.createStatement();
  String roomId =(String)session.getAttribute("roomId");
  out.print(roomId);
  rs1 = stmt1.executeQuery("select * from add_room where room_id="+roomId);
  %>


  <h1>Room Details <h1>
<%
  while(rs1.next())
  {
%>

   <p> <em>Room Type:</em> <%=rs1.getString("room_type")%> </p>
   <p> <em>State:</em>  <%=rs1.getString("state")%> </p>
   <p> <em>City:</em> <%=rs1.getString("city")%> </p>
   <p> <em>Room Area:</em>  <%=rs1.getString("room_area")%></p>
   <p> <em>Room Location:</em>  <%=rs1.getString("room_location")%> </p>
   <p> <em>Proximity To Railway Station:</em>  <%=rs1.getString("pt_railway_station")%> <p>
   <p> <em>Proximity To Bus Station:</em> <%=rs1.getString("pt_railway_station")%> </p>
   <p> <em>Proximity To Coaching Center:</em>  <%=rs1.getString("pt_railway_station")%> </p>
   <p> <em>Customer Needed:</em>  <%=rs1.getString("customer_needed")%> </p>
   <p> <em>Facilities:</em> <%=rs1.getString("facilities")%> </p>
   <%-- <p> <em>Room Photo1:</em>  <%=rs1.getString("u_photo1")%> </p>
   <p> <em>Room Photo2:</em>  <%=rs1.getString("u_photo2")%> </p>
   <p> <em>Room Photo3:</em>  <%=rs1.getString("u_photo3")%> </p>
   <p> <em>Room Photo4:</em>  <%=rs1.getString("u_photo4")%> </p> --%>


    <p>  <em> Room Photos:</em><br>
   <%
     String photo1 = rs1.getString("u_photo1");
     int photoIndex1 = photo1.lastIndexOf("/");
     String photo11= photo1.substring(photoIndex1 + 1);
   %>
  <img src="<%="../apnaroom/images/"+photo11 %>" WIDTH="300" HEIGHT="300" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>
  <%
     String photo2 = rs1.getString("u_photo2");
     int photoIndex2 = photo2.lastIndexOf("/");
     String photo22 = photo2.substring(photoIndex2 + 1);
   %>
  <img src="<%="../apnaroom/images/"+photo22 %>" WIDTH="300" HEIGHT="300" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>
  <%
     String photo3 = rs1.getString("u_photo3");
     int photoIndex3 = photo3.lastIndexOf("/");
     String photo33 = photo3.substring(photoIndex3 + 1);
  %>
  <img src="<%="../apnaroom/images/"+photo33 %>" WIDTH="300" HEIGHT="300" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>
  <%
     String photo4 = rs1.getString("u_photo4");
     int photoIndex4 = photo4.lastIndexOf("/");
     String photo44 = photo4.substring(photoIndex4 + 1);
  %>
  <img src="<%="../apnaroom/images/"+photo44 %>" WIDTH="300" HEIGHT="300" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>

   <p> <em>Terms And Conditions:</em>  <%=rs1.getString("terms_and_conditions")%> </p><br><br>

 <%
  }
 rs1.close();
 stmt1.close();
 conn1.close();
 %>
</body>
</html>