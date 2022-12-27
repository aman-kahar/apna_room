<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>


<html>
   <head>
       <meta charset="UTF-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <link rel="stylesheet" href="../CSS/home_page8.css"/>
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
       <title>NAVIGATION BAR</title>
    </head>


    <body>

    <%-- Navigation Bar Coading Starts --%>

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
                        <li><a href="checklogin4.jsp">Notifications</a></li>
                        <li><a href="../../HTML/our_services.html">Services</a></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="checklogin3.jsp">My Account</a></li>
                    </ul>
                  </div>
             </nav>
         </div>
      </header>

<%-- Navigation Bar Coading Ends --%>

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

<%-- Filter Coding Starts --%>

    <%
	     Connection conn = null;
	     ResultSet rs = null;
	     Statement stmt = null;
	     Class.forName("com.mysql.jdbc.Driver").newInstance();
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
	     stmt = conn.createStatement();

       String queryTofire = "select * from add_room where room_id>0";
     
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

<%-- Filter Coding Ends --%>

<%-- Rooom Cards Overlook Coding Starts --%>

 <section>
	  <form action="home_page2.jsp" method="post">
      <div class="filter-search">
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
            selectedFac =new ArrayList(Arrays.asList(search_facities));
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
    </div>
    </div>
  </form>
</section>
    

 <%
     while(rs.next())
      {
 %>
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
        </p>

        <div>
        <form method="post" action="checklogin2.jsp">
           <input type="hidden" id="roomid" name="roomid" value="<%=rs.getString("room_id")%>">
           <button onclick="togglePopup()" >Enquire Now</button>
        </form>
        </div>
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
  
    if (!rs.isBeforeFirst() ) 
     {
      out.println("NO DATA");
     }
  
    rs.close();
    stmt.close();
    conn.close();
%>
    </div>

<%-- Rooom Cards Overlook Coding Ends --%>


</body>
</html>
