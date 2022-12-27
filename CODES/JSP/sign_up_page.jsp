<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%
String filePath2Save="";
String user_id = "";
String  u_name= "";
String u_email = "";
String dob = "";
String age = "";
String  mobile= "";
String oth_mobile = "";
String gender = "";
String address = "";
String  u_photos= "";
String pssword = "";
String c_pssword = "";
String fileName ="";
String fieldName = "";


File file;
ServletContext context = pageContext.getServletContext();

String filePath ="C:/xampp/tomcat/webapps/apnaroom/images/pic_";

String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0))
{
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

 try 
 {
    List fileItems = upload.parseRequest(request);

    Iterator i = fileItems.iterator();
    while ( i.hasNext () )
    {
     FileItem fi = (FileItem)i.next();
     if (fi.isFormField())
     {
        switch(fi.getFieldName())
        {
        case "u-name" :
              u_name = fi.getString();
               break;
       case "u-email" :
             u_email = fi.getString();
               break;
       case "dob" :
             dob = fi.getString();
               break;
       case "age" :
             age = fi.getString();
               break;
       case "mobile" :
              mobile = fi.getString();
               break;
       case "oth-mobile" :
            oth_mobile = fi.getString();
               break;
       case "gender" :
              gender = fi.getString();
               break;
       case "address" :
             address = fi.getString();
               break;
       case "pssword" :
             pssword = fi.getString();
               break;
       case "c-pssword" :
             c_pssword = fi.getString();
               break;
        
        }
     
      }
        else
      {
                // Get the uploaded file parameters
                 fieldName = fi.getFieldName();
                 fileName = fi.getName();

                // Write the file
                if( fileName.lastIndexOf("\\") >= 0 ) 
                {
                   file = new File( filePath +
                   fileName.substring( fileName.lastIndexOf("\\"))) ;
                } 
                else
                 {
                   file = new File( filePath +
                   fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                }
                fi.write( file ) ;
                out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                u_photos = filePath+fileName;
              %>

    <%

      }
    }

 } 
 catch(Exception ex)
  {
  out.println(ex);
 }
}
else
 {
 out.println("<html>");
 out.println("<head>");
 out.println("<title>Upload Failed</title>");
 out.println("</head>");
 out.println("<body>");
out.println("<p>No file uploaded</p>");
 out.println("</body>");
 out.println("</html>");
}


try
{

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
    PreparedStatement pst = conn.prepareStatement("INSERT INTO `sign_up_page` (`user_id`, `u_name`, `u_email`, `dob`, `age`, `mobile`, `oth_mobile`, `gender`, `address`, `u_photos`, `pssword`, `c_pssword`)  VALUES (default,?,?,?,?,?,?,?,?,?,?,?)");

    pst.setString(1,u_name);
    pst.setString(2,u_email);
    pst.setString(3,dob);
    pst.setString(4,age);
    pst.setString(5,mobile);
    pst.setString(6,oth_mobile);
    pst.setString(7,gender);
    pst.setString(8,address);
    pst.setString(9,u_photos);
    pst.setString(10,pssword);
    pst.setString(11,c_pssword);
   
    int status = pst.executeUpdate();

    if(status!=0)
    {
      response.sendRedirect("checklogin.jsp");
    }
    else
    {
      response.sendRedirect("../HTML/sign_up_page1.html");
    }


}
catch(Exception e)
{
      out.println("Exception :- "+e);
}
%>