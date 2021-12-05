<%@ include file="header.jsp" %>
<div class="signpage">
	<form action="ticket-display" method="get">
		<div class="rs_form_box">
			<h3 class="form_section_title">
				 PUR TICKET
			</h3>
			<div class="form-group">
				<label>Road :</label>
				<input type="text" name="road" class="form-control" placeholder="ex: Tp Ho Chi Minh - Ha Noi"/>
			</div>
			
			<div class="form-group">
				<label>Journey Date :</label>
				<input type="date" class="form-control" name="date" />
			</div>
			
		</div>
		<div class="text-center">
			<div class="rs_btn_group">
				<button class="btn btn-info" type="submit">Search</button>
			</div>
		</div>
	</form>
</div>
<%@ include file='footer.jsp' %>