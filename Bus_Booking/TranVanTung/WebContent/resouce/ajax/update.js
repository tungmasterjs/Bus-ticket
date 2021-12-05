$(document).ready(function() {
	
	$('.confirmChange').click(function(){ //cancel ticket

			
			var tr = $(this).closest('tr');
			var id = tr.find(".abc").val();
			
		$.confirm({
		    title: 'Confirm!',
		    content: '<p class="text-danger text-center">Do you want cancle this ticket ?</p>',
		    buttons: {
		    	formSubmit:{
		            text: 'OK',
		            btnClass: 'btn-blue',
			        action: function () {
						$.ajax({
						type:'POST',
						data:{id:id,action:0},
						url:'../AjaxController',
						success:function(result){
							tr.remove();
						}
					});
			        },
		        },
		        cancel: function () {
		            //close
		        },
		    }
		});
	});

	$('.complexConfirm').click(function(){ //update ticket
	    var tr = $(this).closest('tr');
	    var seat = tr.find('.seat').html();
	    var status= tr.find('.status').html();
	    var id = tr.find('.abc').val();
	    var price = tr.find('.price').html();
	    var date = tr.find('.date').html();
	    var time = tr.find('.time').html();
	    var name = tr.find('.name_bus').html();
	    var road = tr.find('.road').html();
	    var nameUser = tr.find('.nameUser').html();
		$.confirm({
			columnClass:'medium',
		    title: 'Prompt!',
		    content: `
		    	<form>
					<div class="row">
						<div class="form-group col-sm-6">
							<label>ID</label>
							<input type="text" class="form-control" value="`+id+`" name="id" readonly>
						</div>
						<div class="form-group col-sm-6">
							<label>Bus</label><br>
							<input type="text" class="form-control" name="road" value="`+name+`" readonly>
						</div>
						<div class="form-group col-sm-6">
							<label>Road</label>
							<input type="text" class="form-control" name="road" value="`+road+`" readonly>
						</div>
						<div class="form-group col-sm-6">
							<label>Name booked</label>
							<input type="text" class="form-control nameUser" name="nameUser" value="`+nameUser+`">
						</div>
						<div class="form-group col-sm-6">
							<label>Price</label>
							<input type="number" class="form-control" value="`+price+`" name="price">
						</div>
						<div class="form-group col-sm-6">
							<label>Seat</label>
							<input type="text" class="form-control" value="`+seat+`" name="seat">
						</div>
						<div class="form-group col-sm-6">
							<label>Date</label>
							<input type="date" class="form-control" value="`+date+`" name="date">
						</div>
						<div class="form-group col-sm-6">
							<label>Time</label>
							<input type="time" class="form-control" value="`+time+`" name="time">
						</div>
						<div class="form-group col-sm-6">
							<label>Status</label><br>
							<select class="form-control" id="status">
								<option id="sta1" value="0">AVAILABEL</option>
								<option id="sta2" value="1">BOOKED</option>
							</select>
						</div>
					</div>
				</form>
				<script>
						if("`+status+`"=="BOOKED"){
							$('#sta2').attr('selected','selected');
							
						}else{
							$('.nameUser').attr('readonly','readonly');
							$('#sta1').attr('selected','selected');
						}
						var nameUser = "`+nameUser+`";
						if(nameUser==="undefined"){
							$('input[name="nameUser"]').val("");
						}
						$('#status').change(function(){
							var option = $(this).val();
							if(option==0)
								$('.nameUser').attr('readonly','readonly');
							else
								$('.nameUser').removeAttr('readonly','readonly');
						});
				</script>
				
		    `
		,
		buttons:{
			formSubmit:{
	            text: 'Submit',
	            btnClass: 'btn-blue',
				action: function (){
	//		            
	//		            
			        	price = this.$content.find('input[name="price"]').val();
			        	date = this.$content.find('input[name="date"]').val();
			        	time = this.$content.find('input[name="time"]').val();
			        	var statusChild = this.$content.find('#status').val();
			        	seat = this.$content.find('input[name="seat"]').val();
			        	nameUser = this.$content.find('input[name="nameUser"]').val();
			        	if(status==1 && nameUser==""){
			        		$.alert("Please enter the name book");
			        		return false;
			        	}
			        	$.ajax({
							type:'POST',
							data:{id:id,nameUser:nameUser,price:price,date:date,time:time,seat:seat,status:statusChild,action:1},
							url:'../AjaxController',
							success:function(result){
								if(result==status){
									$.alert("Update Success")
									tr.find('.seat').html(seat);
									tr.find('.price').html(price);
								    tr.find('.date').html(date);
								    tr.find('.time').html(time);
								    tr.find('.name_bus').html(name);
								    tr.find('.road').html(road);
								    tr.find('.nameUser').html(nameUser);
								}
								else{
									tr.remove();
									$.alert("Update Success");
								}
							}
						});
			        },
			        
		        },
			cancel: function () {
	        	//close
	        },
	        },
		    onContentReady: function () {
		        // bind to events
		        var jc = this;
		        this.$content.find('form').on('submit', function (e) {
		            // if the user submits the form by pressing enter in the field.
		            e.preventDefault();
		            jc.$$formSubmit.trigger('click'); // reference the button and click it
		        });
		    }
		});
	});
	
	$('.changeRole').click(function(){ //update role
	    var tr = $(this).closest('tr');
	    var roleUser = tr.find('.roleUser').html();
	    var id = tr.find('.idUser').val();
		$.confirm({
		    title: 'Prompt!',
		    content: '' +
		    '<form>' +
		    	'<div class="form-group">' +
			        '<label>Set Role</label>' +
			        '<select class="form-control" id="roleOption">' +
				        '<option id="r1" value="0">CUS</option>' +
				        '<option id="r2" value="1">TICKET_SELLER</option>' +
				        '<option id="r3" value="2">ADMIN</option>' +
			        '</select>' +
		        '</div>' +
	        '</form>'+
		'<script>'+
			'var check ="CUS";'+
			'switch("'+roleUser+'"){'+
				'case "CUS":'+
					'$("#r1").attr("checked","checked");'+
					'break;'+
				'case "TICKET_SELLER":'+
					'$("#r2").attr("selected","selected");'+
					'break;'+
				'case "ADMIN":'+
					'$("#r3").attr("selected","selected");'+
					'break;'+
				'}'+
		'</script>'
		,
		buttons:{
			formSubmit:{
	            text: 'Submit',
	            btnClass: 'btn-blue',
				action: function (){
	//		            
	//		            
			        	var roleChild = this.$content.find('#roleOption').val();
			        	alert(roleChild);
			        	$.ajax({
							type:'POST',
							data:{id:id,role:roleChild,action:2},
							url:'../AjaxController',
							success:function(result){
								$.alert("Update Success");
								tr.find('.roleUser').html(result);
							}
						});
			        },
		        },
			cancel: function () {
	        	//close
	        },
	        },
		    onContentReady: function () {
		        // bind to events
		        var jc = this;
		        this.$content.find('form').on('submit', function (e) {
		            // if the user submits the form by pressing enter in the field.
		            e.preventDefault();
		            jc.$$formSubmit.trigger('click'); // reference the button and click it
		        });
		    }
		});
	});
	
	$('.userUpdate').click(function(){ //update user
	    var tr = $(this).closest('tr');
	    var roleUser = tr.find('.roleUser').html();
	    var id = tr.find('.idUser').val();
	    var name = tr.find('.nameUser').html();
	    var email = tr.find('.emailUser').html();
	    var username = tr.find('.usernameUser').html();
	    var password = tr.find('.passwordUpdate').val();
	    var phone = tr.find('.phoneUser').html();
	    var cmnd = tr.find('.cmndUser').html();
		$.confirm({
			columnClass:'medium',
		    title: 'Prompt!',
		    content: '' +
		    '<form id="formUpdateUser">' +
		    	'<div class="row">'+
		    		'<div class="form-group col-sm-6">'+
			    		'<label>ID</label>'+
			    		'<input type="text" class="form-control" name="id" id="id" value="'+id+'" readonly>'+
		    		'</div>'+
		    		'<div class="form-group col-sm-6">'+
			    		'<label>NAME</label>'+
			    		'<input type="email" class="form-control" name="name" id="name" value="'+name+'" required>'+
		    		'</div>'+
		    		'<div class="form-group col-sm-6">'+
			    		'<label>Username</label>'+
			    		'<input type="text" class="form-control" name="username" id="username" value="'+username+'" required>'+
	    			'</div>'+
	    			'<div class="form-group col-sm-6">'+
			    		'<label>Password</label>'+
			    		'<input type="text" class="form-control" name="password" id="password" value="'+password+'" required>'+
		    		'</div>'+
		    		'<div class="form-group col-sm-6">'+
			    		'<label>Email</label>'+
			    		'<input type="email" class="form-control" name="email" id="email" value="'+email+'" required>'+
		    		'</div>'+
		    		'<div class="form-group col-sm-6">'+
						'<label>Phone</label>'+
						'<input type="text" class="form-control" name="phone" id="phone" value="'+phone+'" required>'+
					'</div>'+
					'<div class="form-group col-sm-6">'+
						'<label>CMND</label>'+
						'<input type="text" class="form-control" name="cmnd" id="cmnd" value="'+cmnd+'" required>'+
					'</div>'+
			    	'<div class="form-group col-sm-6">' +
				        '<label>Set Role</label>' +
				        '<select class="form-control" id="roleOption">' +
					        '<option id="r1" value="0">CUS</option>' +
					        '<option id="r2" value="1">TICKET_SELLER</option>' +
					        '<option id="r3" value="2">ADMIN</option>' +
				        '</select>' +
			        '</div>' +
		        '</div>' +
	        '</form>'+
	        
		'<script>'+
			'var check ="CUS";'+
			'switch("'+roleUser+'"){'+
				'case "CUS":'+
					'$("#r1").attr("checked","checked");'+
					'break;'+
				'case "TICKET_SELLER":'+
					'$("#r2").attr("selected","selected");'+
					'break;'+
				'case "ADMIN":'+
					'$("#r3").attr("selected","selected");'+
					'break;'+
				'}'+
		'</script>'
		,
		buttons:{
			formSubmit:{
	            text: 'Submit',
	            btnClass: 'btn-blue',
				action: function (){
	//		           
		           name = this.$content.find('#name').val();
				   email = this.$content.find('#email').val();
				   username = this.$content.find('#username').val();
				   password = this.$content.find('#password').val();
				   phone = this.$content.find('#phone').val();
				   cmnd = this.$content.find('#cmnd').val();
				   var roleChild = this.$content.find('#roleOption').val();
				   var checkMail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
				   var checkPhone =/[0-9]{10,10}/;
				   var checkCmnd =/[0-9]{9,9}/;
				   if(!name){
					   $.alert("Please enter Name");
					   return false;
				   }
				   if(!username){
					   $.alert("Please enter Username");
					   return false;
				   }
				   if(!password){
					   $.alert("Please enter Password");
					   return false;
				   }
				   if(!email){
					   $.alert("Please enter Email");
					   return false;
				   }
					   if(!checkMail.test(email)){
						   $.alert("Please enter right Email");
						   return checkEmail.test(email);}
				   
				   if(!phone){
					   $.alert("Please enter Phone");
					   return false;
				   }
				   if(!checkPhone.test(phone)){
					   $.alert("Please enter right Phone, 10 number");
					   return false;
				   }
				  
				   if(!cmnd){
					   $.alert("Please enter CMND");
					   return false;
				   }
				   if(!checkCmnd.test(cmnd)){
					   $.alert("Please enter right CMND, 9 number");
					   return false;
				   }
				   
			        	$.ajax({
							type:'POST',
							data:{id:id,
								name:name,
								email:email,
								username:username,
								password:password,
								phone:phone,
								cmnd:cmnd,
								role:roleChild,
								action:3},
							url:'../AjaxController',
							success:function(result){
								$.alert("Update Success");
								tr.find('.nameUser').html(name);
								tr.find('.usernameUser').html(username);
								tr.find('.emailUser').html(email);
								tr.find('.phoneUser').html(phone);
								tr.find('.cmndUser').html(cmnd);
								tr.find('.roleUser').html(result);
							}
						});
			        },
		        },
			cancel: function () {
	        	//close
	        },
	        },
		    onContentReady: function () {
		        // bind to events
		        var jc = this;
		        this.$content.find('form').on('submit', function (e) {
		            // if the user submits the form by pressing enter in the field.
		            e.preventDefault();
		            jc.$$formSubmit.trigger('click'); // reference the button and click it
		        });
		    }
		});
	});

	$('#submitFormCreate').click(function(){

		var name = $('input[name="name"]').val();
		var email = $('input[name="email"]').val();
		var username = $('input[name="username"]').val();
		var password = $('input[name="password"]').val();
		var phone = $('input[name="phone"]').val();
		var cmnd = $('input[name="cmnd"]').val();
		var role = $('input[name="roleUser"]:checked').val();
		var checkMail = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		var checkPhone =/[0-9]{10,10}/;
		var checkCmnd =/[0-9]{9,9}/;
		if(!name){
			   $.alert("Please enter Name");
			   return;
		   }
		   if(!username){
			   $.alert("Please enter Username");
			   return;
		   }
		   if(!password){
			   $.alert("Please enter Password");
			   return;
		   }
		   if(!email){
			   $.alert("Please enter Email");
			   return;
		   }
			   if(!checkMail.test(email)){
				   $.alert("Please enter right Email");
				   return;}
		   
		   if(!phone){
			   $.alert("Please enter Phone");
			   return;
		   }
		   if(!checkPhone.test(phone)){
			   $.alert("Please enter right Phone, 10 number");
			   return;
		   }
		$.ajax({
			type:'POST',
			data:{
				name:name,
				email:email,
				username:username,
				password:password,
				phone:phone,
				cmnd:cmnd,
				role:role,
				action:4},
			url:'../AjaxController',
			success:function(result){
				$.alert("Create Success");
			}
		});
	});
});