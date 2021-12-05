<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ include file="header.jsp" %>
<div class="signpage">
	<form>
		<div class="rs_form_box">
			<h3 class="form_section_title">
				 PURCHASE TICKET
			</h3>
			<div class="form-group">
				<label>Station From :</label>
				<input type="text" class="form-control" name="goFrom" />
			</div>
			
			<div class="form-group">
				<label>Journey Date :</label>
				<input type="date" class="" name="date" />
			</div>
			
			<div class="form-group">
				<label>Station To :</label>
				<input type="text" class="form-control" name="goTo" />
			</div>
			
		</div>
		<div class="text-center">
			<div class="rs_btn_group">
				<button class="btn btn-success" type="submit">Search</button>
			</div>
		</div>
	</form>
</div>
<%@ include file='footer.jsp' %>