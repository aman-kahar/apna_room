<%@ page import="java.sql.*"%>
<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%
String filePath2Save = "";
String room_id = "";
String user_id = "";
String room_type = "";
String state = "";
String city = "";
String room_area = "";
String room_location = "";
String pt_railway_station = "";
String pt_bus_station = "";
String pt_coaching_center = "";
String customer_needed = "";
String fac_bed = "";
String fac_fan = "";
String fac_bathlath = "";
String fac_table = "";
String fac_water = "";
String fac_electricity = "";
String fac_other_facilities = "";
String room_rent = "";
String electricity = "";
String u_photo1 = "";
String u_photo2 = "";
String u_photo3 = "";
String u_photo4 = "";
String terms_and_conditions = "";
String fileName = "";
String fieldName = "";
String upload_photos[] = new String[4];
int img_index=0; // indexing to upload image

File file;
ServletContext context = pageContext.getServletContext();

String filePath ="C:/xampp/tomcat/webapps/apnaroom/images/pic_";

String contentType = request.getContentType();

if ((contentType.indexOf("multipart/form-data") >= 0))
{
    DiskFileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

 try {
    List fileItems = upload.parseRequest(request);

    Iterator i = fileItems.iterator();
    while ( i.hasNext () )
    {
     FileItem fi = (FileItem)i.next();
     if (fi.isFormField())
     {
        switch(fi.getFieldName())
        {
        case "user-id" :
               user_id = fi.getString();
               break;
        case "room-type" :
               room_type = fi.getString();
               break;
        case "state" :
               state = fi.getString();
               break;
        case "city" :
               city = fi.getString();
               break;
        case "room-area" :
              room_area  = fi.getString();
               break;
        case "room-location" :
               room_location = fi.getString();
               break;        
        case "railway-stations" :
               pt_railway_station = fi.getString();
               break;
        case "bus-stations" :
               pt_bus_station = fi.getString();
               break;       
        case "coaching-centers" :
               pt_coaching_center = fi.getString();
               break;
        case "customer-type" :
               customer_needed = fi.getString();
               break;        
        case "bed" :
               fac_bed = fi.getString();
               break;
        case "fac-fan" :
               fac_fan = fi.getString();
               break;        
        case "fac-bath-lath" :
               fac_bathlath = fi.getString();
               break;
        case "fac-table" :
               fac_table = fi.getString();
               break;        
        case "fac-water" :
               fac_water = fi.getString();
               break;
        case "fac-electricity" :
               fac_electricity = fi.getString();
               break;
        case "fac-other-facilities" :
               fac_other_facilities = fi.getString();
               break;
        case "rent" :
               room_rent = fi.getString();
               break;
        case "electricity" :
               electricity = fi.getString();
               break;
        case "terms-and-conditions" :
               terms_and_conditions = fi.getString();
               break; 
        }
      }
else
      {
                 fieldName = fi.getFieldName();
                 fileName = fi.getName();

                if( fileName.lastIndexOf("/") >= 0 ) {
                   file = new File( filePath +
                   fileName.substring( fileName.lastIndexOf("/"))) ;
                } else {
                   file = new File( filePath +
                   fileName.substring(fileName.lastIndexOf("/")+1)) ;
                }
                fi.write( file ) ;
                out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                //upload_photfilePath2Save = filePath+fileName;
               // String image = filePath2Save;
                upload_photos[img_index++] =  filePath+fileName;
              %>
    <%
      }
    }

 } catch(Exception ex)
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

String facilities = fac_bed+" @ "+fac_fan+" @ "+fac_bathlath+" @ "+fac_table+" @ "+fac_water+" @ "+fac_electricity+" @ "+fac_other_facilities;
 

try
{

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnaroom","root","");
    PreparedStatement pst = conn.prepareStatement("INSERT INTO `add_room` (`room_id`, `user_id`, `room_type`, `state`, `city`, `room_area`, `room_location`, `pt_railway_station`, `pt_bus_station`, `pt_coaching_center`, `customer_needed`, `facilities`, `room_rent`, `electricity`, `u_photo1`, `u_photo2`, `u_photo3`, `u_photo4`, `terms_and_conditions`) VALUES (default,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

    pst.setString(1,user_id);
    pst.setString(2,room_type);
    pst.setString(3,state);
    pst.setString(4,city);
    pst.setString(5,room_area);
    pst.setString(6,room_location);
    pst.setString(7,pt_railway_station);
    pst.setString(8,pt_bus_station);
    pst.setString(9,pt_coaching_center);
    pst.setString(10,customer_needed);
    pst.setString(11,facilities);
    pst.setString(12,room_rent);
    pst.setString(13,electricity);
    pst.setString(14,upload_photos[0]);
    pst.setString(15,upload_photos[1]);
    pst.setString(16,upload_photos[2]);
    pst.setString(17,upload_photos[3]);
    pst.setString(18,terms_and_conditions);


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