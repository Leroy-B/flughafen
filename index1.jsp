
<%@ page session="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%

try{

    Connection conn = null;
    Statement stmt = null;
    String dbuid = "flughafen";
    String dbpwd = "flug";

    String sort_column = "1";
    String sort_order = "asc";
    if(request.getParameter("sort") != null){
        sort_column = request.getParameter("sort");
    }
    if(request.getParameter("sortdir") != null){
        sort_order = request.getParameter("sortdir");
    }

    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection ("jdbc:mysql://localhost:3306/flughafendb", dbuid, dbpwd);
    stmt = conn.createStatement();

    String the_sql = "SELECT * FROM FLUGHAFEN ORDER BY ? ?";

    PreparedStatement pstmt = conn.prepareStatement(the_sql);
    pstmt.setString(1, sort_column);
    pstmt.setString(2, sort_order);

    ResultSet res = pstmt.executeQuery();

    out.println("<table border=1><thead><th>Kürzel</th><th>Bezeichnung</th></thead>");

    int rowcount = 0;
    while(res.next()) {
        rowcount++;
        out.print("<tr><td>" + res.getString("kurzel") + " " + "</td><td>" + res.getString("bezeichnung") + "</td></tr>");
    }

    out.println("</table>");

    // out.println("<br>" + rowcount + " records found!");
} catch(ClassNotFoundException e){
    out.println("<hr>" + e.getMessage() + "<br>");
} catch(SQLException e){
    out.println("<hr>" + e.getMessage() + "<br>");
} finally {
    // if (stmt != null) {
    //     stmt.close();
    // }
    // if (conn != null) {
    //     conn.close();
    // }
}

%>

<!-- <!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <title>Flughafen LRY</title>
    </head>

    <body>
        <h1>Halöle</h1>
        <%
            out.println("Hello World!<hr>");
        %>
    </body>

</html> -->
