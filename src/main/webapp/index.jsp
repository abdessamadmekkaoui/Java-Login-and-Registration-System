<%
if(session.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Freelancer - Start Bootstrap Theme</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script>
    // Prevent user from using the back button after logging out
    window.history.forward();
    // Additional check to prevent access to the index page without login
    if (window.location.href.indexOf("index.jsp") > -1 && "<%= session.getAttribute("name") %>" == "") {
        window.location.href = "login.jsp";
    }
</script>
<style>
/* Style CSS pour le header */

/* Conteneur principal */
.boddy {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-top: 100px; /* Ajustez selon vos besoins */
    padding-bottom: 50px; /* Ajustez selon vos besoins */
}

/* Style de l'image */
.profile_image {
    width: 150px; /* Ajustez selon vos besoins */
    height: auto; /* Pour maintenir le ratio de l'image */
    margin-bottom: 20px; /* Ajustez selon vos besoins */
}

/* Style du titre */
.welc {
    font-size: 2.5rem; /* Ajustez selon vos besoins */
    font-weight: bold;
    text-align: center;
    margin-bottom: 20px; /* Ajustez selon vos besoins */
}

/* Style de la division */
.divi {
    width: 50px; /* Ajustez selon vos besoins */
    height: 2px; /* Ajustez selon vos besoins */
    background-color: #333; /* Couleur de la division */
}

/* Style de l'icône dans la division */
.divider-custom-icon i {
    font-size: 1.5rem; /* Ajustez selon vos besoins */
    color: #333; /* Couleur de l'icône */
    margin-top: 10px; /* Ajustez selon vos besoins */
}

</style>
</head>
<body id="page-top">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark p-3">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">GouGou</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
    
      <div class=" collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ms-auto ">
          <li class="nav-item">
            <a class="nav-link mx-2 active" aria-current="page" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link mx-2" href="logout">Logout</a>
          </li>
           <li class="nav-item">
			<a type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"> Profile </a>
          </li>
        </ul>
      </div>
    </div>
    </nav>
	<header>
			<div class="boddy">
			<% if (session.getAttribute("profile_image") != null) { %>
	            <img class="profile_image" src="data:image/jpeg;base64, <%= session.getAttribute("profile_image") %>"/>
	        <% } else { %>
	            <img class="profile_image" src="avataaars.svg"/>
	        <% } %>
			<h1 class="welc">Welcome Mr.<span style="text-transform: uppercase;"> <%= session.getAttribute("name") %></span></h1>
			<div class="divi">
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
			</div>
		</div>
	</header>
	<div id="carouselExample" class="carousel slide">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	      <img src="1.jpg" class="d-block w-100" style="height: 500px;" alt="ramadan">
	    </div>
	    <div class="carousel-item">
	      <img src="2.jpg" class="d-block w-100" style="height: 500px;" alt="ramadan">
	    </div>
	    <div class="carousel-item">
	      <img src="3.jpg" class="d-block w-100" style="height: 500px;" alt="ramadan">
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	</div>

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small style="color: black;">Copyright &copy; Your Website 2021</small>
		</div>
	</div>
	
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"> User Information: </h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
	     <div class="modal-body">
		    <p>Name: <%=session.getAttribute("name") %></p>
		    <p>Email: <%=session.getAttribute("email") %></p>
		    <p>Password: <%=session.getAttribute("password") %></p>
		    <p>Phone: <%=session.getAttribute("phone") %></p>
		    <p>dateN: <%=session.getAttribute("naissance") %></p>
		    
		</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
	
	
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
	
</body>
</html>
