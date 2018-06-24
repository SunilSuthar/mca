<jsp:include page="header.jsp"></jsp:include>
<script>
	document.getElementById("admin_link").innerHTML = "";
</script>
<div class="jumbotron a text-center">
	<h1>Error !</h1>
	<img src="<%=request.getContextPath()%>/images/warn.png"
		style="height: 200px;">
	<p>REAL ESTATE MANAGEMENT SYSTEM</p>
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