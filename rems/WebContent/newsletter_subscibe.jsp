<jsp:include page="header.jsp"></jsp:include>

<%@page import="db_engine.DatabaseEngine"%>

<div class="jumbotron bg text-center">
	<%
		if (request.getParameter("email") != null) {
			String email = request.getParameter("email");

			String Query = "INSERT INTO `subscribers` (`email`) VALUES ('"
					+ email + "')";

			if (new DatabaseEngine(Query).getRowAffected() == 1) {
				out.print("<h1>Success !</h1>");
				out.print("<p>You have been successfully added in our newsletter list</p>");
			} else {
				out.print("<h1>Failure !</h1>");
				out.print("<p>You are already in the list</p>");
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
