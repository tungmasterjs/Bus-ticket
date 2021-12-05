<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ include file="header.jsp" %>
<div class="signpage">
	
	<form action="edit" method="post" id="formResign">
		<input type="hidden" name="id" value="${USER.getId()}">
		<input type="hidden" name="password" value="${USER.getPassword()}">
		<div class="row">
			<div class="col-xs-12 col-sm-6">
				<div class="rs_form_box">
					<h3 class="form_section_title">
						Person Inform
					</h3>
					<div class="input-group">
						<label>Passenger Name1</label>
						<input type="text" name="name" value="${USER.getName()}" class="form-controller">
					</div>
					<div class="input-group">
						<label>Username</label>
						<input type="text" name="username" value="${USER.getUsername()}" class="form-controller" readonly>
					</div>

					<div class="input-group">
						<label>New Password</label>
						<input type="password" id="password" name="passwordEdit" value="" class="form-controller">
					</div>

					<div class="input-group">
						<label>Re-Enter Password</label>
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
						<label>CMND</label>
						<input type="text" name="cmnd" value="${USER.getIdentify()}" class="form-controller">
					</div>
					<div class="input-group">
						<label>Phone Number*</label>
						<input type="text" name="phone" value="${USER.getPhone()}" class="form-controller">
					</div>
					<div class="input-group">
						<label>Email</label>
						<input type="email" id="email" value="${USER.getEmail()}" name="email" class="form-controller">
					</div>
					
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 text-center">
				<div class="rs_btn_group">
					<button class="btn btn-info pull-left" type="submit">Edit</button>
				</div>
			</div>
		</div>
	</form>
</div>
${STATUS}
<%@ include file="footer.jsp" %>