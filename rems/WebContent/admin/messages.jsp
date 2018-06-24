<jsp:include page="header.jsp"></jsp:include>

<%@page import="db_engine.DatabaseEngine"%>
<%@page import="java.sql.ResultSet"%>

<%
	ResultSet rs = new DatabaseEngine("SELECT * FROM messages ORDER BY time desc;")
			.getResultSet();
%>

<P align=right>
	<button type="button" class="btn btn-info"
		onclick="javascipt:window.print()">
		<span class="glyphicon glyphicon-print"></span> Print
	</button>
</P>

<h1>Messages from users</h1>
<h4>Note: Newer Messages come first</h4>
<table class="table table-hover">
	<TR>

		<TH>Message ID</TH>
		<TH>Name</TH>
		<TH>Email</TH>
		<TH>Message</TH>
		<TH>Received On</TH>
		<TH>Reply</TH>

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
				out.print("<td><a href='mailto:"+rs.getString(3)+ "' ><input type=button value=Reply class='btn btn-primary' /></a></td>");				
				
			}

		}
	%>
</table>


<jsp:include page="footer.jsp"></jsp:include>