<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
</div>
</div>
  	</section>
	<footer class="footer_section">
		<div class="container">
			<div class="footer_inner text-center">
				HCM.POLY_INTE_JAVA_HCM20_003/NHOM 2
			</div>
		</div>
	</footer>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/resouce/cus/js/jquery-3.3.1.min.js" ></script>
    <script src="${pageContext.request.contextPath}/resouce/cus/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resouce/cus/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resouce/cus/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resouce/cus/js/main.js"></script>
    <script src="${pageContext.request.contextPath}/resouce/plugins/jquery-validation/jquery.validate.min.js"></script>
    <script>
    	$('#formResign').validate({
    		rules:{
    			name: "required",
    			username: "required",
    			password: "required",
    			password_con: {
    				equalTo: "#password"
    			},
    			email: "required",
    			email_con: {
    				equalTo: "#email"
    			},
    			cmnd: "required",
    			phone: "required"
    		},
    		messages:{
    			name: "Please enter fullName",
    			username: "Please enter Username",
    			password: "Please enter Password",
    			password_con: {
    				equalTo: "Wrong password confirm"
    			},
    			email: "Please enter Email",
    			email_con: {
    				equalTo: "Wrong email confirm"
    			},
    			cmnd: "Please enter CMND",
    			phone: "Please enter Phone"
    		}
    	});
    </script>
  </body>
</html>