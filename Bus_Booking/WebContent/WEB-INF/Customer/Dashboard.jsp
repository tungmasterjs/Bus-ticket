<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class="dashboard">
	<div class="box personal_info">
		<h2 class="box_title">Personal Information</h2>
		<table class="table table-bordered">
			<tr>
				<td><strong>Full name</strong></td>
				<td>Vo Ngoc Hai</td>
			</tr>
			<tr>
				<td><strong>Username</strong></td>
				<td>abc</td>
			</tr>
			<tr>
				<td><strong>Email</strong></td>
				<td>ghethe123@gmail.com</td>
			</tr>
			<tr>
				<td><strong>CMND</strong></td>
				<td>123123123</td>
			</tr>
			<tr>
				<td><strong>Phone</strong></td>
				<td>1231231231</td>
			</tr>
			<tr>
				<td><strong>Edit</strong></td>
				<td><button class="btn btn-success">Change information</button></td>
			</tr>
		</table>
	</div>
	<div class="box successfully_purschase_ticket">
		<h2 class="box_title">Success Purchase Information</h2>
		<table class="table table-bordered">
			<tr>
				<th>Bus Name</th>
				<th>Road</th>
				<th>Price</th>
				<th>Date</th>
				<th>Time</th>
				<th>Edit</th>
			</tr>
			<tr>
				<td class="nameBus">Thu Ky</td>
				<td class="road">Ha Noi - Hai Phong</td>
				<td class="price">20000</td>
				<td class="date">23/12/2020</td>
				<td class="time">14:00</td>
				<td class="cancelTicket"><button class="btn btn-success btn-sm">Cancel Ticket</button></td>
			</tr>
			
		</table>
	</div>
</div>
<%@ include file="footer.jsp" %>