<%@ page import="java.sql.*"%>
<%

try
{
    String player_name = request.getParameter("player_name");
    String username = request.getParameter("username");
    String gender = request.getParameter("gender");

    Class.forName("com.mysql.jdbc.Driver").newInstance();

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/game","root","");

//INSERT INTO `player` (`id`, `name`, `username`, `gender`) VALUES ('1', 'Sumit Tiwari', 'sumitpubg', 'MALE');

    PreparedStatement pst = conn.prepareStatement("INSERT INTO `player` (`id`, `name`, `username`, `gender`) VALUES (default, ?, ?, ?)");
    pst.setString(1,player_name);
    pst.setString(2,username);
    pst.setString(3,gender);

    int status = pst.executeUpdate();


    if(status!=0)
    {
      out.println("Success");
    }
    else
    {
      out.println("NOT Successful");
    }


}
catch(Exception e)
{
      out.println("Exception :- "+e);
}

%>
