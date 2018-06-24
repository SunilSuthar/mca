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


<FORM METHOD=POST ACTION="" NAME="RPlotsForm">

	<h1>All Plots</h1>

	<TABLE class="table table-hover">
		<TR>
			<TH>Plot Number</TH>
			<TH>Road Number</TH>
			<TH>Survey Number</TH>
			<TH>Extent</TH>
			<TH>Cost per Sq yard</TH>
			<TH>Other Expenses</TH>
			<TH>Boundaries</TH>
			<TH>Status</TH>
			<TH>Facing</TH>
			<TH>Total Cost</TH>
			<TH>Delete</TH>
		</TR>
		<%
			int PlotNum = 0, OtherExp = 0, RoadNum = 0, SurNum = 0, Extent = 0, CostSqYard = 0;
			String sPlotNum = "", sOtherExp = "", sRoadNum = "", sSurNum = "", sExtent = "", sCostSqYard = "";
			String Boundaries = "", Facing = "", Status = "";
			int noRows = 0;

			ResultSet rs = new DatabaseEngine(
					"Select * from PlotDetails order by PlotNo")
					.getResultSet();

			if (rs != null) {
				while (rs.next()) {
					PlotNum = rs.getInt(1);
					RoadNum = rs.getInt(2);
					SurNum = rs.getInt(3);
					Extent = rs.getInt(4);
					CostSqYard = rs.getInt(5);
					OtherExp = rs.getInt(6);
					Boundaries = rs.getString(7);
					Status = rs.getString(8);
					Facing = rs.getString(9);
		%>
		<TR>
			<td><%=PlotNum%></td>
			<td><%=RoadNum%></td>
			<td><%=SurNum%></td>
			<td><%=Extent%></td>
			<td><%=CostSqYard%></td>
			<td><%=OtherExp%></td>
			<td><%=Boundaries%></td>
			<td><%=Status%></td>
			<td><%=Facing%></td>
			<td><%=((CostSqYard * Extent) + OtherExp)%></td>
			<TD><a href="../plot/delete.jsp?plot_no=<%=PlotNum%>"><input
					type="button" class="btn btn-danger" value="Delete Plot"></a></TD>
		</TR>
		<%
			}
			}

			else {
				out.print("<div class='alert alert-danger'> <strong>Empty !</strong> No Record Found</div>");
			}
		%>
	</TABLE>
</FORM>
<jsp:include page="../footer.jsp"></jsp:include>