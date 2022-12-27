<%@ page import ="java.util.*"%>
<%@ page import="java.sql.*"%>

     <%
       Random random = new Random();
       int sendotp=random.nextInt(90000)+10000;
       out.print("the otp is :"+sendotp);
     %>


<html>
<head>
  <link rel="stylesheet" href="../CSS/forgetpasswordEmail.css" />
  <title>ENTER OTP</title>

    <script src="https://smtpjs.com/v3/smtp.js"></script>
    <script>

          function sendEmail()
          {
            Email.send({
            Host : "smtp.gmail.com",
            Username : "qpyfgu@gmail.com",
            Password : "password2021",
            To : 'amankahar594@gmail.com',
            //To : ''+user_email1,
            From : "qpyfgu@gmail.com",
            Subject : "This is the subject",
            Body : "this is the body",
            })
           .then(function (message) {
              alert("otp send")
           });
       
          }

    </script>

<body>

 <%

   String value = (String)session.getAttribute("OTP Does Not Matched");
   if(value != null && value.equals("wrong")){
       %>
         <script>
            alert("OTP Does Not Matched\nTRY AGAIN...");
         </script>
       <%  
         }
    %>


<div class="design">
    <form action="checkOTP.jsp" method="post">

      <div id="hid" >
      <label for="ot">Enter OTP :</label><br>
      <input type="text" id="ot" name="otp" required>
      <input type="hidden" id="generated_otp" name="generated_otp" value="<%=sendotp%>">
      </div><br>
   
      <input type="submit" id="sub1" value= "Submit" ><br><br>
    <div>
        <input type="button" id="btn1" value="Send OTP" onclick="sendEmail()">
    </div>

     </form>
  </div>
</body>
</html>


