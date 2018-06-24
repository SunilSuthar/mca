<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%@ page import="db_engine.DatabaseEngine"%>


<form method=post name="PlotForm" action="">
	<h1 align="center">Add Plot</h1>
	<table class="table table-hover">
		<tr>
			<td><b>Plot Number</b></td>
			<td><input type="text" name="PlotNum" required
				class="form-control"></td>
		</tr>
		<tr>
			<td><b>Road Number</b></td>
			<td><input type="text" name="RoadNum" required
				class="form-control"></td>
		</tr>
		<tr>
			<td><b>Survey Number</b></td>
			<td><input type="text" name="SurNum" required
				class="form-control"></td>
		</tr>
		<tr>
			<td><b>Cost per Sq Yard</b></td>
			<td><input type="text" name="CostSqYard" required
				class="form-control"></td>
		</tr>
		<tr>
			<td><b>Other Expences</b></td>
			<td><input type="text" name="OtherExp" required
				class="form-control"></td>
		</tr>
		<tr>
			<td><b>Extent</b></td>
			<td><input type="text" name="Extent" required
				class="form-control"></td>
		</tr>
		<tr>
			<td><b>Boundaries</b></td>
			<td><input type="text" name="Boundaries" required
				class="form-control"></td>
		</tr>
		<tr>
			<td><b>Facing</b></td>
			<td><select name="Facing" required class="form-control">
					<option value="NA">----</option>
					<option value="East">East</option>
					<option value="West">West</option>
					<option value="North">North</option>
					<option value="South">South</option>
			</select></td>
		</tr>

		<tr>
			<td><b>Status</b></td>
			<td><select name="Status" required class="form-control">
					<option value="NA">----</option>
					<option value="Vacant">Vacant</option>
					<option value="Reserved">Reserved</option>
					<option value="Sold">Sold</option>
			</select></td>
		</tr>
		<tr>
			<td align="right"><input type="submit" Value="Save"
				class="btn btn-primary"></td>
			<td><input type="button" Value="Go Back" class="btn btn-danger"
				onclick="javascript:history.back(); "> <input type="button"
				Value="Close" class="btn btn-danger"
				onclick="javascript:window.close(); "></td>
		</tr>
	</table>
</form>



<%
	if (request.getParameter("PlotNum") != null) {

		int PlotNum = 0, OtherExp = 0, RoadNum = 0, SurNum = 0, Extent = 0, CostSqYard = 0;
		String sPlotNum = "", sOtherExp = "", sRoadNum = "", sSurNum = "", sExtent = "", sCostSqYard = "";
		String Boundaries = "", Facing = "", Status = "";
		int Res = 0;

		sPlotNum = request.getParameter("PlotNum");
		sRoadNum = request.getParameter("RoadNum");
		sOtherExp = request.getParameter("OtherExp");
		sSurNum = request.getParameter("SurNum");
		sExtent = request.getParameter("Extent");
		sCostSqYard = request.getParameter("CostSqYard");
		Boundaries = request.getParameter("Boundaries");
		Facing = request.getParameter("Facing");
		Status = request.getParameter("Status");

		PlotNum = Integer.parseInt(sPlotNum);
		RoadNum = Integer.parseInt(sRoadNum);
		OtherExp = Integer.parseInt(sOtherExp);
		SurNum = Integer.parseInt(sSurNum);
		Extent = Integer.parseInt(sExtent);
		CostSqYard = Integer.parseInt(sCostSqYard);

		Res = new DatabaseEngine("Insert into PlotDetails values ("
				+ PlotNum + "," + RoadNum + "," + SurNum + "," + Extent
				+ "," + CostSqYard + "," + OtherExp + ",\'"
				+ Boundaries + "\',\'" + Status + "\',\'" + Facing
				+ "\')").getRowAffected();
		if (Res == 1) {
			out.print("<script>alert('Plot Added Successfully');</script>");
		}

	}
%>
<jsp:include page="../footer.jsp"></jsp:include>