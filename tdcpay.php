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
        <!-- Scripts para TDC -->
        <link rel="stylesheet" type="text/css" href="assetscc/css/styles.css">
        <!-- Scripts para TDC -->
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
                                                <div class="creditCardForm">
                                                    <div class="heading">
                                                        <h1>Confirmar Información de su Targeta</h1>
                                                    </div>
                                                    <div class="payment">
                                                        <form name="payment" method="post">
                                                            <div class="form-group owner">
                                                                <label for="owner">Nombre</label>
                                                                <input type="text" class="form-control" id="owner">
                                                            </div>
                                                            <div class="form-group CVV">
                                                                <label for="cvv">CVV</label>
                                                                <input type="text" class="form-control" id="cvv">
                                                            </div>
                                                            <div class="form-group" id="card-number-field">
                                                                <label for="cardNumber">Número de la targeta</label>
                                                                <input type="text" class="form-control" id="cardNumber">
                                                            </div>
                                                            <div class="form-group" id="expiration-date">
                                                                <label>Año de Expiración</label>
                                                                <select>
                                                                    <option value="01">Enero</option>
                                                                    <option value="02">Febrero </option>
                                                                    <option value="03">Marzo</option>
                                                                    <option value="04">Abril</option>
                                                                    <option value="05">Mayo</option>
                                                                    <option value="06">Junio</option>
                                                                    <option value="07">Julio</option>
                                                                    <option value="08">Augosto</option>
                                                                    <option value="09">Septiembre</option>
                                                                    <option value="10">Octubre</option>
                                                                    <option value="11">Noviembre</option>
                                                                    <option value="12">Deciembre</option>
                                                                </select>
                                                                <select>
                                                                    <option value="21"> 2021</option>
                                                                    <option value="22"> 2022</option>
                                                                    <option value="23"> 2023</option>
                                                                    <option value="24"> 2024</option>
                                                                    <option value="25"> 2025</option>
                                                                    <option value="26"> 2026</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group" id="credit_cards">
                                                                <img src="assetscc/images/visa.jpg" id="visa">
                                                                <img src="assetscc/images/mastercard.jpg" id="mastercard">
                                                                <img src="assetscc/images/amex.jpg" id="amex">
                                                            </div>
                                                            <div class="form-group" id="pay-now">
                                                                <button type="submit" name="submit" class="btn btn-default" id="confirm-purchase">Confirmar</button>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                                <!-- already-registered-login -->
                                            </div>
                                        </div>

                                        <!-- panel-body  -->

                                    </div><!-- row -->
                                    <!-- Esto hace que colapse -->
                                </div>
                                <!-- checkout-step-01  -->
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

        <!-- Scripts para TDC -->

        <script src="assetscc/js/jquery.payform.min.js" charset="utf-8"></script>
        <script src="assetscc/js/script.js"></script>

        <!-- Scripts para TDC -->

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
<?php } ?>