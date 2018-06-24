<jsp:include page="../header.jsp"></jsp:include>

<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@ page import="db_engine.DatabaseEngine"%>

<P align=right>
	<button type="button" class="btn btn-info"
		onclick="javascipt:window.print()">
		<span class="glyphicon glyphicon-print"></span> Print
	</button>
</P>

<FORM METHOD=POST ACTION="" NAME="RPlotsForm">

	<h3>Consolidated report of Apartments</h3>

	<TABLE class="table table-hover">
		<TR>
			<TH>Appartment Number</TH>
			<TH>Plot Number</TH>
			<TH>Name</TH>
			<TH>Address</TH>
			<TH>Number of Flats</TH>
			<TH>Delete</TH>
		</TR>
		<%
			int Res = 0;
			int AppNo = 0, NoFlats = 0, PlotNo = 0;
			String Name = "", Address = "";
			int noRows = 0;

			ResultSet rs = new DatabaseEngine(
					"Select * from AppartmentMaster order by AppNo,PlotNo")
					.getResultSet();

			if (rs != null) {
				while (rs.next()) {
					AppNo = rs.getInt(1);
					PlotNo = rs.getInt(2);
					Name = rs.getString(3);
					Address = rs.getString(4);
					NoFlats = rs.getInt(5);
		%>
		<TR>
			<TD><%=AppNo%></TD>
			<TD><A HREF="../plot/edit.jsp?PlotNum=<%=PlotNo%>"><button
						type="button" class="btn btn-primary" style="width: 100%;"><%=PlotNo%></button></A></TD>
			<TD><%=Name%></TD>
			<TD><%=Address%></TD>
			<TD><%=NoFlats%></TD>
			<TD><a href="delete.jsp?apartment_no=<%=AppNo%>"><input
					type="button" class="btn btn-danger" value="Delete Apartment"></a></TD>
		</TR>
		<%
			}

			} else {
				out.print("<div class='alert alert-danger'> <strong>Empty !</strong> No Record Found</div>");
			}
		%>
	</TABLE>

</FORM>
<jsp:include page="../footer.jsp"></jsp:include>