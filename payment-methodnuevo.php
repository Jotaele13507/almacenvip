<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (strlen($_SESSION['login']) == 0) {
	header('location:login.php');
} else {
	if (isset($_POST['submit'])) {

		mysqli_query($con, "update orders set 	paymentMethod='" . $_POST['paymethod'] . "' where userId='" . $_SESSION['id'] . "' and paymentMethod is null ");
		unset($_SESSION['cart']);
		header('location:order-history.php');
	} else {
		if (isset($_POST['submitdc'])) {

			mysqli_query($con, "update orders set 	paymentMethod='" . $_POST['paymethod'] . "' where userId='" . $_SESSION['id'] . "' and paymentMethod is null ");
			unset($_SESSION['cart']);
			header('location:tdcpay.php');
		}
?>
		<!DOCTYPE html>
		<html lang="es">

		<head>
			<!-- Meta -->
			<meta charset="utf-8">
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
			<meta name="description" content="">
			<meta name="author" content="">
			<meta name="keywords" content="MediaCenter, Template, eCommerce">
			<meta name="robots" content="all">

			<title>TECHVISION | Método de Pago</title>
			<link rel="stylesheet" href="assets/css/bootstrap.min.css">
			<link rel="stylesheet" href="assets/css/main.css">
			<link rel="stylesheet" href="assets/css/green.css">
			<link rel="stylesheet" href="assets/css/owl.carousel.css">
			<link rel="stylesheet" href="assets/css/owl.transitions.css">
			<!--<link rel="stylesheet" href="assets/css/owl.theme.css">-->
			<link href="assets/css/lightbox.css" rel="stylesheet">
			<link rel="stylesheet" href="assets/css/animate.min.css">
			<link rel="stylesheet" href="assets/css/rateit.css">
			<link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
			<link rel="stylesheet" href="assets/css/config.css">
			<link href="assets/css/green.css" rel="alternate stylesheet" title="Green color">
			<link href="assets/css/blue.css" rel="alternate stylesheet" title="Blue color">
			<link href="assets/css/red.css" rel="alternate stylesheet" title="Red color">
			<link href="assets/css/orange.css" rel="alternate stylesheet" title="Orange color">
			<link href="assets/css/dark-green.css" rel="alternate stylesheet" title="Darkgreen color">
			<link rel="stylesheet" href="assets/css/font-awesome.min.css">
			<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
			<link rel="shortcut icon" href="assets/images/favicon.ico">
		</head>

		<body class="cnt-home">


			<header class="header-style-1">
				<?php include('includes/top-header.php'); ?>
				<?php include('includes/main-header.php'); ?>
				<?php include('includes/menu-bar.php'); ?>
			</header>
			<div class="breadcrumb">
				<div class="container">
					<div class="breadcrumb-inner">
						<ul class="list-inline list-unstyled">
							<li><a href="home.html">Inicio</a></li>
							<li class='active'>Método de Pago</li>
						</ul>
					</div><!-- /.breadcrumb-inner -->
				</div><!-- /.container -->
			</div><!-- /.breadcrumb -->

			<div class="body-content outer-top-bd">
				<div class="container">
					<div class="checkout-box faq-page inner-bottom-sm">
						<div class="row">
							<div class="col-md-12">
								<h2>Elija un método de pago</h2>
								<div class="panel-group checkout-steps" id="accordion">
									<!-- checkout-step-01  -->
									<div class="panel panel-default checkout-step-01">

										<!-- panel-heading -->
										<div class="panel-heading">
											<h4 class="unicase-checkout-title">
												<a data-toggle="collapse" class="" data-parent="#accordion" href="#collapseOne">
													<span>1</span>Pago Directo
												</a>
											</h4>
										</div>
										<!-- panel-heading -->

										<div id="collapseOne" class="panel-collapse collapse in">

											<!-- panel-body  -->

											<div class="row">
												<div class="col-md-12 col-sm-12 already-registered-login">
													<div class="panel-body">
														<form name="payment" method="post">
															<div class="form-group" id="pay-now">
																<input type="radio" name="paymethod" value="Debit / Credit card"> Tarjeta de Crédito/Debito<br /><br />
																<input type="submit" value="CONTINUAR" name="submitdc" class="btn btn-primary">
															</div>
														</form>
													</div>
													<!-- already-registered-login -->
												</div>
											</div>

											<!-- panel-body  -->

										</div><!-- row -->
										<!-- Esto hace que colapse -->
									</div>
									<!-- checkout-step-01  -->
									<!-- checkout-step-02  -->
									<div class="panel panel-default checkout-step-02">
										<div class="panel-heading">
											<h4 class="unicase-checkout-title">
												<a data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseTwo">
													<span>2</span>Pago Contra Entrega
												</a>
											</h4>
										</div>
										<div id="collapseTwo" class="panel-collapse collapse">
											<div class="panel-body">
												<form name="payment" method="post">
													<input type="radio" name="paymethod" value="Debit / Credit card"> Tarjeta de Crédito/Debito<br /><br />
													<input type="radio" name="paymethod" value="COD"> Efectivo<br /><br />
													<input type="radio" name="paymethod" value="Internet Banking"> Transacción Bancaría<br /><br />
													<input type="submit" value="CONTINUAR" name="submit" class="btn btn-primary">
												</form>
											</div>
										</div>
									</div>
									<!-- checkout-step-02  -->

								</div><!-- /.checkout-steps -->
							</div>
						</div><!-- /.row -->
					</div><!-- /.checkout-box -->
					<!-- ============================================== BRANDS CAROUSEL ============================================== -->
					
					<!-- ============================================== BRANDS CAROUSEL : END ============================================== -->
				</div><!-- /.container -->
			</div><!-- /.body-content -->
			<?php include('includes/footer.php'); ?>
			<script src="assets/js/jquery-1.11.1.min.js"></script>

			<script src="assets/js/bootstrap.min.js"></script>

			<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
			<script src="assets/js/owl.carousel.min.js"></script>

			<script src="assets/js/echo.min.js"></script>
			<script src="assets/js/jquery.easing-1.3.min.js"></script>
			<script src="assets/js/bootstrap-slider.min.js"></script>
			<script src="assets/js/jquery.rateit.min.js"></script>
			<script type="text/javascript" src="assets/js/lightbox.min.js"></script>
			<script src="assets/js/bootstrap-select.min.js"></script>
			<script src="assets/js/wow.min.js"></script>
			<script src="assets/js/scripts.js"></script>

			<script src="switchstylesheet/switchstylesheet.js"></script>

			<script>
				$(document).ready(function() {
					$(".changecolor").switchstylesheet({
						seperator: "color"
					});
					$('.show-theme-options').click(function() {
						$(this).parent().toggleClass('open');
						return false;
					});
				});

				$(window).bind("load", function() {
					$('.show-theme-options').delay(2000).trigger('click');
				});
			</script>
			<!-- For demo purposes – can be removed on production : End -->



		</body>

		</html>
<?php }
} ?>