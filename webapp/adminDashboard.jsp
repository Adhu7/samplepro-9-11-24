<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
//httpsession.setAttribute("user", user);
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
<title>Admin</title>
<!-- Link Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
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

.btn-logout {
	background-color: #0056b3;
	color: white;
}

.card-title {
	font-size: 18px;
	font-weight: bold;
}

.card-body {
	font-size: 16px;
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

footer a {
	color: white;
	text-decoration: none;
}
</style>
</head>
<body>
	<!-- // checking the working of session -->
	<%-- <%
    String userName = (String) session.getAttribute("userEmail");

    if (userName != null) {
%>
        <h1>Welcome, <%= userName %>!</h1>
<%
    } else {
%>
        <h1>Welcome, Guest!</h1>
<%
    }
%> --%>
	<!-- Sidebar -->
	<div class="sidebar">
		<h2 class="text-center py-4">Artevo Admin</h2>
		<a href="adminDashboard.jsp">Dashboard</a> <a href="artistManage.jsp">Artist
			Management</a> <a href="artworkManage.jsp">Artwork Management</a> <a
			href="orderManage.jsp">Order Management</a> <a href="logout.jsp">Logout</a>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<!-- Top Navbar -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">Admin Dashboard</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item">
							<h5>Dashboard</h5>
						</li>
						<!-- <li class="nav-item">
                        <a class="nav-link" href="admin-login.jsp">Logout</a>
                    </li> -->
					</ul>
				</div>
			</div>
		</nav>

		<!-- Dashboard Overview -->
		<h2>
			Welcome,
			<%=email%></h2>
		<p>Manage users, artists, artworks, and orders from here.</p>

		<!-- Counts Overview Section -->
		<div class="row mt-5">
			<!-- User Count -->
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Total Users</h5>
						<p class="card-text" id="user-count">120</p>
						<!-- This will be dynamically updated from the database -->
					</div>
				</div>
			</div>
			<!-- Artist Count -->
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Total Artists</h5>
						<p class="card-text" id="artist-count">45</p>
						<!-- This will be dynamically updated -->
					</div>
				</div>
			</div>
			<!-- Artwork Count -->
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Total Artworks</h5>
						<p class="card-text" id="artwork-count">350</p>
						<!-- This will be dynamically updated -->
					</div>
				</div>
			</div>
			<!-- Order Count -->
			<div class="col-md-3">
				<div class="card">
					<div class="card-body text-center">
						<h5 class="card-title">Total Orders</h5>
						<p class="card-text" id="order-count">75</p>
						<!-- This will be dynamically updated -->
					</div>
				</div>
			</div>
		</div>

		<!-- Example Graph or Chart -->
		<div class="row mt-5">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h5 class="card-title">Sales Overview (Graph)</h5>
					</div>
					<div class="card-body">
						<!-- Insert your chart here (e.g., using Chart.js) -->
						<canvas id="salesChart" width="400" height="200"></canvas>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer>
		<p>&copy; 2024 Artevo. All Rights Reserved.</p>
		<p>
			<a href="terms.jsp">Terms & Conditions</a> | <a href="privacy.jsp">Privacy
				Policy</a>
		</p>
	</footer>

	<!-- Include Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

	<!-- Example of dynamically fetching the data (Assuming you have the data in the session or database) -->
	<script>
		// Sample data: Replace with real dynamic data from the backend (database or API)
		document.getElementById('user-count').textContent = 120; // Example count for users
		document.getElementById('artist-count').textContent = 45; // Example count for artists
		document.getElementById('artwork-count').textContent = 350; // Example count for artworks
		document.getElementById('order-count').textContent = 75; // Example count for orders

		// Optionally: Insert a dynamic chart with real-time data using Chart.js here.
	</script>

</body>
</html>
