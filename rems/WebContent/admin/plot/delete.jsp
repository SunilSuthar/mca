<%@page import="db_engine.DatabaseEngine"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<%
	try {
		Integer plot_no = Integer.parseInt(request
				.getParameter("plot_no"));

		int deleted = new DatabaseEngine(
				"DELETE FROM plotdetails WHERE PlotNo=" + plot_no)
				.getRowAffected();
		if (deleted >= 1) {
			response.sendRedirect("../plot_lists/all_plots.jsp");
		}

	} catch (Exception e) {
		response.sendRedirect("../plot_lists/all_plots.jsp");
	}
%>
