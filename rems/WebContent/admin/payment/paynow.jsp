<%@page import="java.sql.Date"%>
<%@page import="db_engine.DatabaseEngine"%>
<%
	try {
		Integer amount = Integer.parseInt(request
				.getParameter("amount"));
		Integer curBalance = Integer.parseInt(request
				.getParameter("curbalance"));
		String plotno = request.getParameter("plotno");

		int newBal = curBalance - amount;
	
		new DatabaseEngine("Update SalesMaster set Balance = " + newBal
				+ " where PlotNo=" + plotno).getRowAffected();

		new DatabaseEngine(
				"INSERT INTO payment_history (`PlotNo`, `Amount`) VALUES ("
						+ plotno + " , " + amount + ")").getRowAffected();
		response.sendRedirect("history.jsp");

	} catch (Exception e) {
		response.sendRedirect("pay.jsp");
	}
%>