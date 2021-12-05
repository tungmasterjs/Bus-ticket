<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ include file="header.jsp" %>

<div class="dashboard">
	<div class="box personal_info">
		<h2 class="box_title">Person Inform</h2>
		<table class="table table-bordered">
			<tr>
				<td><strong>ID </strong></td>
				<td class="idUser">${USER.getId()}</td>
			</tr>
			<tr>
				<td><strong>Fullname</strong></td>
				<td class="nameUser">${USER.getName()}</td>
			</tr>
			<tr>
				<td><strong>Username</strong></td>
				<td class="username">${USER.getUsername()}</td>
			</tr>
			<tr>
				<td><strong>Email</strong></td>
				<td class="email">${USER.getEmail()}</td>
			</tr>
			<tr>
				<td><strong>CMND</strong></td>
				<td class="cmnd">${USER.getIdentify()}</td>
			</tr>
			<tr>
				<td><strong>Phone</strong></td>
				<td class="phone">${USER.getPhone()}</td>
			</tr>
			<tr>
				<td><strong>Edit</strong></td>
				<td><a class="btn btn-info" href="${pageContext.request.contextPath}/cus/edit">Change information</a></td>
			</tr>
		</table>
	</div>
	<div class="box successfully_purschase_ticket">
		<h2 class="box_title">Success Purchase Information</h2>
		<table class="table table-bordered">
			<tr>
				<th>Id Ticket</th>
				<th>Bus Name</th>
				<th>Road</th>
				<th>Seat</th>
				<th>Price</th>
				<th>Date</th>
				<th>Time</th>
				<th>Edit</th>
			</tr>
			<c:forEach items="${LIST}" var="ticket">
				<tr>
					<td class="idTicket">${ticket.getId()}</td>
					<td class="nameBus">${ticket.getName_bus()}</td>
					<td class="road">${ticket.getRoad()}</td>
					<td class="seat">${ticket.getSeat()}</td>
					<td class="price">${ticket.getPrice()}</td>
					<td class="date">${ticket.getDate()}</td>
					<td class="time">${ticket.getTime()}</td>
					<td><button class="btn btn-info btn-sm cancelTicket">Cancel Ticket</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
<%@ include file="footer.jsp" %>