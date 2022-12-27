<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <link rel="stylesheet" href="enquire.css"/>
       <link rel="preconnect" href="https://fonts.googleapis.com" />
       <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
       <link
         href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap"
         rel="stylesheet"
       />
       <script
         src="https://kit.fontawesome.com/67a7f66806.js"
         crossorigin="anonymous">
       </script>
       <title>ENQUIREY PAGE</title>
    </head>

</head>
<body>

		<%
			String username =(String)session.getAttribute("username");

			if(null!=username)
			{
					String profile_pic = (String)session.getAttribute("profile_pic");
		%>

        <div class="main-logout"> 
				  <h3><%=username%></h3>
				  <form action="logout.jsp" method="post">
            <button type="submit" class="btn btn-cancel"><i class="fa fa-sign-out" aria-hidden="true"></i> LOGOUT</button>
				  </form>

				<img src="images<%=profile_pic%>" alt="profile">

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


      <header>
        <div class="wrapper">
              <nav>
                  <input type="checkbox" id="show-search">
                  <input type="checkbox" id="show-menu">
                  <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label for="show-menu">
                  <div class="content">
                    <div class="logo"><a href="#">ApnaRoom</a></div>
                    <ul class="links">
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Wishlist</a></li>
                        <li><a href="#">Notifications</a></li>
                        <li><a href="#">Services</a></li>
                        <li><a href="#">About Us</a></li>
                    </ul>
                  </div>
             </nav>
         </div>
      </header>



 <%
	Connection conn1 = null;
	ResultSet rs1 = null;
	Statement stmt1 = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt1 = conn1.createStatement();
  String roomId =(String)session.getAttribute("roomId");
	rs1 = stmt1.executeQuery("select * from add_room where room_id="+roomId);
%>

<div class="room-detail">
  <h1 id="heading">Room Details </h1>

<%
    while(rs1.next())
  {
%>


    <div class="slide hi-slide">
        <div class="hi-prev"> </div>
        <div class="hi-next"> </div>
        <ul>
            <li><img src="#" alt=""></li>
            <li><img src="#" alt=""></li>
            <li><img src="#" alt=""></li>
            <li><img src="#" alt=""></li>
            <li><img src="#" alt=""></li>
            <li><img src="#" alt=""></li>
            <li><img src="#" alt=""></li>
            <li><img src="#" alt=""></li>
        </ul>
    </div>


<div class="room-type">
    Room Type:<p> <%=rs1.getString("room_type")%> </p>
    State:<p>  <%=rs1.getString("state")%> </p>
    City:<p> <%=rs1.getString("city")%> </p>
    Room Area:<p>  <%=rs1.getString("room_area")%></p>
    Room Location:<p>  <%=rs1.getString("room_location")%> </p>
    Proximity To Railway Station:<p>  <%=rs1.getString("pt_railway_station")%> <p>
    Proximity To Bus Station:<p> <%=rs1.getString("pt_railway_station")%> </p>
    Proximity To Coaching Center:<p>  <%=rs1.getString("pt_railway_station")%> </p>
    Customer Needed:<p>  <%=rs1.getString("customer_needed")%> </p>
    Facilities:<p> <%=rs1.getString("facilities")%> </p>
    Terms And Conditions:<p>  <%=rs1.getString("terms_and_conditions")%> </p><br><br>
</div>


</div>

 <%
  }
 rs1.close();
 stmt1.close();
 conn1.close();
 %>



 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script src="hislide/jquery.hislide.js"></script>
 <script>
 $('.slide').hiSlide();
 </script>
</body>
</html>