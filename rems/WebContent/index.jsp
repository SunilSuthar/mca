<jsp:include page="header.jsp"></jsp:include>

<!-- Welcome Text -->
<div class="jumbotron bg text-center">

	<table style="width: 100%;">
		<tr>
			<td align="center"><h1>Welcome !</h1>
				<p>REAL ESTATE MANAGEMENT SYSTEM</p>
				<form class="form-inline" action="newsletter_subscibe.jsp">
					<div class="input-group">
						<input type="email" name="email" class="form-control" size="50"
							placeholder="Email Address to get newsletters" required>
						<div class="input-group-btn">
							<button type="submit" class="btn btn-danger">Subscribe</button>
						</div>
					</div>
				</form></td>
			<td align="center">
				<!-- Carousel -->
				<div align="center" id="myCarousel" class="carousel slide"
					data-ride="carousel" style="height: 300px; width: 450px;">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
					</ol>

					<div class="carousel-inner" align="center">
						<div class="item active">
							<img src="images/slider/1.jpg">
						</div>
						<div class="item">
							<img src="images/slider/2.jpg">
						</div>
						<div class="item">
							<img src="images/slider/3.jpg">
						</div>
					</div>


					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel"
						data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left"></span> <span
						class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#myCarousel"
						data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right"></span> <span
						class="sr-only">Next</span>
					</a>
				</div>

			</td>
		</tr>
	</table>

</div>

<jsp:include page="about.jsp"></jsp:include>
<jsp:include page="contact.jsp"></jsp:include>


<jsp:include page="footer.jsp"></jsp:include>