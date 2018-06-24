<jsp:include page="header.jsp"></jsp:include>

<script>
document.getElementById("logout").innerHTML="";
</script>
<div class="jumbotron a text-center">
	<h1>
		Bye
		<%=request.getRemoteUser()%>
		!
	</h1>
	<p>you have been logged out successfully</p>
	<%
		session.invalidate();
	%>
	<form class="form-inline">
		<div class="input-group">
			<div class="input-group-btn">

				<a href="../admin">
					<button type="button" class="btn btn-danger">Login Again!</button>
				</a>

			</div>
		</div>
	</form>
</div>
<jsp:include page="footer.jsp"></jsp:include>