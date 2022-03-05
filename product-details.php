<?php
session_start();
error_reporting(0);
include('includes/config.php');
if (isset($_GET['action']) && $_GET['action'] == "add") {
	$id = intval($_GET['id']);
	if (isset($_SESSION['cart'][$id])) {
		$_SESSION['cart'][$id]['quantity']++;
	} else {
		$sql_p = "SELECT * FROM products WHERE id={$id}";
		$query_p = mysqli_query($con, $sql_p);
		if (mysqli_num_rows($query_p) != 0) {
			$row_p = mysqli_fetch_array($query_p);
			$_SESSION['cart'][$row_p['id']] = array("quantity" => 1, "price" => $row_p['productAvailability']);
			header('location:my-cart.php');
		} else {
			$message = "Product ID is invalid";
		}
	}
}
$pid = intval($_GET['pid']);
if (isset($_GET['pid']) && $_GET['action'] == "wishlist") {
	if (strlen($_SESSION['login']) == 0) {
		header('location:login.php');
	} else {
		mysqli_query($con, "insert into wishlist(userId,productId) values('" . $_SESSION['id'] . "','$pid')");
		echo "<script>alert('Product aaded in wishlist');</script>";
		header('location:my-wishlist.php');
	}
}
if (isset($_POST['submit'])) {
	$qty = $_POST['quality'];
	$price = $_POST['price'];
	$value = $_POST['value'];
	$name = $_POST['name'];
	$summary = $_POST['summary'];
	$review = $_POST['review'];
	mysqli_query($con, "insert into productreviews(productId,quality,price,value,name,summary,review) values('$pid','$qty','$price','$value','$name','$summary','$review')");
}


?>
<!DOCTYPE html>
<html lang="es">

<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="keywords" content="MediaCenter, Template, eCommerce">
	<meta name="robots" content="all">
	<title>Detalles del Producto</title>
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/main.css">
	<link rel="stylesheet" href="assets/css/green.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<link rel="stylesheet" href="assets/css/owl.transitions.css">
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

	<!-- Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
	<link rel="shortcut icon" href="assets/images/favicon.ico">
</head>

