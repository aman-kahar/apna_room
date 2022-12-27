<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<link rel="stylesheet" href="user_profile1.css"/>
<title>User Profile</title>
</head>

<body>


      <header>
        <div class="wrapper">
              <nav>
                  <input type="checkbox" id="show-search">
                  <input type="checkbox" id="show-menu">
                  <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label for="show-menu">
                  <div class="content">
                    <div class="logo"><a href="#">ApnaRoom</a></div>
                    <ul class="links">
                        <li><a href="../HTML/index.html">Home</a></li>
                        <li><a href="#">Wishlist</a></li>
                        <li><a href="#">Notifications</a></li>
                        <li><a href="../../HTML/our_services.html">Services</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                  </div>
             </nav>
         </div>
      </header>

<%-- STARTS - USER DETAILS  --%>
<%
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt = conn.createStatement();
	rs = stmt.executeQuery("select * from sign_up_page where user_id=4 ");
%>

<%
 while(rs.next())
 {
%>
 
   <h1>User Details<h1>
   <p>  <em> Name:</em>  <%=rs.getString("u_name")%>  </p>
   <p>  <em> Email:</em>  <%=rs.getString("u_email")%>  </p>
   <p>  <em> DOB:</em>  <%=rs.getString("dob")%>  </p>
   <p>  <em> Age:</em>  <%=rs.getString("age")%>  </p>
   <p>  <em> Mobile No:</em>  <%=rs.getString("mobile")%>  </p>
   <p>  <em> Other Mobile NO:</em>  <%=rs.getString("oth_mobile")%>  </p>
   <p>  <em> Gender:</em>  <%=rs.getString("gender")%>  </p>
   <p>  <em> Address:</em>  <%=rs.getString("address")%>  </p>
   <%-- <p>  <em> Profile Photo:</em>  <%=rs.getString("u_photos")%>  </p> <br><br> --%>
   <%
     String photo0 = rs.getString("u_photos");
     int photoIndex0 = photo0.lastIndexOf("/");
     String photo00 = photo0.substring(photoIndex0 + 1);
   %>
   <p>  <em> Profile Photo:</em>  <img src="<%="../apnaroom/images/"+photo00 %>" WIDTH="300" HEIGHT="300" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>
 
 <%
  }
 rs.close();
 stmt.close();
 conn.close();
 %>

<%-- ENDS USER DETAILS --%>

<%-- STARTS USER ROOM DETAILS --%>
 <%
	Connection conn1 = null;
	ResultSet rs1 = null;
	Statement stmt1 = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt1 = conn1.createStatement();
	rs1 = stmt1.executeQuery("select * from add_room where user_id=1001 ");
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
 <%-- ENDS USER ROOM DETAILS --%>

</body>
</html>