<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="search_page.css"/>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap"
      rel="stylesheet"
    />
    <script
      src="https://kit.fontawesome.com/67a7f66806.js"
      crossorigin="anonymous"
    ></script>
    <title>NAVIGATION BAR</title>
  </head>
  <body>

<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%
	Connection conn = null;
	ResultSet rs = null;
	Statement stmt = null;
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	stmt = conn.createStatement();
 

  String queryTofire = "select * from add_room where room_id > 0";
    

  String search_state = request.getParameter("state");
	String search_city = request.getParameter("city");
	String search_facities[] = request.getParameterValues("facilites");
	String state2show = "";
  String city2show = "";

  if(search_state==null)
	{
		state2show="";
	}
	else
	{
		state2show = search_state;
	}

   if(search_state!=null  && !search_state.equals(""))
    {
     queryTofire = queryTofire + " AND `state` LIKE '%"+search_state+"%'";
    }

   if(search_city==null)
	 {
	 	city2show="";
	 }
	 else
	 {
	 	city2show = search_city;
	 }

   if(search_city!=null  && !search_city.equals(""))
    {
     queryTofire = queryTofire + " AND `city` LIKE '%"+search_city+"%'";
    }


   if(search_facities!=null)
    {
     String tempdata="%";
	 for(int i=0; i<search_facities.length; i++)
     {
      tempdata = tempdata + search_facities[i]+"%";
     }
	  queryTofire = queryTofire + " AND `facilities` LIKE '"+tempdata+"' ";
    }

   rs = stmt.executeQuery(queryTofire);
%>
		


 

<div class="wrapper">
      <nav>
          <input type="checkbox" id="show-search">
          <input type="checkbox" id="show-menu">
          <label for="show-menu" class="menu-icon"><i class="fas fa-bars"></i></label for="show-menu">
          <div class="content">
            <div class="logo"><a href="#">ApnaRoom</a></div>
            <ul class="links">
                <li><a href="navigation_bar.html">Home</a></li>
                <li><a href="#">Wishlist</a></li>
                <li><a href="#">Notifications</a></li>
                <li><a href="../../HTML/our_services.html">Services</a></li>
                <li><a href="#">About Us</a></li>
                <li><a href="profile_checklogin.jsp" class="desktop-link">Profile</a>
                
                     <%-- <label for="show-profile">Profile</label>
                    <input type="checkbox" id="show-profile">
                     <ul> 
                        <li><a href="../../HTML/login_page.html">Login</a></li>
                        <li><a href="#">Sign Up</a></li>  --%>
                    </ul> 
                </li>
            </ul>
        </div>
        <form action="#" class="search-box">
          <input type="text" placeholder="Type here to Search...." required>
          <button type="submit" class="go-icon"><i class="fas fa-long-arrow-alt-right"></i></button>
        </form>
        <label for="show-search" class="search-icon"><i class="fas fa-search"></i></label for="show-search">
      </nav>

</div>


<%-- STARTS SEARCH BY FILTER --%>
<div class="filter-search">
	<form action="search_page.jsp" method="post">
<div >
  <div class="filter-items">
  
   <span class="filter-items-input"> State:- <input type="text" name="state" value="<%=state2show%>"> </span>
   <span class="filter-items-input"> City :- <input type="text" name="city" value="<%=city2show%>"> </span>
	
   <label for="facilites"  class="filter-items-input">FACITIES:</label>
    <select name="facilites" id="facilites" multiple>
    <%
     String[] fList = {"Bed","Fan","Bath+Lath","Table","Water","Electricity"};
     ArrayList selectedFac;
     try
     {
      selectedFac = new ArrayList(Arrays.asList(search_facities));
     }
     catch(Exception e)
    {
	    selectedFac =new ArrayList();
    }

    for(String s:fList)
   {
    if(selectedFac.contains(s))
	 {
		 %>
		 <option value="<%=s%>"SELECTED><%=s%>
		 <%
	 }
	 else
	 {
		 %>
		 <option value="<%=s%>"><%=s%>
		 <%
     }
	    %>
    </option>
   <%
    }
   %>

    <input type="submit" class="filter-items-input"  value="Search">
</form>
</div>

<%-- ENDS SEARCH BY FILTER --%>

<%
 while(rs.next())
 {
%>
   <%-- <p> <em>Room Type:</em> <%=rs.getString("room_type")%> </p>
   <p> <em>Room Rent:</em> <%=rs.getString("room_rent")%> </p>
   <p> <em>Customer Needed:</em>  <%=rs.getString("customer_needed")%> </p>

    <p>  <em> Room Photos:</em><br>
   <%
     String photo1 = rs.getString("u_photo1");
     int photoIndex1 = photo1.lastIndexOf("/");
     String photo11= photo1.substring(photoIndex1 + 1);
   %>
  <img src="<%="../apnaroom/images/"+photo11 %>" WIDTH="300" HEIGHT="300" ALIGN="BOTTOM" BORDER="0">  </p> <br><br>

  <form action="checklogin.jsp">
    <input type="hidden" id="roomid" name="roomid" value="<%=rs.getString("room_id")%>">
	<button type="submit">Enquire Now</button>
 </form> --%>


<div class="room-overlook">
 <div class="card">
    
      <p>
         <%
           String photo1 = rs.getString("u_photo1");
           int photoIndex1 = photo1.lastIndexOf("/");
           String photo11= photo1.substring(photoIndex1 + 1);
         %>
         <div class="card-image">
           <%-- <img src="<%="../apnaroom/images/"+photo11 %>" >   --%>
        </div>
      </p> 
  
    <div class="card-text">
        <span class="date">available</span>
        <h3> <em>Room Type:</em> <%=rs.getString("room_type")%> </h3>
        <p>
          Lorem ipsum dolor sit amet consectetur, adipisicing elit. Cumque iste
          dolorum pariatur distinctio unde, voluptatum delectus earum laudantium
          sint amet.

            <form action="checklogin.jsp">
             <input type="hidden" id="roomid" name="roomid" value="<%=rs.getString("room_id")%>">
	         <button type="submit">Enquire Now</button>
            </form>

            
        </p>
      </div>
      <div class="card-stats">
          <div class="stat">
              <div class="value"><sup><em>Room Rent</em></sup></div>
              <div class="type"><%=rs.getString("room_rent")%></div>
          </div>
          <div class="stat border">
            <div class="value">5 star</div>
            <div class="type">views</div>
        </div>
        <div class="stat">
            <div class="value"><sup>Customer Needed</sup></div>
            <div class="type"><%=rs.getString("customer_needed")%></div>
        </div>
      </div>
    </div>
   </div> 




 <%
  }

   if (!rs.isBeforeFirst() ) {
	  out.println("NO DATA");
	}

 rs.close();
 stmt.close();
 conn.close();
 %>
</div>
</body>
</html>
