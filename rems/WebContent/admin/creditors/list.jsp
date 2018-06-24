<%@page import="db_engine.DatabaseEngine"%>
<jsp:include page="../header.jsp"></jsp:include>

<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<P align=right>
	<button type="button" class="btn btn-info"
		onclick="javascipt:window.print()">
		<span class="glyphicon glyphicon-print"></span> Print
	</button>
</P>


<h1>Sales Book (Sundry Creditors)</h1>

<TABLE class="table table-hover">
	<TR>
		<TH>Plot Number</TH>
		<TH>Sale Value</TH>
		<TH>Sold On</TH>
		<TH>Sold To</TH>
		<TH>Advance</TH>
		<TH>Balance</TH>
	</TR>
	<%
		int PlotNum = 0;
		float SaleValue = 0, Advance = 0, Balance = 0;
		String SoldTo = "", SalesDate = "";
		int noRows = 0;

		ResultSet rs = new DatabaseEngine(
				"SELECT * from SalesMaster where NOT Balance = 0 order by PlotNo")
				.getResultSet();

		if (rs != null) {
			while (rs.next()) {
				PlotNum = rs.getInt(1);
				SaleValue = rs.getFloat(2);
				SalesDate = rs.getString(3);
				SoldTo = rs.getString(4);
				Advance = rs.getFloat(5);
				Balance = rs.getFloat(6);
	%>
	<TR>
		<td><%=PlotNum%></td>
		<td><%=SaleValue%></td>
		<td><%=((SalesDate.length() < 10) ? SalesDate
							: SalesDate.substring(0, 10))%></td>
		<td><%=SoldTo%></td>
		<td><%=Advance%></td>
		<td><%=Balance%></td>
	</TR>
	<%
		}

		} else {
			out.print("No creditors");
		}
	%>
</TABLE>


<jsp:include page="../footer.jsp"></jsp:include>