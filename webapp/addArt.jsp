<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%
String email = (String) session.getAttribute("email");

out.print(email);

if (email == null) {
	response.sendRedirect("log.jsp");

}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Artwork</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
            display: flex;
        }
        .sidebar {
            background-color: #0056b3;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
            padding-top: 20px;
        }
        .sidebar a {
            color: white;
            padding: 15px;
            text-decoration: none;
            display: block;
            font-size: 16px;
        }
        .sidebar a:hover {
            background-color: #004085;
        }
        .main-content {
            margin-left: 260px;
            padding: 20px;
            flex-grow: 1;
        }
        .content-wrapper {
            padding-bottom: 70px; /* Space for footer */
        }
        footer {
            background-color: #0056b3;
            color: white;
            padding: 10px;
            text-align: center;
            position: fixed;
            bottom: 0;
            width: 100%;
        }
    </style>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar">
    <h2 class="text-center py-4">Artevo Admin</h2>
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="artistManage.jsp">Artist Management</a>
    <a href="artworkManage.jsp">Artwork Management</a>
    <a href="orderManage.jsp">Order Management</a>
    <a href="logout.jsp">Logout</a>
</div>

<!-- Main Content -->
<div class="main-content">
    <!-- Top Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin Dashboard</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <h5>Artwork Management</h5>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="content-wrapper">
        <h2>Add New Artwork</h2>
        <p>Fill out the form below to add a new piece of art to the gallery.</p>

        <!-- Add Artwork Form -->
       <!--  <form action="artAction.jsp" method="post" enctype="multipart/form-data">
            Artwork Title
            <div class="mb-3">
                <label for="art-title" class="form-label">Artwork Title</label>
                <input type="text" class="form-control" id="art-title" name="art-title" required>
            </div>

            Artist Name
            <div class="mb-3">
                <label for="artist-name" class="form-label">Artist Name</label>
                <input type="text" class="form-control" id="artist-name" name="artist-name" required>
            </div>

            Genre
            <div class="mb-3">
                <label for="art-genre" class="form-label">Genre</label>
                <select class="form-control" id="art-genre" name="art-genre" required>
                    <option value="">Select Genre</option>
                    <option value="Wall Painting">Wall Painting</option>
                    <option value="Canvas">Canvas</option>
                    <option value="Portraits">Portraits</option>
                </select>
            </div>


            Price
            <div class="mb-3">
                <label for="art-price" class="form-label">Price (Rs.)</label>
                <input type="number" class="form-control" id="art-price" name="art-price" required>
            </div>

            Artwork Image
            <div class="mb-3">
                <label for="art-image" class="form-label">Upload Image</label>
                <input type="file" class="form-control" id="art-image" name="art-image" accept="image/*" required>
            </div>

            Submit Button
            <button type="submit" class="btn btn-primary">Add Artwork</button><br><br>
        </form> -->
        
        <!-- Add Artwork Form -->
<form action="artAction.jsp" method="post" enctype="multipart/form-data">
    <!-- Artwork Title -->
    <div class="mb-3">
        <label for="art-title" class="form-label">Artwork Title</label>
        <input type="text" class="form-control" id="art-title" name="art-title">
    </div>

    <!-- Artist Name -->
    <div class="mb-3">
        <label for="artist-name" class="form-label">Artist Name</label>
        <input type="text" class="form-control" id="artist-name" name="artist-name">
    </div>

    <!-- Genre -->
    <div class="mb-3">
        <label for="art-genre" class="form-label">Genre</label>
        <select class="form-control" id="art-genre" name="art-genre">
            <option value="">Select Genre</option>
            <option value="Wall Painting">Wall Painting</option>
            <option value="Canvas">Canvas</option>
            <option value="Portraits">Portraits</option>
        </select>
    </div>

    <!-- Price -->
    <div class="mb-3">
        <label for="art-price" class="form-label">Price (Rs.)</label>
        <input type="text" class="form-control" id="art-price" name="art-price" 	required>
    </div>

    <!-- Artwork Image -->
    <div class="mb-3">
        <label for="art-image" class="form-label">Upload Image</label>
        <input type="file" class="form-control" id="art-image" name="art-image" accept="image/*">
    </div>

    <!-- Submit Button -->
    <button type="submit" class="btn btn-primary">Add Artwork</button><br><br>
</form>
        
        
    </div>
</div>
<div style="height: 400px"></div>
<!-- Footer -->
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p><a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a></p>
</footer>

<!-- Bootstrap JS & Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
