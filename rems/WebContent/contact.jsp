<form action="send_message.jsp" method="post">
	<div class="container-fluid bg-grey">
		<h2 class="text-center">CONTACT</h2>
		<div class="row">
			<div class="col-sm-5">
				<p>Contact us and we'll get back to you ASAP.</p>
				<p>
					<span class="glyphicon glyphicon-map-marker"></span> JODHPUR,
					RAJASTHAN, INDIA
				</p>
				<p>
					<span class="glyphicon glyphicon-phone"></span> +91 9950169194
				</p>
				<p>
					<span class="glyphicon glyphicon-envelope"></span> <a
						href="mailto:sunilsuthar@outlook.com">mail us</a>
				</p>
			</div>
			<div class="col-sm-7">
				<div class="row">
					<div class="col-sm-6 form-group">
						<input class="form-control" id="name" name="name"
							placeholder="Name" type="text" required>
					</div>
					<div class="col-sm-6 form-group">
						<input class="form-control" id="email" name="email"
							placeholder="Email" type="email" required>
					</div>
				</div>
				<textarea class="form-control" id="comments" name="comments"
					placeholder="Comment" rows="5"></textarea>
				<br>
				<div class="row">
					<div class="col-sm-12 form-group">
						<button class="btn btn-default pull-right" type="submit">Send</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>