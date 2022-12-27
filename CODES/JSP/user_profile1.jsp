<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>


<html>
 <head>
  <link rel="stylesheet" href="../CSS/user_profile4.css"/>
  <link href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap" rel="stylesheet" />
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


<%
   Connection conn11 = null;
   ResultSet rs11 = null;
   Statement stmt11 = null;
   Class.forName("com.mysql.jdbc.Driver").newInstance();
   conn11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
   stmt11 = conn11.createStatement();
   String id1 = (String)session.getAttribute("userid");
   String profile_pic="";
   rs11 = stmt11.executeQuery("select * from sign_up_page where user_id ="+id1);

 while (rs11.next())
 {
   String photo0 = rs11.getString("u_photos");
   int photoIndex0 = photo0.lastIndexOf("/");
   profile_pic = photo0.substring(photoIndex0 + 1);
 }
	 String username =(String)session.getAttribute("username");
	if(null!=username)
	{
%>
        <div class="main-logout"> 
				  <h3><%=username%></h3>
				  <form action="logout.jsp" method="post">
            <button type="submit" class="btn btn-cancel"><i class="fa fa-sign-out" aria-hidden="true"></i> LOGOUT</button>
				  </form>

				<img src="<%="../../images/"+profile_pic %>" alt="profile">

        </div>
	<%
			}
      else
			{
	%>
        <div class="login-btn">
        <form action="login1.jsp" method="post">
        <button  class="btn btn-cont">LOGIN <i class="fa fa-chevron-right"></i></button>
        </form>
        </div>
	<%
			}
  %>



 <%-- STARTS - USER DETAILS  --%>
 <%
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt = conn.createStatement();
  String id = (String)session.getAttribute("userid");
  rs = stmt.executeQuery("select * from sign_up_page where user_id ="+id);
 %>


<div class="user-prof">
 <%
 while(rs.next())
 {
 %>

   <h1><h1>
   <%
     String photo0 = rs.getString("u_photos");
     int photoIndex0 = photo0.lastIndexOf("/");
     String photo00 = photo0.substring(photoIndex0 + 1);
   %>
   <p>  <img src="<%="../../images/"+photo00 %>" class="user-img" WIDTH="120" HEIGHT="120" ALIGN="BOTTOM" BORDER="0">  </p> <br><br><hr>

   <div class="user-prof-text">
   <p>  <em> Name:</em>  <%=rs.getString("u_name")%>  </p>
   <p>  <em> Email:</em>  <%=rs.getString("u_email")%>  </p>
   <p>  <em> DOB:</em>  <%=rs.getString("dob")%>  </p>
   <p>  <em> Age:</em>  <%=rs.getString("age")%>  </p>
   <p>  <em> Mobile No:</em>  <%=rs.getString("mobile")%>  </p>
   <p>  <em> Other Mobile NO:</em>  <%=rs.getString("oth_mobile")%>  </p>
   <p>  <em> Gender:</em>  <%=rs.getString("gender")%>  </p>
   <p>  <em> Address:</em>  <%=rs.getString("address")%>  </p>
   </div>
 <%
  }
  %>
 </div>
 
  <div> 
    <form action="add_rooms_main.jsp" method="post">
      <input type="submit" value="Add Room" class="add-button"> 
    </form>
  </div>

  <div> 
    <form action="notification.jsp" method="post">
       <input type="hidden" name="user_id" value="<%=id%>">
       <input type="hidden" name="user_id" value="<%=id%>">
       <input type="hidden" name="user_id" value="<%=id%>">
       <input type="submit" value="Visit Now" class="button"> 
    </form>
  </div>
  
  <%
 rs.close();
 stmt.close();
 conn.close();
 %>
</body>
</html>
<%-- ENDS USER DETAILS --%>


<%-- STARTS USER ROOM DETAILS --%>
 <%
	Connection conn1 = null;
	ResultSet rs1 = null;
	Statement stmt1 = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt1 = conn1.createStatement();
	rs1 = stmt1.executeQuery("select * from add_room where user_id="+id);
  %>

<div class="room-back">
 <h1><h1>
 </div>
 
<%
  while(rs1.next())
  {
%>

<div class="room-details">


 <div class="room-image-slider">
        <div class="slider-frame">
           <div class="slider-images">
               <div class="img-container">

   <%
     String photo1 = rs1.getString("u_photo1");
     int photoIndex1 = photo1.lastIndexOf("/");
     String photo11 = photo1.substring(photoIndex1 + 1);
   %>
  <img src="<%="../../images/"+photo11 %>" alt="room-image">  </p> <br><br>
  <%
     String photo2 = rs1.getString("u_photo2");
     int photoIndex2 = photo2.lastIndexOf("/");
     String photo22 = photo2.substring(photoIndex2 + 1);
   %>
  <img src="<%="../../images/"+photo22 %>" alt="room-image">  </p> <br><br>
  <%
     String photo3 = rs1.getString("u_photo3");
     int photoIndex3 = photo3.lastIndexOf("/");
     String photo33 = photo3.substring(photoIndex3 + 1);
  %>
  <img src="<%="../../images/"+photo33 %>" alt="room-image">  </p> <br><br>
  <%
     String photo4 = rs1.getString("u_photo4");
     int photoIndex4 = photo4.lastIndexOf("/");
     String photo44 = photo4.substring(photoIndex4 + 1);
  %>
  <img src="<%="../../images/"+photo44 %>" alt="room-image">  </p> <br><br>

               </div>
           </div>
        </div>
     </div>


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


    <%-- <p>  <em> Room Photos:</em><br>
   <%
     String photo1 = rs1.getString("u_photo1");
     int photoIndex1 = photo1.lastIndexOf("/");
     String photo11 = photo1.substring(photoIndex1 + 1);
   %>
  <img src="<%="../../images/"+photo11 %>" WIDTH="200" HEIGHT="200" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>
  <%
     String photo2 = rs1.getString("u_photo2");
     int photoIndex2 = photo2.lastIndexOf("/");
     String photo22 = photo2.substring(photoIndex2 + 1);
   %>
  <img src="<%="../../images/"+photo22 %>" WIDTH="200" HEIGHT="200" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>
  <%
     String photo3 = rs1.getString("u_photo3");
     int photoIndex3 = photo3.lastIndexOf("/");
     String photo33 = photo3.substring(photoIndex3 + 1);
  %>
  <img src="<%="../../images/"+photo33 %>" WIDTH="200" HEIGHT="200" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>
  <%
     String photo4 = rs1.getString("u_photo4");
     int photoIndex4 = photo4.lastIndexOf("/");
     String photo44 = photo4.substring(photoIndex4 + 1);
  %>
  <img src="<%="../../images/"+photo44 %>" WIDTH="200" HEIGHT="200" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>

   <p> <em>Terms And Conditions:</em>  <%=rs1.getString("terms_and_conditions")%> </p><br><br> --%>
 <%
  }
 rs1.close();
 stmt1.close();
 conn1.close();
 %>
</div>
 <%-- ENDS USER ROOM DETAILS --%>

 </body
 </html>