<%@ page import="java.util.List" %>
<%@ page import="bean.ArtistBean" %>
<%@ page import="dao.ArtistDao" %>
<%@ page import="java.sql.*" %> 
 <%
    ArtistDao artistDao = new ArtistDao();
    List<ArtistBean> artist = null;

    try {
        artist = artistDao.getAllUsers(); // Fetch all artists from the database
    } catch (SQLException e) {
        e.printStackTrace();
        out.print("<p style='color: red;'>Error fetching artists: " + e.getMessage() + "</p>");
    }
%>
 