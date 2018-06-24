<%@page import="java.sql.ResultSet"%>
<%@page import="db_engine.DatabaseEngine"%>

<%
	ResultSet rs = new DatabaseEngine("SELECT COUNT('id')FROM messages")
			.getResultSet();
	rs.next();
%>

<a href="<%=request.getContextPath()%>/admin/messages.jsp"> <span
	style="height: 50px; width: 50px; position: fixed; margin-top: 300px; right: 0px; background-image: url('<%=request.getContextPath()%>/images/msg.png'); background-repeat: round; z-index: 10;">
		<b style="font-size: 15; color: #000000b3;"><%=rs.getInt(1)%></b>
</span>
</a>


<a href="#"
	onclick="window.open('<%=request.getContextPath()%>/admin/plot/add.jsp','','height=400,width=400'); return false;"
	title="Add Plot"> <span
	style="height: 50px; width: 50px; position: fixed; bottom: 0px; right: 0px; background-image: url('<%=request.getContextPath()%>/images/plus_round.png'); background-repeat: round; z-index: 10;">
</span>
</a>

<style>
.bg {
	background-image: url("<%=request.getContextPath()%>/images/div_bg.png");
}
</style>

<%
	String contextPath = request.getContextPath();
%>
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
			<a class="navbar-brand" href="<%=contextPath%>/admin">ADMIN HOME</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Apartments <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<%=contextPath%>/admin/apartment/add.jsp">New
							Apartment</a></li>
					<li><a href="<%=contextPath%>/admin/apartment/list.jsp">View
							Apartment</a></li>
				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Payments <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<%=contextPath%>/admin/payment/pay.jsp">Make
							Payment</a></li>
					<li><a href="<%=contextPath%>/admin/payment/history.jsp">Payment
							History</a></li>
				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Creditors<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<%=contextPath%>/admin/creditors/list.jsp">Show
							Creditors List</a></li>
					<li><a
						href="<%=contextPath%>/admin/creditors/add_creditor.jsp">Add
							Creditor</a></li>
				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Employees <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<%=contextPath%>/admin/employee/add.jsp">Add
							Employee</a></li>
					<li><a href="<%=contextPath%>/admin/employee/list.jsp">View
							Employees</a></li>
				</ul></li>


			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" href="#">Plot Lists <span class="caret"></span></a>
				<ul class="dropdown-menu">
					<li><a href="<%=contextPath%>/admin/plot_lists/all_plots.jsp">All
							Plots</a></li>
					<li><a href="<%=contextPath%>/admin/plot_lists/sold_plots.jsp">Sold
							Plots</a></li>
					<li><a
						href="<%=contextPath%>/admin/plot_lists/reserved_plots.jsp">Reserved
							Plots</a></li>
					<li><a
						href="<%=contextPath%>/admin/plot_lists/vaccent_plots.jsp">Vacant
							Plots</a></li>
				</ul></li>

		</ul>


		<ul class="nav navbar-nav navbar-right" id="logout">
			<li><a href="<%=contextPath%>/admin/logout.jsp"><span
					class="glyphicon glyphicon-log-in"></span> Logout</a></li>
		</ul>
	</div>
</nav>

