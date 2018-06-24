<jsp:include page="../header.jsp"></jsp:include>

<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@ page import="db_engine.DatabaseEngine"%>

<h1>Add Apartment</h1>
<form method="get" name="AppForm" action="">
	<table class="table table-hover">
		<tr>
			<td>Apartment Number</td>
			<td><input type="number" class="form-control" name="AppNo" min=0
				required="required"></td>
		</tr>
		<tr>
			<td>Plot Number</td>
			<td><input type="number" class="form-control" name="PlotNo"
				required readonly> <input type="button" value="Show Plots"
				class="btn btn-success"
				onclick="window.open('../plot/list.jsp','','height=400,width=400'); return false;"></td>
			<td></td>
		</tr>
		<tr>
			<td>Name</td>
			<td><input type="text" class="form-control" name="Name"
				required="required"></td>
		</tr>
		<tr>
			<td>Address</td>
			<td><input type="text" class="form-control" name="Address"
				required="required"></td>
		</tr>
		<tr>
			<td>Number of Flats</td>
			<td><input type="number" class="form-control" name="NoFlats"
				min=1 required="required"></td>
		</tr>
		<tr>
			<td align="right"><input type="submit" Value="Save"
				class="btn btn-primary"></td>
			<td><input type="reset" Value="Clear" class="btn btn-danger"></td>
		</tr>
	</table>

</form>

<%
	int AppNo = 0, NoFlats = 0, PlotNo = 0;
	String sAppNo, sNoFlats, sPlotNo;
	String Name = "", Address = "";

	sAppNo = request.getParameter("AppNo");
	sPlotNo = request.getParameter("PlotNo");
	sNoFlats = request.getParameter("NoFlats");
	Name = request.getParameter("Name");
	Address = request.getParameter("Address");
		
	if (sAppNo != null) {
%>


<%
	AppNo = Integer.parseInt(sAppNo);
		PlotNo = Integer.parseInt(sPlotNo);
		NoFlats = Integer.parseInt(sNoFlats);

		DatabaseEngine de = new DatabaseEngine((
				"Insert into AppartmentMaster values (" + AppNo + ","
						+ PlotNo + ",\'" + Name + "\',\'" + Address
						+ "\'," + NoFlats + ")"));

		if (de.getRowAffected() >= 1)
			out.print("<H3 align=center>Appartment details added successfully</H3>");
		else
			out.print("<H3 align=center>Error.</H3>");

	}
%>



<jsp:include page="../footer.jsp"></jsp:include>