<?php

if (isset($_Get['action'])) {
	if (!empty($_SESSION['cart'])) {
		foreach ($_POST['quantity'] as $key => $val) {
			if ($val == 0) {
				unset($_SESSION['cart'][$key]);
			} else {
				$_SESSION['cart'][$key]['quantity'] = $val;
			}
		}
	}
}
?>
<div class="main-header">
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-3 logo-holder">
				<!-- ============================================================= LOGO ============================================================= -->
				<div class="logo">
					<a href="index.php">

						<h2>ALMACEN VIP</h2>

					</a>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-6 top-search-holder">
				<div class="search-area">
					<form name="search" method="post" action="search-result.php">
						<div class="control-group">

							<input class="search-field" placeholder="Buscar aqui..." name="product" required="required" />

							<button class="search-button" type="submit" name="search"></button>

						</div>
					</form>
				</div><!-- /.search-area -->
				<!-- ============================================================= SEARCH AREA : END ============================================================= -->
			</div><!-- /.top-search-holder -->

			<div class="col-xs-12 col-sm-12 col-md-3 animate-dropdown top-cart-row">
				<!-- ============================================================= SHOPPING CART DROPDOWN ============================================================= -->
				<?php
				if (!empty($_SESSION['cart'])) {
				?>
					<div class="dropdown dropdown-cart">
						<a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
							<div class="items-cart-inner">
								<div class="total-price-basket">
									<span class="lbl">CESTA</span>
								</div>
								<div class="basket">
									<i class="glyphicon glyphicon-shopping-cart"></i>
								</div>
								<div class="basket-item-count"><span class="count"><?php echo $_SESSION['qnty']; ?></span></div>

							</div>
						</a>
						<ul class="dropdown-menu">

							<?php
							$sql = "SELECT * FROM products WHERE id IN(";
							foreach ($_SESSION['cart'] as $id => $value) {
								$sql .= $id . ",";
							}
							$sql = substr($sql, 0, -1) . ") ORDER BY id ASC";
							$query = mysqli_query($con, $sql);
							//$totalprice = 0;
							$totalqunty = 0;
							if (!empty($query)) {
								while ($row = mysqli_fetch_array($query)) { //Esto me sirve
									$quantity = $_SESSION['cart'][$row['id']]['quantity'];
									//$subtotal = $_SESSION['cart'][$row['id']]['quantity'] * $row['productPrice'] + $row['shippingCharge'];
									//$totalprice += $subtotal;
									$_SESSION['qnty'] = $totalqunty += $quantity;
									$tt = $_SESSION['qnty'];

							?>


									<li>
										<div class="cart-item product-summary">
											<div class="row">
												<div class="col-xs-7">
													<h3 class="name"><a href="index.php?page-detail"><?php echo $row['productName']; ?></a></h3>
													<div class="price"> Cant. solicitada <?php echo $_SESSION['cart'][$row['id']]['quantity']; ?></div>
													<hr>
												</div>
											</div>
										</div><!-- /.cart-item -->

								<?php }
							} ?>
								<div class="clearfix"></div>


								<div class="clearfix cart-total">
									<div class="pull-right">

										<span class="text">Cantidad de productos:</span><span class='price'><?php echo $_SESSION['tp'] = "$tt"; ?></span>

									</div>

									<div class="clearfix"></div>

									<a href="my-cart.php" class="btn btn-upper btn-primary btn-block m-t-20">Mi cesta</a>
								</div><!-- /.cart-total-->


									</li>
						</ul><!-- /.dropdown-menu-->
					</div><!-- /.dropdown-cart -->
				<?php } else { ?>
					<div class="dropdown dropdown-cart">
						<a href="#" class="dropdown-toggle lnk-cart" data-toggle="dropdown">
							<div class="items-cart-inner">
								<div class="total-price-basket">
									<span class="lbl">Cesta -</span>
									<span class="total-price">

										<span class="value">0 Productos</span>
									</span>
								</div>
								<div class="basket">
									<i class="glyphicon glyphicon-shopping-cart"></i>
								</div>
								<div class="basket-item-count"><span class="count">0</span></div>

							</div>
						</a>
						<ul class="dropdown-menu">




							<li>
								<div class="cart-item product-summary">
									<div class="row">
										<div class="col-xs-12">
											Cesta vacia.
										</div>


									</div>
								</div><!-- /.cart-item -->


								<hr>

								<div class="clearfix cart-total">

									<div class="clearfix"></div>

									<a href="index.php" class="btn btn-upper btn-primary btn-block m-t-20">Seguir pidiendo</a>
								</div><!-- /.cart-total-->


							</li>
						</ul><!-- /.dropdown-menu-->
					</div>
				<?php } ?>




				<!-- ============================================================= SHOPPING CART DROPDOWN : END============================================================= -->
			</div><!-- /.top-cart-row -->
		</div><!-- /.row -->

	</div><!-- /.container -->

</div>