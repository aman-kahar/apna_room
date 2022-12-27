<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page language="java" import="java.sql.*" %>	
    
    
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


<style>
/* LOGOUT PROFILE CODE STARTS */
.main-logout {
  display: flex;
  align-items: center;
  justify-content: center;
  position: fixed;
  right: 25px;
  top: 6%;
  transform: translateY(-50%);
  padding: 6px 90px;
  cursor: pointer;
  z-index: 1;
  background: #000000;
}

.main-logout h3 {
  display: flex;
  align-items: center;
  justify-content: center;
  position: fixed;
  right: 55px;
  top: 28%;
  transform: translateY(-50%);
  padding: 5px 10px;
  cursor: pointer;
  z-index: 1;
  font-size: 15px;
  color: yellow;
  font-weight: 100;
}

.login-btn a h3 {
  position: fixed;
  right: 25px;
  top: 6%;
  transform: translateY(-50%);
  background: #000000;
  padding: 5px 10px;
  cursor: pointer;
  color: yellow;
  z-index: 1;
}

.main-logout img {
  display: flex;
  align-items: center;
  justify-content: center;
  right: 55px;
  top: 28%;
  transform: translate(82px, -1px);
  border: 1px solid rgb(255, 0, 0);
  border-radius: 30px;
  width: 50px;
}

.main-logout button,
.login-btn button {
  display: flex;
  align-items: center;
  justify-content: center;
  position: fixed;
  right: 70px;
  top: 75%;
  transform: translateY(-50%);
  background: #000000;
  padding: 5px 10px;
  color: yellow;
  border: none;
}

.btn:hover,
button:hover {
  outline: 0;
  color: #fff;
  text-transform: uppercase;
  transition: all 0.5s ease;
  cursor: pointer;
}

.btn:active,
button:active {
  outline: 0;
  color: #fff;
}

.btn-cancel:hover {
  border: none;
  color: #fff;
  background: linear-gradient(to bottom, #e74c3c 50%, #c0392b 50%);
  background-size: 110% 210%;
  background-position: left top;
  background-position: right bottom;
}

.login-btn button {
  right: 50px;
  top: 6%;
  z-index: 1;
}

.btn-cont:hover {
  padding: 0.7em 1.5em;
  border: none;
  color: #fff;
  background: linear-gradient(to left, #2ecc71 50%, #27ae60 50%);
  background-size: 200% 100%;
  background-position: right bottom;
  background-position: left bottom;
}

/* LOGOUT PROFILE CODE STARTS */

</style>