$(document).ready(function() {
	
	$(".cancelTicket").click(function(){ //cancel ticket
		
			
			var tr = $(this).closest('tr');
			var id = tr.find(".idTicket").html();
			if(confirm("Do you want cancel ticket")){
				$.ajax({
					type:'POST',
					data:{id:id,action:0},
					url:'../AjaxController',
					success:function(result){
						tr.remove();
					}
				});
			}
		
	});
	$(".bookTicket").click(function(){ //booking ticket
		
		
		var tr = $(this).closest('tr');
		var id = tr.find(".id").html();
		if(confirm("Do you want booking this ticket")){
			$.ajax({
				type:'POST',
				data:{id:id,action:5},
				url:'../AjaxController',
				success:function(result){
					tr.remove();
				}
			});
		}
	
});

	$('.userCusChange').click(function(){ //update user
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
});