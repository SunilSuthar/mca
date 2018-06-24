<%@page import="db_engine.DatabaseEngine"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<%
	try {
		Integer apartment_no = Integer.parseInt(request.getParameter("apartment_no"));
		
		int deleted = new DatabaseEngine(
				"DELETE FROM AppartmentMaster WHERE AppNo=" + apartment_no)
				.getRowAffected();
		if (deleted >= 1) {
			response.sendRedirect("list.jsp");
		}

	} catch (Exception e) {
		response.sendRedirect("list.jsp");
	}
%>
