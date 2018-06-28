<jsp:include page="header.jsp"></jsp:include>

<div class="jumbotron bg text-center">
	<h1 style="text-transform: uppercase;">
		welcome
		<%=request.getRemoteUser() %>
		!
	</h1>
	<h2>REMS User Area</h2>
	<h4>Manage Your System From Here</h4>
	<h5>or</h5>
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