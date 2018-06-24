<jsp:include page="../header.jsp"></jsp:include>
<%@page import="db_engine.DatabaseEngine"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>


<P align=right>
	<button type="button" class="btn btn-info"
		onclick="javascipt:window.print()">
		<span class="glyphicon glyphicon-print"></span> Print
	</button>
</P>

<h3>Payment History</h3>

<TABLE class="table table-hover">
	<TR>
		<TH>Plot Number</TH>
		<TH>Amount</TH>
		<TH>Payment Date</TH>
	</TR>
	<%
		int PlotNum = 0;
		float Amount = 0;
		Date PaymentDate;

		ResultSet rs = new DatabaseEngine(
				"Select * from payment_history order by PlotNo")
				.getResultSet();

		if (rs != null) {
			while (rs.next()) {
				PlotNum = rs.getInt(1);
				Amount = rs.getFloat(2);
				PaymentDate=rs.getDate(3);
	%>
	<TR>
		<TD><%=PlotNum%></TD>
		<TD><%=Amount%></TD>
		<TD><%=PaymentDate%></TD>
	</TR>
	<%
		}
		} else {
			out.print("No payment history");
		}
	%>
</TABLE>
<jsp:include page="../footer.jsp"></jsp:include>
