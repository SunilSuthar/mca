<jsp:include page="../header.jsp"></jsp:include>
<%@page import="db_engine.DatabaseEngine"%>
<%@ page session="true"%>
<%@page import="java.sql.ResultSet"%>

<%!float Balance=0; %>
<form action="" method="get">
	<h3>Due Payments</h3>
	<TABLE class="table table-hover">
		<TR>
			<td>Select to Pay</td>
			<Td>Plot Number</td>
			<td>Sale Value</td>
			<td>Sold On</td>
			<td>Sold To</td>
			<td>Advance</td>
			<td>Balance</td>
		</TR>
		<%
			ResultSet rs = new DatabaseEngine(
					"Select * from SalesMaster where Not (Balance=0) order by PlotNo")
					.getResultSet();

			while (rs.next()) {
				int PlotNum = rs.getInt(1);
				float SaleValue = rs.getFloat(2);
				String SalesDate = rs.getString(3);
				String SoldTo = rs.getString(4);
				float Advance = rs.getFloat(5);
				Balance = rs.getFloat(6);
		%>
		<TR>
			<td><Input type="Radio" Name="plotno" value=<%=PlotNum%> /></td>
			<td><%=PlotNum%></td>
			<td><%=SaleValue%></td>
			<td><%=((SalesDate.length() < 10) ? SalesDate : SalesDate
						.substring(0, 10))%></td>
			<td><%=SoldTo%></td>
			<td><%=Advance%></td>
			<td><%=Balance%></td>
		</TR>
		<%
			}
		%>
	</TABLE>
	<input type="submit" class="btn btn-primary" Value="Pay Now !">
</form>

<%
	if(request.getParameter("plotno")!=null)
	{	
%>
<script>
		var amount=prompt("Enter Amount to Be Paid", 0);
		window.location.assign("paynow.jsp?amount="+amount+"&plotno="+ <%=request.getParameter("plotno")%>+"&curbalance="+<%=Balance%> );
	</script>
<%		
	}
%>
<jsp:include page="../footer.jsp"></jsp:include>