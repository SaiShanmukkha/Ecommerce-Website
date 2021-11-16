<html>
<head>
<title>EcomApp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<%@ include file="components/common.jsp"%>
<style>
.jumbotron {
	background-color: #f4511e !important;
	color: #ffffff;
	border-top: solid;
}

.logo-small {
	color: #f4511e !important;
	font-size: 50px;
}

footer {
	background-color: #1f5f1e !important;
}

footer form-control {
	background-color: white;
	box-shadow: 0 1px 0 0 rgba(255, 255, 255, 0.9);
	border: none;
	resize: none;
	color: #d1d2d2;
	padding: 07.em 1em;
}

footer a, footer h5 {
	color: white;
}

footer a:hover, footer a:focus {
	color: #aaa;
	text-decoration: none;
	border-bottom: 1px dotted #999;
}
</style>
</head>

<body>

<%@ include file="components/navbar.jsp"%>
	<div class="container mt-5">

		<!-- Navigation Bar -->
		<div class="jumbotron text-center">
			<h1>EcomApp</h1>
			<p>online merchandise for everyone</p>
			<div class="container " style="width: 40%; align: middle">
				<div>
					<div class="input-group">
						<input type="email" class="form-control"
							placeholder="Enter your email address..." required>
						<button class="btn btn-primary" value="subscribe">Subscribe</button>
					</div>
				</div>
			</div>
		</div>

		<!-- Services Section -->
		<div class="container-fluid text-center">
			<div>
				<h1>Services</h1>
				<p>What we offer</p>

				<div class="row">
					<div class="col-md-4">
						<span><i class="fa fa-laptop logo-small" aria-hidden="true"></i></span>
						<h4>Laptops</h4>
						<p>About Laptops</p>
					</div>
					<div class="col-md-4">
						<span><i class="fas fa-mobile logo-small"></i></span>
						<h4>Mobiles</h4>
						<p>About Laptops</p>
					</div>
					<div class="col-md-4">
						<span><i class="fas fa-keyboard logo-small"></i></span>
						<h4>Keyboards</h4>
						<p>About Keyboards</p>
					</div>
				</div>
				<div class="row">
					<div class="col-md-4">
						<span><i class="fas fa-gifts logo-small"></i></span>
						<h4>GIFTS</h4>
						<p>About Gifts</p>
					</div>
					<div class="col-md-4">
						<span><i class="fas fa-clock logo-small"></i></span>
						<h4>Watches</h4>
						<p>About Watches</p>
					</div>
					<div class="col-md-4">
						<span><i class="fa fa-headphones logo-small"
							aria-hidden="true"></i></span>
						<h4>Headphones</h4>
						<p>About Headphones</p>
					</div>
				</div>
			</div>
		</div>

		<!-- CarouselSection-->
		<div class="mt-5 md-5">
			<div id="carouselExampleIndicators" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleIndicators" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
					<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100"
							src="https://thumbs.dreamstime.com/b/concept-open-magic-book-pages-water-land-small-child-fantasy-nature-learning-copy-space-166401875.jpg"
							alt="First slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://thumbs.dreamstime.com/b/concept-open-magic-book-pages-water-land-small-child-fantasy-nature-learning-copy-space-166401875.jpg"
							alt="Second slide">
					</div>
					<div class="carousel-item">
						<img class="d-block w-100"
							src="https://thumbs.dreamstime.com/b/concept-open-magic-book-pages-water-land-small-child-fantasy-nature-learning-copy-space-166401875.jpg"
							alt="Third slide">
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleIndicators"
				
				
				
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>

		<footer>
			<div class="p-4">
				<div class="row">
					<div class="col-md-5">
						<h5>
							<i class="fas fa-road  logo-small"></i>&nbsp;EcomApp
						</h5>
						<div class="row">
							<div class="col-6">
								<ul class="list-unstyled">
									<li><a href="#">Products</a></li>
									<li><a href="#">Benefits</a></li>
									<li><a href="#">Partners</a></li>
									<li><a href="#">Team</a></li>
								</ul>
							</div>
							<div class="col-6">
								<ul class="list-unstyled">
									<li><a href="#">Documentation</a></li>
									<li><a href="#">Stories</a></li>
									<li><a href="#">Legal Terms</a></li>
									<li><a href="#">Jobs</a></li>
								</ul>
							</div>
						</div>
					</div>


					<div class="col-md-2">
						<h5 class="text-md-right">Contact Us:</h5>
					</div>


					<div class="col-md-5">
						<form>
							<fieldset class="form-group">
								<input type="email" class="form-control"
									placeholder="Enter email..." id="email">
							</fieldset>
							<fieldset class="form-group">
								<textarea class="form-control" placeholder="Enter comments..."
									id="message"></textarea>
							</fieldset>
							<fieldset class="form-group">
								<button type="button" class="btn btn-secondray-outlined">Send</button>
							</fieldset>
						</form>
					</div>

					<div class="nav ">
						<ul class="nav nav-pills nav-fills">
							<li class="nav-item"><a class="nav-link " href="#"><i
									class="fab fa-facebook fa-lg"></i></a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fab fa-github fa-lg"></i></a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fab fa-twitter fa-lg"></i></a></li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fab fa-instagram fa-lg"></i></a></li>
						</ul>
					</div>

				</div>
			</div>
		</footer>

	</div>


</body>
</html>
