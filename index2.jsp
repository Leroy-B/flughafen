<!DOCTYPE HTML>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<HTML>
<head>
<title>This is a jsp page</title>
</head>
<body>
<FORM action="index.jsp" method="post">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >

<TR>
<TH width="50%">Name</TH>
<TD width="50%"><INPUT TYPE="text" NAME="name"></TD>
</tr>
<TR>
<TH width="50%">City</TH>
<TD width="50%"><INPUT TYPE="text" NAME="city"></TD>
</tr>
<TR>
<TH width="50%">Phone</TH>
<TD width="50%"><INPUT TYPE="text" NAME="phone"></TD>
</tr>

<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="submit"></TD>
</tr>
</TABLE>
<%
String name = request.getParameter("name"); 
String city = request.getParameter("city");
String phone = request.getParameter("phone");

String connectionURL = "jdbc:mysql://localhost:3306/student_2";
Connection connection = null;
PreparedStatement pstatement = null;


int updateQuery = 0;
if(name!=null && city!=null && phone!=null)
{
if(name!="" && city!="" && phone!="")
{

try {
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection(connectionURL,"root","");
String queryString = "insert into stu_info(Name,City,Phone) values(?,?,?)";
pstatement = connection.prepareStatement(queryString);

pstatement.setString(1, name);
pstatement.setString(2, city);
pstatement.setString(3, phone);

updateQuery = pstatement.executeUpdate();

if (updateQuery != 0) {%>
<br>
<TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
<tr><th>Data is inserted successfully in database.</th></tr>
</table>

<%
}
}
catch (Exception ex){
out.println("Unable to connect to batabase.");

}finally {
// close all the connections.
pstatement.close();
connection.close();
}

}
}
%>
</FORM>
</body>
</html>
