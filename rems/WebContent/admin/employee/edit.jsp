<jsp:include page="../header.jsp"></jsp:include>
<%@page import="db_engine.DatabaseEngine"%>
<%@ page language="java"%>
<%@ page session="true"%>
<%@ page import="java.sql.*,java.io.*"%>

<h1>Employee Details</h1>
<FORM action="" method="get" class="table table-hover">
	<TABLE class="table table-hover">

		<%
			if (request.getParameter("txtEmpNo") != null) {
				String emp = request.getParameter("txtEmpNo");

				ResultSet rs = new DatabaseEngine(
						"SELECT * from EmpMaster where EMPNO=" + emp)
						.getResultSet();

				if (rs != null) {
					rs.next();
					String tr;
					for (int i = 1; i <= 6; i++) {
						String columnName;
						columnName = rs.getMetaData().getColumnName(i);
						tr = "<TR><TD>" + columnName + "</TD>	<TD >"
								+ rs.getObject(i).toString() + "</TD><TR>";
						out.print(tr);
					}
		%>
		<tr>
			<td>Primary Skills</td>
			<td><INPUT name="PrimarySkills" type="text" class="form-control"
				value="<%=rs.getString(7)%>"></td>
		</tr>
		<tr>
			<td>Remarks</td>
			<td><TEXTAREA class="form-control" name="Remarks"> <%=rs.getString(8)%>  </TEXTAREA>
			</td>
		</tr>

		<tr>
			<td><input type="Submit" value="Modify" id="sid"
				class="btn btn-primary" /></td>
			<td><input type="Button" value="Cancel" class="btn btn-danger"
				onclick="javascript:window.location='list.jsp' " /></td>
		</tr>

	</TABLE>
	<input type=hidden name="EMPNO" value=<%=rs.getInt(2) %> />

	<%
		}
		}
	%>
</FORM>


<%
	if (request.getParameter("EMPNO") != null) {

		String EMPNO = request.getParameter("EMPNO");
		String PrimarySkills = request.getParameter("PrimarySkills");
		String Remarks = request.getParameter("Remarks");

		int rowsAffected = new DatabaseEngine(
				"Update EmpMaster set PrimarySkillset=\'"
						+ PrimarySkills + "\',Remarks=\'" + Remarks
						+ "\' where EMPNO=" + EMPNO).getRowAffected();

		if (rowsAffected >= 1) {
			response.sendRedirect("list.jsp");
		}

	}
%>