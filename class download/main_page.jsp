<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

		<html>
		<style type="text/css">
		h1 {
    font-family:"Oswald";
	font-weight:bold;
	font-size: 40px;
	text-align: center;

	color: #0B3B17;
	margin: 0;
	padding: 15px 5px 0px 5px ;
}

h2 {
   font-family:"Wellfleet";
   font-weight: bold;
   font-size: 20px;
   font-style:normal;
   text-align: right;
   color: #0B173B;
   margin: 0px 10px 0px 0px ;

}
	h3 {
   font-family:"Wellfleet";
   font-weight: bold;
   font-size: 15px;
   font-style:normal;
   text-align: right;
   color: #0B173B;
   margin: 0px 10px 0px 0px ;

}
img
{
  border-radius: 50%;
	margin: -30px 130px 0px 10px;
}

		#textbox {
 font-family: 'Marko One';
 font-style:italic;
  font-weight: bold;
   font-size: 24px;
  text-align: justify;
  margin: 20px auto;
  color:#2E2E2E;
}

.logout
{
	font-family:"Wellfleet";
	font-weight: bold;
	font-size: 8px;
	font-style:normal;
	float: right;
	color: #0B173B;
	margin: 0px 10px 0px 0px ;
}

div.bg
{
background-color:#E6E6E6;
	color: #34ff32;
	border-radius: 25px;
    border: 2px solid #73AD21;
    padding: 20px;
	margin: 10;
}

body{
background-color:#fff;
	color: #344432;

	margin: 0;


}
pre {
       white-space: pre-wrap; /* CSS3 */
    white-space: -moz-pre-wrap; /* Mozilla, post millennium */
    white-space: -pre-wrap; /* Opera 4-6 */
    white-space: -o-pre-wra
     }
		</style>


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
				<h3><a href="login1.jsp"/> Login</h3>
				<%
			}

			%>

		<center>



		</center>
		</body>
		</html>
