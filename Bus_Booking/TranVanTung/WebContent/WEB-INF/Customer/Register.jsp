<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ include file="header.jsp" %>
<div class="signpage">
	
	<form action="resign" method="post" id="formResign">
		
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<div class="rs_form_box">
					<h3 class="form_section_title">
						Personal Information
					</h3>
					<div class="input-group">
						<label>Passenger Name*</label>
						<input type="text" name="name" class="form-controller">
					</div>
					<div class="input-group">
						<label>Username*</label>
						<input type="text" name="username" class="form-controller">
					</div>

					<div class="input-group">
						<label>Password*</label>
						<input type="password" id="password" name="password" class="form-controller">
					</div>

					<div class="input-group">
						<label>Re-Enter Password*</label>
						<input type="password" name="password_con" class="form-controller">
					</div>

				</div>

			</div>
			<div class="col-xs-12 col-sm-6">
				<div class="rs_form_box">
					<h3 class="form_section_title">
						Extra information
					</h3>
					<div class="input-group">
						<label>Email*</label>
						<input type="email" id="email" name="email" class="form-controller">
					</div>
					<div class="input-group">
						<label>Re-Enter Email address*</label>
						<input type="email" name="email_con" class="form-controller">
					</div>
					<div class="input-group">
						<label>CMND*</label>
						<input type="text" name="cmnd" class="form-controller">
					</div>
					<div class="input-group">
						<label>Phone Number*</label>
						<input type="text" name="phone" class="form-controller">
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 text-center">
				<div class="rs_btn_group">
					<button class="btn btn-success pull-left" type="submit">Register</button>
				</div>
			</div>
		</div>
	</form>
</div>
${STATUS}
<%@ include file="footer.jsp" %>