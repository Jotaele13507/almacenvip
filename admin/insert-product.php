<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
	header('location:index.php');
} else {

	if (isset($_POST['submit'])) {
		$category = $_POST['category'];
		$productcode = $_POST['productCode'];
		$productlocation = $_POST['productLocation'];
		$productname = $_POST['productName'];
		$productcompany = $_POST['productCompany'];
		$productprice = $_POST['productPrice'];
		$productdescription = $_POST['productDescription'];
		$productimage1 = $_FILES["productimage1"]["name"];
		$productavailability = $_POST['productAvailability'];
		$unit = $_POST['unit'];
		//for getting product id
		$query = mysqli_query($con, "select max(id) as pid from products");
		$result = mysqli_fetch_array($query);
		$productid = $result['pid'] + 1;
		$dir = "productimages/$productid";
		if (!is_dir($dir)) {
			mkdir("productimages/" . $productid);
		}

		move_uploaded_file($_FILES["productimage1"]["tmp_name"], "productimages/$productid/" . $_FILES["productimage1"]["name"]);

		$sql = mysqli_query($con, "insert into products(category,productCode,productLocation,productName,productCompany,productPrice,productDescription,productImage1,productAvailability,unit) values('$category','$productcode','$productlocation','$productname','$productcompany','$productprice','$productdescription','$productimage1','$productavailability','$unit')");
		$_SESSION['msg'] = "Product Inserted Successfully !!";
	}


?>
	<!DOCTYPE html>
	<html lang="es">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Admin| Insertar Producto</title>
		<link type="text/css" href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
		<link type="text/css" href="bootstrap/css/bootstrap-responsive.min.css" rel="stylesheet">
		<link type="text/css" href="css/theme.css" rel="stylesheet">
		<link type="text/css" href="images/icons/css/font-awesome.css" rel="stylesheet">
		<link type="text/css" href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,600italic,400,600' rel='stylesheet'>
		<script src="http://js.nicedit.com/nicEdit-latest.js" type="text/javascript"></script>
		<script type="text/javascript">
			bkLib.onDomLoaded(nicEditors.allTextAreas);
		</script>

	</head>

	<body>
		<?php include('include/header.php'); ?>

		<div class="wrapper">
			<div class="container">
				<div class="row">
					<?php include('include/sidebar.php'); ?>
					<div class="span11">
						<div class="content">

							<div class="module">
								<div class="module-head">
									<h3>Insertar Producto</h3>
								</div>
								<div class="module-body">

									<?php if (isset($_POST['submit'])) { ?>
										<div class="alert alert-success">
											<button type="button" class="close" data-dismiss="alert">×</button>
											<strong>Todo bien!</strong> <?php echo htmlentities($_SESSION['msg']); ?><?php echo htmlentities($_SESSION['msg'] = ""); ?>
										</div>
									<?php } ?>


									<?php if (isset($_GET['del'])) { ?>
										<div class="alert alert-error">
											<button type="button" class="close" data-dismiss="alert">×</button>
											<strong>Oh vaya!</strong> <?php echo htmlentities($_SESSION['delmsg']); ?><?php echo htmlentities($_SESSION['delmsg'] = ""); ?>
										</div>
									<?php } ?>

									<br />

									<form class="form-horizontal row-fluid" name="insertproduct" method="post" enctype="multipart/form-data">

										<div class="control-group">
											<label class="control-label" for="basicinput">Categoría</label>
											<div class="controls">
												<select name="category" class="span8 tip" required>
													<option value="">Seleccione categoría</option>
													<?php $query = mysqli_query($con, "select * from category");
													while ($row = mysqli_fetch_array($query)) { ?>

														<option value="<?php echo $row['id']; ?>"><?php echo $row['categoryName']; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Código del producto</label>
											<div class="controls">
												<input type="text" name="productCode" placeholder="Ingrese el código del producto" class="span8 tip" required>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Ubicación del producto</label>
											<div class="controls">
												<input type="text" name="productLocation" placeholder="Ingrese la Ubicación del producto" class="span8 tip" required>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Nombre del producto</label>
											<div class="controls">
												<input type="text" name="productName" placeholder="Ingrese nombre del producto" class="span8 tip" required>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Marca del producto</label>
											<div class="controls">
												<input type="text" name="productCompany" placeholder="Ingrese marca del producto" class="span8 tip" required>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Precio del producto</label>
											<div class="controls">
												<input type="text" name="productPrice" placeholder="Ingrese precio del producto" class="span8 tip" required>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Descripción del producto</label>
											<div class="controls">
												<textarea name="productDescription" placeholder="Ingrese descripción del producto" rows="6" class="span8 tip"></textarea>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Imagen del producto</label>
											<div class="controls">
												<input type="file" name="productimage1" id="productimage1" value="" class="span8 tip" required>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Cantidad disponible</label>
											<div class="controls">
												<input type=number name="productAvailability" id="productAvailability" class="span8 tip" required>
											</div>
										</div>

										<div class="control-group">
											<label class="control-label" for="basicinput">Unidad</label>
											<div class="controls">
												<select name="unit" class="span8 tip" required>
													<option value="">Seleccione categoría</option>
													<?php $query = mysqli_query($con, "select * from unit");
													while ($row = mysqli_fetch_array($query)) { ?>

														<option value="<?php echo $row['id']; ?>"><?php echo $row['unitType']; ?></option>
													<?php } ?>
												</select>
											</div>
										</div>

										<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn btn-success">Publicar</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
						<!--/.content-->
					</div>
					<!--/.span9-->
				</div>
			</div>
			<!--/.container-->
		</div>
		<!--/.wrapper-->

		<?php include('include/footer.php'); ?>

		<script src="scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
		<script src="scripts/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>
		<script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
		<script src="scripts/flot/jquery.flot.js" type="text/javascript"></script>
		<script src="scripts/datatables/jquery.dataTables.js"></script>
		<script>
			$(document).ready(function() {
				$('.datatable-1').dataTable();
				$('.dataTables_paginate').addClass("btn-group datatable-pagination");
				$('.dataTables_paginate > a').wrapInner('<span />');
				$('.dataTables_paginate > a:first-child').append('<i class="icon-chevron-left shaded"></i>');
				$('.dataTables_paginate > a:last-child').append('<i class="icon-chevron-right shaded"></i>');
			});
		</script>
	</body>
<?php } ?>