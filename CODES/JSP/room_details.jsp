<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>  
<head>
        <meta charset="UTF-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <link rel="stylesheet" href="../CSS/room_details3.css"/>
       <link rel="stylesheet" href="../CSS/navigation_bar.css"/>
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
       <title>Room Details</title>
       <link rel="stylesheet" href="../CSS/chat_box3.css">
    </head>

</head>

<body>

<%-- Nabvigation Bar Coading Starts --%>
      <header>
        <div class="wrapper">
              <nav class="navbar">
                
             </nav>
         </div>
      </header>
<%-- Nabvigation Bar Coading Ends --%>

<%-- Login Logout Coding Starts  --%>

		<%
	     Connection conn11 = null;
	     ResultSet rs11 = null;
	     Statement stmt11 = null;
	     Class.forName("com.mysql.jdbc.Driver").newInstance();
       conn11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	     stmt11 = conn11.createStatement();
       String id = (String)session.getAttribute("userid");
       String profile_pic="";
	     rs11 = stmt11.executeQuery("select * from sign_up_page where user_id ="+id);

     while (rs11.next()){
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

				<a href = "user_profile1.jsp"><img src="<%="../../images/"+profile_pic %>" alt="profile"></a>

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

<%-- Login Logout Coding Ends  --%>

<%-- Room Details Coding Starts --%>
 <%
	Connection conn1 = null;
	ResultSet rs1 = null;
	Statement stmt1 = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt1 = conn1.createStatement();
  String roomId =(String)session.getAttribute("roomId");
  String userId = "";
	rs1 = stmt1.executeQuery("select * from add_room where room_id="+roomId);
%>

<div class="room-detail">
  <h1 id="heading">Room Details </h1>

<%
    while(rs1.next())
  {
    userId = rs1.getString("user_id");
%>

<div class="room-photos">
<div class="slide hi-slide">
        <div class="hi-prev"> </div>
        <div class="hi-next"> </div>
        <ul>
   <%
     String photo1 = rs1.getString("u_photo1");
     int photoIndex1 = photo1.lastIndexOf("/");
     String photo11= photo1.substring(photoIndex1 + 1);
   %>
  <li> <img src="<%="../../images/"+photo11 %>" alt="room-image"> <li>
  <%
     String photo2 = rs1.getString("u_photo2");
     int photoIndex2 = photo2.lastIndexOf("/");
     String photo22 = photo2.substring(photoIndex2 + 1);
   %>
  <li> <img src="<%="../../images/"+photo22 %>" alt="room-image"> <li>
  <%
     String photo3 = rs1.getString("u_photo3");
     int photoIndex3 = photo3.lastIndexOf("/");
     String photo33 = photo3.substring(photoIndex3 + 1);
  %>
  <li> <img src="<%="../../images/"+photo33 %>" alt="room-image"> <li>
  <%
     String photo4 = rs1.getString("u_photo4");
     int photoIndex4 = photo4.lastIndexOf("/");
     String photo44 = photo4.substring(photoIndex4 + 1);
  %>
  <li> <img src="<%="../../images/"+photo44 %>" alt="room-image"> <li>

 </ul>
    </div>
</div>

<div class="room-type">
     <p> <h5> Room Type: </h5> <%=rs1.getString("room_type")%> </p>
     <p> <h5> State: </h5> <%=rs1.getString("state")%> </p>
     <p> <h5> City: </h5> <%=rs1.getString("city")%> </p>
     <p> <h5> Room Area: </h5>  <%=rs1.getString("room_area")%></p>
     <p> <h5> Room Location: </h5>  <%=rs1.getString("room_location")%> </p>
     <p> <h5> Proximity To Railway Station: </h5>  <%=rs1.getString("pt_railway_station")%> <p>
     <p> <h5> Proximity To Bus Station: </h5> <%=rs1.getString("pt_railway_station")%> </p>
     <p> <h5> Proximity To Coaching Center: </h5>   <%=rs1.getString("pt_railway_station")%> </p>
     <p> <h5> Customer Needed: </h5>  <%=rs1.getString("customer_needed")%> </p>
     <p> <h5> Facilities: </h5> <%=rs1.getString("facilities")%> </p>
     <p> <h5> Terms And Conditions: </h5>  <%=rs1.getString("terms_and_conditions")%> </p><br><br>
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
 
<%-- Room Details Coding Starts --%>

<%
	Connection conn21 = null;
	ResultSet rs21 = null;
	Statement stmt21 = null;
  
	Class.forName("com.mysql.jdbc.Driver").newInstance();
  conn21 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt21 = conn21.createStatement();
  rs21 = stmt21.executeQuery("select * from sign_up_page where user_id = " +(String)session.getAttribute("userid"));
 %>
  <div> 

    <form action="get_a_visit.jsp" method="post">
       <input type="hidden" name="room_owner_id" value="<%=userId%>">
     <%
       while(rs21.next()){
     %>
       <input type="hidden" name="customer_id" value="<%=rs21.getString("user_id")%>">
       <input type="hidden" name="customer_name" value="<%=rs21.getString("u_name")%>">
       <input type="hidden" name="customer_contact" value="<%=rs21.getString("mobile")%>">
       <input type="hidden" name="customer_email_id" value="<%=rs21.getString("u_email")%>">
    <%
     }
    %>
       <input type="submit" value="Visit Now" class="button"> 
    </form>
  </div>
 <%
 rs21.close();
 stmt21.close();
 conn21.close();
 %> 






<%-- CHAT BOX CODING STARTS HERE --%>


    <div class="container">
        <!-- chat box -->
        <div class="chat-box">
            <!-- client -->
            <div class="client">
                <img src="../../CODES/imported_images/pic_userprofile.jpg" alt="logo" />
                <div class="client-info">
                    <h2>Owner Name</h2>
                    <p>owner</p>
                </div>
            </div>

            <!-- main chat section -->
            <div class="chats">
                <div class="client-chat">Hi!</div>
                <div class="my-chat">Hi!</div>
                <div class="client-chat">How can i help you?</div>
                <div class="my-chat">How you create this chat box?</div>
                <div class="client-chat">Watch complete video for your answer.</div>
            </div>

            <!-- input field section -->
            <div class="chat-input">
                <input type="text" placeholder="Enter Message" />
                <button class="send-btn">
                    <img src="../imported_images/send.png" alt="send-btn">
                </button>
            </div>
        </div>

        <!-- button -->
        <div class="chat-btn">
            <img src="../imported_images/Circle-icons-chat.svg.png" alt="chat box icon btn">
        </div>
    </div>

    <script src="jquery-3.4.1.min.js"></script>
    <script src="chat_box.js"></script>
    

    <%-- CHAT BOX CODING ENDS HERE --%>

    <script src="./navigation_bar.js"></script>
 </body>
 </html>