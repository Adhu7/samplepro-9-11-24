<%-- <%-- <%@page import="dao.ArtDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*, bean.ArtBean" %>

<%
    // Get form data from request
    String title = request.getParameter("art-title");
    String artistName = request.getParameter("artist-name");
    String genre = request.getParameter("art-genre");
    double price = Double.parseDouble(request.getParameter("art-price"));
    Part imagePart = request.getPart("art-image");  // Getting the image file

    // Assuming image is being saved on the server or its file name is returned
    String imageFileName = "images/" + imagePart.getSubmittedFileName();  // You might need to save the image on the server

   
    ArtBean artwork = new ArtBean();
    artwork.setArtTitle(title);
    artwork.setArtistName(artistName);
    artwork.setArtGenre(genre);
    artwork.setArtPrice(price);
    artwork.setUploadImage(imagePart);

)
    ArtDao dao = new ArtDao();
    dao.addArtwork(artwork);

    // Redirect to a confirmation or listing page
    response.sendRedirect("artworkManage.jsp?success=true");
%>

<%@ page import="dao.ArtDao" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*, bean.ArtBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%
    // Get form data from request
    String title = request.getParameter("art-title");
    String artistName = request.getParameter("artist-name");
    String genre = request.getParameter("art-genre");
    
    
    String priceString = request.getParameter("art-price");  
    double price = 0.0;  // Initialize price

    // Validate price to avoid NumberFormatException
    if (priceString != null && !priceString.isEmpty()) {
        try {
            price = Double.parseDouble(priceString);  // Parse the price string to a double
        } catch (NumberFormatException e) {
            // If parsing fails, set a default value or handle the error
            out.println("Invalid price format. Please enter a valid number.");
            return;
        }
    } else {
        out.println("Price cannot be empty.");
        return;
    }

    // Getting the image file from the form
    Part imagePart = request.getPart("art-image");  // Getting the image file

    // Extracting the file name from the Content-Disposition header
    String contentDisposition = imagePart.getHeader("Content-Disposition");
    String imageFileName = null;

    if (contentDisposition != null && contentDisposition.contains("filename=")) {
        // Extract the file name from the Content-Disposition header
        imageFileName = contentDisposition.substring(contentDisposition.lastIndexOf("filename=") + 10, contentDisposition.length() - 1);
    }

    // Ensure the image has a valid file name (handle cases where no file is uploaded)
    if (imageFileName != null && !imageFileName.isEmpty()) {
        // Generate a unique file name to prevent overwriting
        String uniqueImageFileName = System.currentTimeMillis() + "_" + imageFileName;
        
        // Define where to save the image (server-side path)
        String savePath = application.getRealPath("/") + "images/" + uniqueImageFileName; 
        
        // Save the image to the server
        imagePart.write(savePath);
        
        // Set the relative image path to store in the database
        imageFileName = "images/" + uniqueImageFileName;
    } else {
        // If no file is uploaded, handle the case (e.g., use a default image)
        imageFileName = "images/default.jpg";  // Example: use a default image
    }

    // Create an ArtBean object and set its properties
    ArtBean artwork = new ArtBean();
    artwork.setArtTitle(title);
    artwork.setArtistName(artistName);
    artwork.setArtGenre(genre);
    artwork.setArtPrice(price);
    artwork.setUploadImage(imageFileName);  // Store the relative path in the database

    // Insert the artwork into the database
    ArtDao dao = new ArtDao();
    boolean success = dao.addArtwork(artwork);  // Call the addArtwork method

    // Redirect to a confirmation or listing page
    if(success) {
        response.sendRedirect("artworkManage.jsp?success=true");
    } else {
        response.sendRedirect("artworkManage.jsp?error=true");
    }
%>
 --%> 
<%@ page import="dao.ArtDao" %>
<%@ page import="java.io.*, javax.servlet.*, javax.servlet.http.*, java.util.*, bean.ArtBean" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<%
    // Get form data from the request
    String title = request.getParameter("art-title");
    String artistName = request.getParameter("artist-name");
    String genre = request.getParameter("art-genre");

    // Get the price and trim any excess whitespace
    String priceString = request.getParameter("art-price");
    priceString = (priceString != null) ? priceString.trim() : "";  // Trim to avoid whitespace issues

    // Initialize price as 0.0
    double price = 0.0;
    
    // Validate price
    if (priceString.isEmpty()) {
        out.println("Price cannot be empty.");
        return;
    }
    
    try {
        price = Double.parseDouble(priceString);  // Try to parse the price as a double
    } catch (NumberFormatException e) {
        out.println("Invalid price format. Please enter a valid number.");
        return;
    }

    // Getting the image file from the form
    Part imagePart = request.getPart("art-image");  // Getting the image file

    // Extracting the file name from the Content-Disposition header
    String contentDisposition = imagePart.getHeader("Content-Disposition");
    String imageFileName = null;

    if (contentDisposition != null && contentDisposition.contains("filename=")) {
        imageFileName = contentDisposition.substring(contentDisposition.lastIndexOf("filename=") + 10, contentDisposition.length() - 1);
    }

    // If an image file is uploaded, save it on the server
    if (imageFileName != null && !imageFileName.isEmpty()) {
        // Generate a unique file name for the image
        String uniqueImageFileName = System.currentTimeMillis() + "_" + imageFileName;

        // Define the save path
        String savePath = application.getRealPath("/") + "images/" + uniqueImageFileName;

        // Save the image to the server
        imagePart.write(savePath);

        // Set the relative image path for the database
        imageFileName = "images/" + uniqueImageFileName;
    } else {
        imageFileName = "images/default.jpg";  // Use a default image if no image is uploaded
    }

    // Create the ArtBean object and set its properties
    ArtBean artwork = new ArtBean();
    artwork.setArtTitle(title);
    artwork.setArtistName(artistName);
    artwork.setArtGenre(genre);
    artwork.setArtPrice(price);
    artwork.setUploadImage(imageFileName);

    // Call the ArtDao to insert the artwork into the database
    ArtDao dao = new ArtDao();
    boolean success = dao.addArtwork(artwork);  // Call the addArtwork method

    // Redirect to a confirmation page
    if (success) {
        response.sendRedirect("artworkManage.jsp?success=true");
    } else {
        response.sendRedirect("artworkManage.jsp?error=true");
    }
%>
