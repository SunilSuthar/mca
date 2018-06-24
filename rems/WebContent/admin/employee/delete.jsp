<%@page import="db_engine.DatabaseEngine"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*,java.util.Random"%>

<%
	try {
		Integer emp = Integer.parseInt(request.getParameter("emp"));
		
		int deleted = new DatabaseEngine(
				"DELETE FROM EmpMaster WHERE EMPNO=" + emp)
				.getRowAffected();
		if (deleted >= 1) {
			response.sendRedirect("list.jsp");
		}

	} catch (Exception e) {
		response.sendRedirect("list.jsp");
	}
%>
