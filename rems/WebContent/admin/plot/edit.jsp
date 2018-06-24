<jsp:include page="../header.jsp"></jsp:include>

<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<%@ page import="db_engine.DatabaseEngine"%>


<SCRIPT>
<!--
	function computeTotal() {
		var FrmObj = document.EPlotForm;
		var CostSqYard = FrmObj.CostSqYard.value;
		var Extent = FrmObj.Extent.value;
		var OtherExp = FrmObj.OtherExp.value;
		var TotalCost = (CostSqYard * Extent) + parseInt(OtherExp);
		FrmObj.TotalCost.value = TotalCost;
	}
//-->
</SCRIPT>
<%
	int PlotNum = 0, OtherExp = 0, RoadNum = 0, SurNum = 0, Extent = 0, CostSqYard = 0, TotalCost = 0;
	String sPlotNum = "", sOtherExp = "", sRoadNum = "", sSurNum = "", sExtent = "", sCostSqYard = "";
	String Boundaries = "", Facing = "", Status = "";
	int noRows = 0;

	// Retrieving data from html page
	sPlotNum = request.getParameter("PlotNum");
	PlotNum = Integer.parseInt(sPlotNum);

	ResultSet rs = new DatabaseEngine(
			"Select * from PlotDetails where PlotNo = " + PlotNum)
			.getResultSet();

	if (rs != null) {
		if (rs.next()) {
			PlotNum = rs.getInt(1);
			RoadNum = rs.getInt(2);
			SurNum = rs.getInt(3);
			Extent = rs.getInt(4);
			CostSqYard = rs.getInt(5);
			OtherExp = rs.getInt(6);
			Boundaries = rs.getString(7);
			Status = rs.getString(8);
			Facing = rs.getString(9);
			TotalCost = ((CostSqYard * Extent) + OtherExp);
%>


<FORM METHOD=POST ACTION="" NAME="EPlotForm">
	<h3>Edit Plot Information</h3>

	<TABLE class="table table-hover">
		<TR>
			<TH>Plot Number</TH>
			<td><input type="number" class="form-control" name="PlotNum1"
				min=0 required DISABLED value="<%=PlotNum%>"> <input
				type="hidden" class="form-control" name="PlotNum"
				value="<%=PlotNum%>"></td>
		</TR>
		<TR>
			<TH>Road Number</TH>
			<td><input type="number" class="form-control" name="RoadNum"
				min=0 required value="<%=RoadNum%>"></td>
		</TR>
		<TR>
			<TH>Survey Number</TH>
			<td><input type="number" class="form-control" name="SurNum"
				min=0 required value="<%=SurNum%>"></td>
		</TR>
		<TR>
			<TH>Extent</TH>
			<td><input type="number" class="form-control" name="Extent"
				min=0 required value="<%=Extent%>" onchange="computeTotal()"></td>
		</TR>
		<TR>
			<TH>Cost</TH>
			<td><input type="number" class="form-control" name="CostSqYard"
				min=0 required value="<%=CostSqYard%>" onchange="computeTotal()">per
				Sq yard</td>
		</TR>
		<TR>
			<TH>Other Expences</TH>
			<td><input type="number" class="form-control" name="OtherExp"
				min=0 required value="<%=OtherExp%>" onchange="computeTotal()"></td>
		</TR>
		<TR>
			<TH>Boundaries</TH>
			<td><input type="number" class="form-control" name="Boundaries"
				min=0 required value="<%=Boundaries%>"></td>
		</TR>
		<TR>
			<TH>Facing</TH>
			<td><select class="form-control" name="Facing" required>
					<option disabled value="<%=Facing%>"><%=Facing%></option>
					<option value="North">North</option>
					<option value="South">South</option>
					<option value="East">East</option>
					<option value="West">West</option>
			</select></td>
		</TR>
		<TR>
			<TH>Status</TH>
			<td><select class="form-control" name="Status">
					<option disabled value="<%=Status%>"><%=Status%></option>
					<option value="Vacant">Vacant</option>
					<option value="Reserved">Reserved</option>
					<option value="Sold">Sold</option>
			</select></td>
		</TR>
		<TR>
			<TH>Total Cost</TH>
			<td><input type="number" class="form-control" name="TotalCost"
				min=0 required DISABLED value=<%=TotalCost%>></td>
		</TR>

		<TR>
			<td align="right"><input type="submit" class="btn btn-primary"
				name=update VALUE="Update"></td>
			<td><input type="button" id="back" class="btn btn-danger"
				value="Go Back" onclick="javascript:history.back();"></td>
		</TR>
		<%
			noRows++;
				} else {
					out.print("<tr><th align=Center>Plot does not exists</th></tr>");
				}
			}
		%>
	</TABLE>
</FORM>


<%
	if (request.getParameter("update") != null) {

		sPlotNum = request.getParameter("PlotNum");
		sRoadNum = request.getParameter("RoadNum");
		sOtherExp = request.getParameter("OtherExp");
		sSurNum = request.getParameter("SurNum");
		sExtent = request.getParameter("Extent");
		sCostSqYard = request.getParameter("CostSqYard");
		Boundaries = request.getParameter("Boundaries");
		Status = request.getParameter("Status");
		Facing = request.getParameter("Facing");

		PlotNum = Integer.parseInt(sPlotNum);
		RoadNum = Integer.parseInt(sRoadNum);
		OtherExp = Integer.parseInt(sOtherExp);
		SurNum = Integer.parseInt(sSurNum);
		Extent = Integer.parseInt(sExtent);
		CostSqYard = Integer.parseInt(sCostSqYard);

		Integer Res = new DatabaseEngine(
				"Update PlotDetails set RoadNo=" + RoadNum
						+ ",SurveyNo=" + SurNum + ",Extent=" + Extent
						+ ",SqYardCost=" + CostSqYard
						+ ",OtherExpences=" + OtherExp
						+ ",Boundaries=\'" + Boundaries
						+ "\',Status=\'" + Status + "\',Facing=\'"
						+ Facing + "\' where PlotNo =" + PlotNum)
				.getRowAffected();
		if(Res>=1)
		{
			response.sendRedirect("../apartment/list.jsp");
		}
	}
%>

<jsp:include page="../footer.jsp"></jsp:include>