<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cards</title>

    <link rel="stylesheet" href="../CSS/index26.css">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link
         href="https://fonts.googleapis.com/css2?family=Patrick+Hand&display=swap"
         rel="stylesheet"/>

    <script
         src="https://kit.fontawesome.com/67a7f66806.js"
         crossorigin="anonymous">
    </script>

</head>


<body>

    <%-- Navigation Bar Coading Starts --%>

      <header>
        <div class="wrapper">
              <nav class="navbar">

             </nav>
         </div>
      </header>

<%-- Navigation Bar Coading Ends --%>



<%-- Login Logout Coding Starts  --%>
<div class="login-logout">
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
        <form action="index_login.jsp" method="post">
        <button  class="btn btn-cont">LOGIN <i class="fa fa-chevron-right"></i></button>
        </form>
        </div>
				<%
			}
			%>
</div>
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

<%-- Filter Coding Ends --%>











<%-- CARDS CODING STARTS HERE --%>
<div>
 <%
     while(rs.next())
      {
 %>
  <%
       String photo1 = rs.getString("u_photo1");
       int photoIndex1 = photo1.lastIndexOf("/");
       String photo11= photo1.substring(photoIndex1 + 1);
  %>
<div class="cards_overlook container">
    <div class="blog-post">
        <div class="blog-post_img">
            <img src="<%="../../images/"+photo11 %>" alt="roomimages">
        </div>
        <div class="blog-post_info">
            <div class="blog-post_date">

                <span>Available</span>

                <div class="button1 button-4"><%=rs.getString("room_rent")%> $</div>

                <span>Customer Needed : <%=rs.getString("customer_needed")%></span>

                <span>Location : <%=rs.getString("room_location")%></span>

            <h1 class="blog-post_title">Room Type : <%=rs.getString("room_type")%></h1>

            <p class="blog-post_text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. Eveniet totam quidem, esse provident molestiae at necessitatibus nobis minus nihil impedit deserunt cum.
            </p>
        
               <form method="post" action="checklogin2.jsp">
                <input type="hidden" id="roomid" name="roomid" value="<%=rs.getString("room_id")%>">
                <button class="button" onclick="togglePopup()" >Enquire Now</button>
               </form>
             

         </div>
        </div>
    </div>
<%
    }
  
    if (!rs.isBeforeFirst() ) 
     {
      out.println("");
     }
  
    rs.close();
    stmt.close();
    conn.close();
%>
</div>

</div>
<%-- CARDS CODING ENDS HERE --%>

<script src="./navigation_bar.js"></script>

</body>
</html>