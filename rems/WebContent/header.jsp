
<style>
.bg {
	background-image: url("<%=request.getContextPath()%>/images/div_bg.png");
}
</style>


<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<div
	style="background-image: url('<%=request.getContextPath()%>/images/header.png');height: 200px; background-repeat: round;">
	<div class="container">
		<div class="page-header" style="padding-top: 75px;">
			<h1
				style="text-shadow: 0px 0px 15px black; text-align: right; color: white;">
				<b>REAL ESTATE MANAGEMENT SYSTEM</b>
			</h1>
		</div>
	</div>
</div>



<nav class="navbar navbar-inverse"
	style="box-shadow: 5px 5px 15px black;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="<%=request.getContextPath()%>">Real
				Estate Management System</a>
		</div>

		<ul class="nav navbar-nav navbar-right" id="admin_link">
			<li><a href="<%=request.getContextPath()%>/admin/"><span
					class="glyphicon glyphicon-user"></span> Admin Panel</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<li>
				<%
					if (request.getRemoteUser() != null) {
						out.print("<a href='admin/logout.jsp'> <span class='glyphicon glyphicon-log-in'></span> Logout</a>");
					}
				%>
			</li>

		</ul>
	</div>

</nav>
