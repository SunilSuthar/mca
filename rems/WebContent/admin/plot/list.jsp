<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ page session="true"%>
<%@page import="java.sql.ResultSet"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@page import="db_engine.DatabaseEngine"%>

<%
	ResultSet rs;
%>

<script>
	function doTheSubmit(txt) {
		window.opener.AppForm.PlotNo.value = txt;
		window.close();
		AppForm.submit();
	}
</script>

<P align=right>
	<button type="button" class="btn btn-info"
		onclick="javascipt:window.print()">
		<span class="glyphicon glyphicon-print"></span> Print
	</button>
</P>


<h2 align=center>Plots List</h2>
<%
	String orderby = "PlotNo";
	String PlotNo, SurveyNo, Status;
	int PhoneNo;
	orderby = ((String) request.getParameter("orderby") == null) ? "PlotNo"
			: (String) request.getParameter("orderby");
	DatabaseEngine de = new DatabaseEngine(
			"SELECT PlotNo,SurveyNo,Status FROM PlotDetails  order by "
					+ orderby);
	rs = de.getResultSet();
%>


<%
	if (rs != null) {
%>

<table class="table table-hover">

	<tr>
		<th><a class=title href="list.jsp?orderby=PlotNo">PlotNo</a></th>
		<th><a class=title href="list.jsp?orderby=SurveyNo">SurveyNo</a></th>
		<th><a class=title href="list.jsp?orderby=Status">Status</a></th>
		<%
			int DisRow = 0;

				while (rs.next()) {
					PlotNo = rs.getString(1);
					SurveyNo = rs.getString(2);
					Status = rs.getString(3);
		%>
	
	<tr>
		<td><a href="#" onclick="doTheSubmit('<%=PlotNo%>')"><%=PlotNo%></a></td>
		<td><%=SurveyNo%></td>
		<td><%=Status%></td>
	</tr>
	<%
		}

			rs.close();
		} else {
			out.print("no record found");
		}
	%>
</table>
<div align="center">
	<a href="add.jsp"><input type="button" class="btn btn-primary"
		value="Add a Plot" /></a> <input type="button" Value="Close"
		class="btn btn-danger" onclick="javascript:window.close(); ">
</div>
<jsp:include page="../footer.jsp"></jsp:include>