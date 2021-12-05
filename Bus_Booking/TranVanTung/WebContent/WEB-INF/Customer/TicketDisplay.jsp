<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ include file="header.jsp" %>
<form>
	<h2 class="title">Bus Route Showing</h2>
	<table class="table rs_shadow">
		<tr>
			<th>Id</th>
			<th>Name Bus</th>
			<th>Road</th>
			<th>Seat</th>
			<th>Price</th>
			<th>Date</th>
			<th>Time</th>
			<th>Edit</th>
			
		</tr>
		<c:forEach items="${LIST}" var="ticket">
				<tr>
					<td class="id">${ticket.getId()}</td>
					<td class="nameBus">${ticket.getName_bus()}</td>
					<td class="road">${ticket.getRoad()}</td>
					<td class="seat">${ticket.getSeat()}</td>
					<td class="price">${ticket.getPrice()}</td>
					<td class="date">${ticket.getDate()}</td>
					<td class="time">${ticket.getTime()}</td>
					<c:choose>
						<c:when test="${USER.getUsername()==''}">
							<td><button type="button" class="btn btn-info btn-sm bookTicket">Booking</button></td>
						</c:when>
						<c:otherwise>
							<td>Login to book</td>
						</c:otherwise>
					</c:choose>
					
				</tr>
			</c:forEach>
		
	</table>
</form>
<div id="rs_ticket_result">

</div>
<%@ include file='footer.jsp' %>