<jsp:include page="../header.jsp"></jsp:include>
<%@page import="db_engine.DatabaseEngine"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>
<script>
	function mydate(dt) {
		d = new Date(dt);
		dd = d.getDate();
		mm = d.getMonth() + 1;
		yyyy = d.getFullYear();
		document.getElementById("date_sale").value = yyyy + "-" + mm + "-" + dd;
	}
</script>

<h1>Sales Book (Add Creditor)</h1>

<FORM action="" method="post">

	<table class="table table-hover">

		<tr>
			<td>PlotNo</td>
			<td><input type="number" class="form-control" name="plot_no"
				min=1 required /></td>
		</tr>

		<tr>
			<td>SaleValue</td>
			<td><input type="number" class="form-control" name="sale_value"
				min=1 required /></td>
		</tr>

		<tr>
			<td>DateofSale</td>
			<td><input type="date" class="form-control"
				onblur="mydate(this.value);" required /> <input type="hidden"
				id="date_sale" value="" name="date_sale" /></td>
		</tr>


		<tr>
			<td>SoldTo</td>
			<td><input type="text" class="form-control" name="sold_to"
				required /></td>
		</tr>

		<tr>
			<td>Advance</td>
			<td><input type="number" class="form-control" name="advance"
				min=0 required /></td>
		</tr>

		<tr>
			<td>Balance</td>
			<td><input type="number" class="form-control" name="balance"
				min=0 required /></td>
		</tr>

		<tr>
			<TD align="right"><INPUT TYPE="SUBMIT" VALUE="Add"
				class="btn btn-primary"></TD>
			<TD><INPUT TYPE="RESET" VALUE="Reset" class="btn btn-danger"></TD>
		</tr>

	</table>
</FORM>

<%
	if (request.getParameter("plot_no") != null) {
		Integer PlotNo = Integer.parseInt(request
				.getParameter("plot_no"));

		Float SaleValue = Float.parseFloat(request
				.getParameter("sale_value"));

		Date DateofSale = Date.valueOf(request
				.getParameter("date_sale"));

		String SoldTo = request.getParameter("sold_to");

		Float Advance = Float.parseFloat(request
				.getParameter("advance"));

		Float Balance = Float.parseFloat(request
				.getParameter("balance"));

		String Query = " INSERT INTO salesmaster VALUES ( " + PlotNo
				+ "," + SaleValue + ",'" + DateofSale + "','" + SoldTo
				+ "'," + Advance + "," + Balance + ")";

		if (new DatabaseEngine(Query).getRowAffected() >= 1) {
			out.print("<script>alert('Creditor Added Succesfully');</script>");
		} else {
			out.print("<script>alert('Creditor Add Error');</script>");
		}

	}
%>

<jsp:include page="../footer.jsp"></jsp:include>