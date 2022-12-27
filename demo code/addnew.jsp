<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%
String filePath2Save="";
String empName ="";
String empEmail = "";
String empAddress = "";
String empPosition = "";
String empStatus = "";
String fileName = "";
String fieldName = "";

File file ;
ServletContext context = pageContext.getServletContext();
//String filePath = context.getInitParameter("file-upload");
String filePath = "C:/xampp/tomcat/webapps/company/images/pic_";

//Content type verification
String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0))
{
    DiskFileItemFactory factory = new DiskFileItemFactory();

  /**
  we use diskfilefactory class because when user enter our data so that data size is large and all data come at a time so we  use to save that in disk factory which use ourselves space but when data is very large so we not allow to use that particular space so we give another method in which we give a particular path of our memory so that large data is save that location.
  
                       
   We can also set the size threshold and temp location for data if size is greater than the threshold
   factory.setSizeThreshold(maxMemSize);
   factory.setRepository(new File("c:\\temp"));
  **/

 //File upload handler
 ServletFileUpload upload = new ServletFileUpload(factory);

 try {
    // Get the all file items via parsing the request.
    List fileItems = upload.parseRequest(request);

    // Iterate the uploaded file items
    Iterator i = fileItems.iterator();
    while ( i.hasNext () )
    {
     FileItem fi = (FileItem)i.next();
     if (fi.isFormField())
     {
        switch(fi.getFieldName())
        {
         case "name" :
               empName = fi.getString();
               break;
         case "email" :
               empEmail = fi.getString();
               break;
         case "address" :
               empAddress = fi.getString();
               break;
         case "position" :
               empPosition = fi.getString();
               break;
         case "status" :
               empStatus = fi.getString();
               break;
        }
      }
      else
      {
                // Get the uploaded file parameters
                 fieldName = fi.getFieldName();
                 fileName = fi.getName();

                // Write the file
                if( fileName.lastIndexOf("\\") >= 0 ) {
                   file = new File( filePath +
                   fileName.substring( fileName.lastIndexOf("\\"))) ;
                } else {
                   file = new File( filePath +
                   fileName.substring(fileName.lastIndexOf("\\")+1)) ;
                }
                fi.write( file ) ;
                out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                filePath2Save = filePath+fileName;
                String image = filePath2Save;
              %>

    <%

      }

    }


 } catch(Exception ex)
  {
  out.println(ex);
 }
} else
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

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/company","root","");
    PreparedStatement pst = conn.prepareStatement("INSERT INTO `employee` (`eid`, `name`, `email`, `address`, `position`, `status`, `image`) VALUES (default, ?, ?, ?, ?, ?, ?)");

    pst.setString(1,empName);
    pst.setString(2,empEmail);
    pst.setString(3,empAddress);
    pst.setString(4,empPosition);
    pst.setString(5,empStatus);
    pst.setString(6,filePath2Save);
    

    int status = pst.executeUpdate();


    if(status!=0)
    {
      out.println("<h1>Success</h1>");
    }
    else
    {
      out.println("<h1>NOT Successful</h1>");
    }


}
catch(Exception e)
{
      out.println("Exception :- "+e);
}
%>

<html>
<h3>Name : <%=empName%></h3>
<h3>Email : <%=empEmail%></h3>
<h3>Address : <%=empAddress%></h3>
<h3>Position : <%=empPosition%></h3>
<h3>Status : <%=empStatus%></h3>
<h3><img src="images\\<%="pic_"+fileName%>" WIDTH="300" HEIGHT="300" ALIGN="BOTTOM" BORDER="0"></h3>

</html>