<body class="cnt-home">

	<header class="header-style-1">

		<!-- ============================================== TOP MENU ============================================== -->
		<?php include('includes/top-header.php'); ?>
		<!-- ============================================== TOP MENU : END ============================================== -->
		<?php include('includes/main-header.php'); ?>
		<!-- ============================================== NAVBAR ============================================== -->
		<?php include('includes/menu-bar.php'); ?>
		<!-- ============================================== NAVBAR : END ============================================== -->

	</header>

	<!-- ============================================== HEADER : END ============================================== -->
	<div class="body-content outer-top-xs">
		<div class='container'>
			<div class='row single-product outer-bottom-sm '>
				<!-- ==============================================CATEGORY============================================== -->
				<div class="col-xs-12 col-sm-12 col-md-3 sidebar">
					<!-- ================================== TOP NAVIGATION ================================== -->
					<?php include('includes/side-menu.php'); ?>
					<!--MENÚ DE LA IZQUIERDA CON LAS CATEGORIAS -->
					<!-- ================================== TOP NAVIGATION : END ================================== -->
				</div><!-- /.sidemenu-holder -->
				<!-- ============================================== CATEGORY : END ============================================== -->
				<?php
				$ret = mysqli_query($con, "select products.*,category.categoryName as catname,category.id as cid,unit.unitType as uType,unit.id as unitid from products join category on category.id=products.category join unit on unit.id=products.unit where products.id='$pid'");
				//Query que busca los productos y compara el campo unit de la tabla products con el campo unitType de la tabla unit para mostrar el tipo de unidad en vez del id de la unidad.
				while ($row = mysqli_fetch_array($ret)) {

				?>
					<div class='col-md-9'>
						<div class="row  wow fadeInUp">
							<div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
								<div class="product-item-holder size-big single-product-gallery small-gallery">

									<div id="owl-single-product">

										<div class="single-product-gallery-item" id="slide1">
											<a data-lightbox="image-1" data-title="<?php echo htmlentities($row['productName']); ?>" href="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>">
												<img class="img-responsive" alt="" src="assets/images/blank.gif" data-echo="admin/productimages/<?php echo htmlentities($row['id']); ?>/<?php echo htmlentities($row['productImage1']); ?>" width="370" height="350" />
											</a>
										</div>

									</div><!-- /.single-product-slider -->
								</div>
							</div>
							<div class='col-sm-6 col-md-7 product-info-block'>
								<div class="product-info">
									<h1 class="name"><?php echo htmlentities($row['productName']); ?></h1>
									<?php $rt = mysqli_query($con, "select * from productreviews where productId='$pid'");
									$num = mysqli_num_rows($rt); {
									?>
										<div class="rating-reviews m-t-20">
											<div class="row">
												<div class="col-sm-8">
												</div>
											</div><!-- /.row -->
										</div><!-- /.rating-reviews -->
									<?php } ?>
									<div class="stock-container info-container m-t-10">
										<div class="row">
											<div class="col-sm-3">
												<div class="stock-box">
													<span class="label">Marca:</span>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="stock-box">
													<span class="value"><?php echo htmlentities($row['productCompany']); ?></span>
												</div>
											</div>
										</div><!-- /.row -->
									</div>
									<div class="stock-container info-container m-t-10">
										<div class="row">
											<div class="col-sm-3">
												<div class="stock-box">
													<span class="label">Unidad:</span>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="stock-box">
													<span class="value"><?php echo htmlentities($row['uType']); ?></span>
												</div>
											</div>
										</div><!-- /.row -->
									</div>
									<div class="stock-container info-container m-t-10">
										<div class="row">
											<div class="col-sm-3">
												<div class="stock-box">
													<span class="label">CANT. DISPONIBLE:</span>
												</div>
											</div>
											<div class="col-sm-9">
												<div class="stock-box">
													<span class="value"><?php echo htmlentities($row['productAvailability']); ?></span>
												</div>
											</div>
										</div><!-- /.row -->
									</div>
									<div class="quantity-container info-container">
										<div class="row">
											<div class="col-sm-2">
												<span class="label">Cantidad :</span>
											</div>

											<div class="col-sm-2">
												<div class="cart-quantity">
													<div class="quant-input">
														<?php
														$proavai = $row['productAvailability'];
														if ($proavai >= 1) {
															echo '<div class="arrows">
															<div class="arrow plus gradient"><span class="ir"><i class="icon fa fa-sort-asc"></i></span></div>
															<div class="arrow minus gradient"><span class="ir"><i class="icon fa fa-sort-desc"></i></span></div>
														</div>';
															echo '<input type="text" value="1">';
														} else {
															echo '<span> No se puede pedir este producto </span>';;
														}
														?>
													</div>
												</div>
											</div>
											<div class="col-sm-7">
												<!-- Aquí debe ir una condición que no deje comprar si la cantidad disponible es 0-->
												<?php
												$proavai = $row['productAvailability'];
												$di =  $row['id'];
												if ($proavai >= 1) {
													echo '<a href="product-details.php?page=product&action=add&id=' . $di . '"class="btn btn-primary"><i class="fa fa-shopping-cart inner-right-vs"></i> Agregar a compras</a>';
												} else {
												}
												?>
											</div>
										</div><!-- /.row -->
									</div><!-- /.quantity-container -->
								</div><!-- /.product-info -->
							</div><!-- /.col-sm-7 -->
						</div><!-- /.row -->
						<div class="product-tabs inner-bottom-xs  wow fadeInUp">
							<div class="row">
								<div class="col-sm-3">
									<ul id="product-tabs" class="nav nav-tabs nav-tab-cell">
										<li class="active"><a data-toggle="tab" href="#description">DESCRIPCIÓN</a></li>
									</ul><!-- /.nav-tabs #product-tabs -->
								</div>
								<div class="col-sm-9">
									<div class="tab-content">
										<div id="description" class="tab-pane in active">
											<div class="product-tab">
												<p class="text"><?php echo $row['productDescription']; ?></p>
											</div>
										</div><!-- /.tab-pane -->
									</div><!-- /.product-tab -->
								</div><!-- /.tab-pane -->
							</div><!-- /.tab-content -->
						</div><!-- /.col -->
					</div><!-- /.row -->
			</div><!-- /.product-tabs -->

		<?php $cid = $row['category'];
				} ?>
		<!-- ============================================== UPSELL PRODUCTS ============================================== -->
		<!-- ============================================== UPSELL PRODUCTS : END ============================================== -->

		</div><!-- /.col -->
		<div class="clearfix"></div>
	</div>
	</div>
	</div>
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

	<!-- For demo purposes – can be removed on production -->

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