<jsp:include page="../header.jsp"></jsp:include>

<%@page import="java.sql.ResultSet"%>
<%@page import="db_engine.DatabaseEngine"%>
<%@page import="java.sql.Date"%>
<%@ page session="true"%>

<script>
	function mydate() {
		d = new Date(document.getElementById("dt").value);
		dd = d.getDate();
		mm = d.getMonth() + 1;
		yyyy = d.getFullYear();
		document.getElementById("JoinDate").value = yyyy + "-" + mm + "-" + dd;
	}
</script>
<%
	if (request.getParameter("EMPName") == null) {
%>

<FORM NAME="AddEmpForm" action="">
	<h1>Add new Employee</h1>
	<TABLE class="table table-hover">
		<TR>
			<TD>EMPName *</TD>
			<TD><INPUT TYPE="TEXT" class="form-control" NAME="EMPName"
				required SIZE="30"></TD>
		</TR>
		<TR>
			<TD>EMPNO *</TD>
			<TD><INPUT TYPE="TEXT" class="form-control" NAME="EMPNO"
				required SIZE="30"></TD>
		</TR>

		<TR>
			<TD>MailID *</TD>
			<TD><INPUT TYPE="email" class="form-control" NAME="EmpEmailID"
				required SIZE="30"></TD>
		</TR>

		<TR>
			<TD>CurrentLocation*</TD>
			<TD>
				<div class="form-group">
					<select name="CurrentLocation" class="form-control" required>
						<option disabled>-----------Rajasthan----------</option>
						<option value="Jodhpur">Jodhpur</option>
						<option value="Jaipur">Jaipur</option>
						<option value="Udaipur">Udaipur</option>
						<option value="Kota">Kota</option>
						<option disabled>------------Gujarat-----------</option>
						<option value="Surat">Surat</option>
						<option value="Ahamdabad">Ahamdabad</option>
						<option value="Baroda">Baroda</option>

					</select>
				</div>
			</TD>
		</TR>

		<TR>
			<TD>JoiningDate</TD>
			<TD><input type="date" id="dt" onblur="mydate();" required
				class="form-control" /> <input type="hidden" id="JoinDate"
				name="JoinDate" value="" /></TD>
		</TR>
		<TR>
			<TD>Role</TD>
			<TD><select name="Role" class="form-control">
					<option value="NA">-----</option>
					<option>Project Manager</option>
					<option>Software Engineer</option>
					<option>Software Tester</option>
					<option>Accounts Manager</option>
					<option>Sales Manager</option>
					<option>Clerk</option>
			</select></TD>

		</TR>
		<TR>
			<TD>Qualification</TD>
			<TD><INPUT TYPE="TEXT" class="form-control"
				NAME="PrimarySkillset" SIZE="30"></TD>
		</TR>
		<TR>
			<TD>Remarks</TD>
			<TD><INPUT TYPE="TEXT" class="form-control" NAME="Remarks"
				SIZE="30"></TD>
		</TR>
		<TR ALIGN="CENTER">
			<TD align="right"><INPUT TYPE="SUBMIT" VALUE="Add"
				class="btn btn-primary"></TD>
			<TD align="left"><INPUT TYPE="RESET" VALUE="Reset"
				class="btn btn-danger"></TD>
		</TR>

	</TABLE>
</FORM>

<%
	} else {

		String EMPName = request.getParameter("EMPName");
		String EmpNo = request.getParameter("EMPNO");
		int EMPNO = Integer.parseInt(EmpNo);
		String EmpEmailID = request.getParameter("EmpEmailID");

		String CurrentLocation = request
				.getParameter("CurrentLocation");

		String strJoiningDate = request.getParameter("JoinDate");

		Date JoiningDate = Date.valueOf(strJoiningDate);

		String Role = request.getParameter("Role");
		String PrimarySkillset = request
				.getParameter("PrimarySkillset");
		String Remarks = request.getParameter("Remarks");

		ResultSet rs = new DatabaseEngine(
				"Select EMPNO from EmpMaster where EMPNO=" + EMPNO)
				.getResultSet();

		if (!(rs.next())) {

			int rowsAffected = new DatabaseEngine(
					"Insert into EmpMaster values(\'" + EMPName + "\',"
							+ EMPNO + ",\'" + EmpEmailID + "\',\'"
							+ CurrentLocation + "\',\'" + JoiningDate
							+ "\',\'" + Role + "\',\'"
							+ PrimarySkillset + "\',\'" + Remarks
							+ "\')").getRowAffected();

			if (rowsAffected == 1) {
				out.print("<div class='alert alert-success' aria-label='close'><strong>Success!</strong>Employee Added Successfully </div>");
			} else {
				out.print("<div class='alert alert-danger' aria-label='close'><strong>Failure!</strong>Employee Already Exists</div>");
			}
		}
	}
%>
<jsp:include page="../footer.jsp"></jsp:include>
