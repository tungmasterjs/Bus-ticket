
<%@ include file="header.jsp" %>
<form>
	<h2 class="title">  <span>Train Route Showing For ::</span> Sai Gon to  Ha Noi <span>:: Journey Date -</span> </h2>
	<table class="table rs_shadow">
		<tr>
			<th>Serial</th>
			<th>Train No</th>
			<th>Train Name</th>
			<th>Class</th>
			<th>Departure Time</th>
			<th>Unit Fare</th>
			<th>Number Of Seat</th>
			<th>Selection</th>
		</tr>
		
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td>
			<td></td> 
			<td>
				<select name="total_seat"  class="form-control total_seat_select">
					    <option value="1">01</option>
					    <option value="2">02</option>
					    <option value="3">03</option>
					    <option value="4">04</option>
				</select>
			</td>
			<td>
				<button type="button" class="btn btn-success rs_search_ticket">Booking</button>
			</td>
		</tr>
		
	</table>
</form>
<div id="rs_ticket_result">

</div>
<%@ include file='footer.jsp' %>