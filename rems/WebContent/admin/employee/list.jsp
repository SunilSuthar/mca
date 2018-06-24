<jsp:include page="../header.jsp"></jsp:include>

<%@page import="db_engine.DatabaseEngine"%>
<%@page import="java.sql.ResultSet"%>

<script>
<!--
	function edit_it(lbl) {
		if (confirm("Do you really want to edit?") == true) {
			var emp = lbl.innerHTML;
			window.location.assign("edit.jsp?txtEmpNo=" + emp);
		}
	}
//-->
</script>

<%
	ResultSet rs = new DatabaseEngine("SELECT * FROM empmaster")
	.getResultSet();
%>

<P align=right>
	<button type="button" class="btn btn-info"
		onclick="javascipt:window.print()">
		<span class="glyphicon glyphicon-print"></span> Print
	</button>
</P>


<h1>Employee List</h1>
<table class="table table-hover">
	<TR>
		<TH>Name</TH>
		<TH>Employee Number</TH>
		<TH>Email</TH>
		<TH>Location</TH>
		<TH>Joining Date</TH>
		<TH>Role</TH>
		<TH>Qualification</TH>
		<TH>Edit</TH>
		<TH>Delete</TH>
	</TR>
	<%
		if (rs != null) {
		while (rs.next()) {
			out.print("<tr>");

			out.print("<td>" + rs.getString(1) + "</td>");
			out.print("<td>" + rs.getString(2) + "</td>");
			out.print("<td>" + rs.getString(3) + "</td>");
			out.print("<td>" + rs.getString(4) + "</td>");
			out.print("<td>" + rs.getString(5) + "</td>");
			out.print("<td>" + rs.getString(6) + "</td>");
			out.print("<td>" + rs.getString(7) + "</td>");
			
			out.print("<td ><a href=edit.jsp?txtEmpNo="
					+ rs.getString(2)
					+ " ><input type='button' class='btn btn-primary' value='EDIT' /> </a></td>");
					
			
			out.print("<td ><a href=delete.jsp?emp="
					+ rs.getString(2)
					+ " ><input type='button' class='btn btn-danger' value='DELETE' /> </a></td>");
			out.print("<tr>");
		}

			}
	%>
</table>
<jsp:include page="../footer.jsp"></jsp:include>