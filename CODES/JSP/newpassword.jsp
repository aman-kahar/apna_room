<%@ page language="java" import="java.sql.*" %>
<%@ page import="java.io.*" %>


<html>
    <head>
       <meta charset="UTF-8" />
       <meta http-equiv="X-UA-Compatible" content="IE=edge" />
       <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <link rel="stylesheet" href="../CSS/forgetpasswordEmail.css" />
       <title>New Password</title>
    </head>

    <body>
<%


    String password1 = request.getParameter("pssword");
    String c_pssword1 = request.getParameter("c_pssword");

    if(password1 != null && c_pssword1 != null){
        if(c_pssword1.equals(password1)){
            Connection conn11 = null;
               ResultSet rs11 = null;
               Statement stmt11 = null;
               Class.forName("com.mysql.jdbc.Driver").newInstance();
               conn11 = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
               stmt11 = conn11.createStatement();
               String id = (String)session.getAttribute("userid");
               int status = stmt11.executeUpdate("UPDATE sign_up_page set pssword = '"+password1+"' , c_pssword = '"+c_pssword1+"' WHERE user_id = '"+id+"'");
            
            
                if(status!= 0)
                {
                 response.sendRedirect("index_login.jsp");
                }
                else
                {
                  response.sendRedirect("newpassword.jsp");
                }

        }
        else{
            %>
            <script>
            alert("PASSWORD NOT MATCHED\nTRY AGAIN.....");
            </script>
        <% 
        }
    }

%>
<div class="design">
<form method="post" action="newpassword.jsp">
      <div>
        <label for="em">Enter New Password : </label><br> 
        <input type="password" id="pssword" name="pssword" required>
      </div><br>
      <div>
        <label for="em">Conform New Password :</label><br> 
        <input type="password" id="c_pssword" name="c_pssword" required>
      </div><br>
      <input type="submit" id="submit" name="submit" value="Submit">
</form>
</div>
    </body>

</html>