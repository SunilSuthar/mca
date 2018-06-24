<jsp:include page="header.jsp"></jsp:include>

<%@page import="db_engine.DatabaseEngine"%>

<div class="jumbotron bg text-center">
	<%
		if (request.getParameter("name") != null) {

			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String comments = request.getParameter("comments");

			String Query = "INSERT INTO `messages`(`name`, `email`, `message`) VALUES ("
					+ "'"
					+ name
					+ "'"
					+ ","
					+ "'"
					+ email
					+ "'"
					+ ","
					+ "'" + comments + "'" + ")";

			if (new DatabaseEngine(Query).getRowAffected() == 1) {
				out.print("<h1>Success !</h1>");
				out.print("<p>Message sent</p>");
			} else {
				out.print("<h1>Failure !</h1>");
				out.print("<p>Message is not sent</p>");
			}
		} else {
			response.sendRedirect(request.getContextPath());
		}
	%>

	<form class="form-inline">
		<div class="input-group">
			<div class="input-group-btn">
				<a href="<%=request.getContextPath()%>"><button type="button"
						class="btn btn-danger">GO HOME</button></a>
			</div>
		</div>
	</form>

</div>


<jsp:include page="footer.jsp"></jsp:include>
