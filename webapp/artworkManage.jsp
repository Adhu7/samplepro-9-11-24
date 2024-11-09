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
    <title>Artwork Management</title>
    <!-- Include Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f6f9;
        }
        .sidebar {
            background-color: #0056b3;
            color: white;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            width: 250px;
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

    <!-- Artwork Management Section -->
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <h2>Manage Artworks</h2>
                <p>Manage all artworks, including adding, editing, and removing them. Categorize artworks by type, price, or artist.</p>

                <!-- Add Artwork Button -->
                <button class="btn btn-primary mb-3" data-bs-toggle="modal" data-bs-target="#addArtworkModal" onclick="window.location.href='addArt.jsp'">Add New Artwork</button>

                <!-- Artwork Table -->
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Artwork Title</th>
                            <th>Artist</th>
                            <th>Price</th>
                            <th>Category</th>
                            <!-- <th>Status</th> -->
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="artwork-list">
                        <!-- Sample Data, Replace with Real Data from DB -->
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <!-- <td><span class="badge bg-success">Available</span></td> -->
                            <td>
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtworkModal" onclick="editArtwork(1)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtwork(1)">Delete</button>
                            </td>
                        </tr>
                       <!--  <tr>
                            <td>2</td>
                            <td>Floral Painting</td>
                            <td>Raghavan</td>
                            <td>Rs.1000</td>
                            <td>Wall Painting</td>
                            
                            <td>
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtworkModal" onclick="editArtwork(2)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtwork(2)">Delete</button>
                            </td>
                        </tr> -->
                        <!-- <tr>
                            <td>2</td>
                            <td>Canvas of Goddess</td>
                            <td>Ravi Varma</td>
                            <td>Rs.2000</td>
                            <td>Canvas</td>
                            <td><span class="badge bg-warning">Pending</span></td>
                            <td>
                                <button class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#editArtworkModal" onclick="editArtwork(2)">Edit</button>
                                <button class="btn btn-danger btn-sm" onclick="deleteArtwork(2)">Delete</button>
                            </td>
                        </tr> -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 Artevo. All Rights Reserved.</p>
    <p><a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy Policy</a></p>
</footer>

<!-- Bootstrap JS & Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



</body>
</html>
