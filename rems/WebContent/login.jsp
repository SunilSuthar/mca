<jsp:include page="header.jsp"></jsp:include>

<script>
document.getElementById("admin_link").innerHTML="";
</script>
<div class="jumbotron bg text-center">
	<h1>Login Panel</h1>
	<p>REAL ESTATE MANAGEMENT SYSTEM</p>
	<div align="center">
		<div class="jumbotron  text-center"
			style="width: 600px; padding-left: 100px; padding-right: 100px;">

			<form class="form-horizontal" action="j_security_check"
				style="width: 400px;">
				<div class="form-group">
					<label class="control-label col-sm-2" for="username">Username:</label>
					<div class="col-sm-10">
						<input name="j_username" type="text" class="form-control"
							id="username" placeholder="Enter username">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="pwd">Password:</label>
					<div class="col-sm-10">
						<input name="j_password" type="password" class="form-control"
							id="pwd" placeholder="Enter password">
					</div>
				</div>
				<div class="form-group" align="right">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

