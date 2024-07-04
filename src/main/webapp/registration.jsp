<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="header.jsp" %>

	<input type="hidden" id="status" value="<%=request.getAttribute("status") %>">
	<div class="main">

		<!-- Sign up form -->
		<section class="signup" >
			<div class="container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title" style="margin-top: 60px;">Sign up</h2>
					
                       <form method="post" action="register" class="register-form" id="register-form" enctype="multipart/form-data">
                       		<div class="form-group">Name: 
								<label for="name"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" placeholder="Your Name" />
							</div>
							<div class="form-group">Email: 
								<label for="email"><i class="zmdi zmdi-email"></i></label> <input
									type="email" name="email" id="email" placeholder="Your Email" />
							</div>
							<div class="form-group">Password: 
								<label for="pass"><i class="zmdi zmdi-lock"></i></label> <input
									type="password" name="pass" id="pass" placeholder="Password" />
							</div>
							<div class="form-group">Password: 
								<label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="password" name="re_pass" id="re_pass"
									placeholder="Repeat your password" />
							</div>
							<div class="form-group">Phone: 
								<label for="contact"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="text" name="contact" id="contact"
									placeholder="Contact no" />
							</div>
							<div class="form-group">dateN: 
								<label for="naissance"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="date" name="naissance" id="naissance"
									placeholder="date naissance" />
							</div>
							<div class="form-group">Image: 
								<label for="imag"><i class="zmdi zmdi-lock-outline"></i></label>
								<input type="file" name="profile_image">
							</div>
							<div class="form-group">
								<a href="login.jsp" class="signup-image-link">I am already member</a>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="form-submit" value="Register" />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">

	<script type="text/javascript">
	var status = document.getElementById("status").value;
		if(status=="success"){
			swal("Congrats","Account Created Successfully","success");
		}
	</script>

</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>