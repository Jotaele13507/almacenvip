<?php
session_start();
include('include/config.php');
if (strlen($_SESSION['alogin']) == 0) {
	header('location:index.php');
} else {
	$pid = intval($_GET['id']); // product id
	if (isset($_POST['submit'])) {
		$category = $_POST['category'];
		$productcode = $_POST['productCode'];
		$productlocation = $_POST['productLocation'];
		$productname = $_POST['productName'];
		$productcompany = $_POST['productCompany'];
		$productprice = $_POST['productPrice'];
		$productdescription = $_POST['productDescription'];
		$productavailability = $_POST['productAvailability'];
		$unit = $_POST['unit'];

		$sql = mysqli_query($con, "update  products set category='$category',productCode='$productcode',productLocation='$productlocation',productName='$productname',productCompany='$productcompany',productPrice='$productprice',productDescription='$productdescription',productAvailability='$productavailability',unit='$unit' where id='$pid'");
		$_SESSION['msg'] = "Producto actualizado correctamente !!";
	}


?>
	<!DOCTYPE html>
	<html lang="es">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Admin| Editar Productos</title>
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
					<div class="span9">
						<div class="content">

							<div class="module">
								<div class="module-head">
									<h3>Editar productos</h3>
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

										<?php

										$query = mysqli_query($con, "select products.*,category.categoryName as catname,category.id as cid,unit.unitType as uType,unit.id as unitid from products join category on category.id=products.category join unit on unit.id=products.unit where products.id='$pid'");
										$cnt = 1;
										while ($row = mysqli_fetch_array($query)) {



										?>


											<div class="control-group">
												<label class="control-label" for="basicinput">Categoría</label>
												<div class="controls">
													<select name="category" class="span8 tip" onChange="getSubcat(this.value);" required>
														<option value="<?php echo htmlentities($row['cid']); ?>"><?php echo htmlentities($row['catname']); ?></option>
														<?php $query = mysqli_query($con, "select * from category");
														while ($rw = mysqli_fetch_array($query)) {
															if ($row['catname'] == $rw['categoryName']) {
																continue;
															} else {
														?>

																<option value="<?php echo $rw['id']; ?>"><?php echo $rw['categoryName']; ?></option>
														<?php }
														} ?>
													</select>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Código del producto</label>
												<div class="controls">
													<input type="text" name="productCode" placeholder="Ingrese el código del producto" value="<?php echo htmlentities($row['productCode']); ?>" class="span8 tip" required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Ubicación del producto</label>
												<div class="controls">
													<input type="text" name="productLocation" placeholder="Ingrese la Ubicación del producto" value="<?php echo htmlentities($row['productLocation']); ?>" class="span8 tip" required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Nombre de producto</label>
												<div class="controls">
													<input type="text" name="productName" placeholder="Ingrese nombre de producto" value="<?php echo htmlentities($row['productName']); ?>" class="span8 tip">
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Marca del producto</label>
												<div class="controls">
													<input type="text" name="productCompany" placeholder="Ingrese marca del producto" value="<?php echo htmlentities($row['productCompany']); ?>" class="span8 tip" required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Precio del producto</label>
												<div class="controls">
													<input type="text" name="productPrice" placeholder="Ingrese precio del producto" value="<?php echo htmlentities($row['productPrice']); ?>" class="span8 tip" required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Descripción del Producto</label>
												<div class="controls">
													<textarea name="productDescription" placeholder="Ingrese descripción del producto" rows="6" class="span8 tip">
														<?php echo htmlentities($row['productDescription']); ?>
													</textarea>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Cantidad Disponible</label>
												<div class="controls">
													<input type="text" name="productAvailability" placeholder="Ingrese precio del producto" value="<?php echo htmlentities($row['productPrice']); ?>" class="span8 tip" required>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Unidad</label>
												<div class="controls">
													<select name="unit" class="span8 tip" onChange="getSubcat(this.value);" required>
														<option value="<?php echo htmlentities($row['unitid']); ?>"><?php echo htmlentities($row['uType']); ?></option>
														<?php $query = mysqli_query($con, "select * from unit");
														while ($rw = mysqli_fetch_array($query)) {
															if ($row['uType'] == $rw['unitType']) {
																continue;
															} else {
														?>

																<option value="<?php echo $rw['id']; ?>"><?php echo $rw['unitType']; ?></option>
														<?php }
														} ?>
													</select>
												</div>
											</div>

											<div class="control-group">
												<label class="control-label" for="basicinput">Imagen del producto</label>
												<div class="controls">
													<img src="productimages/<?php echo htmlentities($pid); ?>/<?php echo htmlentities($row['productImage1']); ?>" width="200" height="100"> <a href="update-image1.php?id=<?php echo $row['id']; ?>">Cambiar Imagen</a>
												</div>
											</div>
										<?php } ?>
										<div class="control-group">
											<div class="controls">
												<button type="submit" name="submit" class="btn btn-warning">Actualizar</button>
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