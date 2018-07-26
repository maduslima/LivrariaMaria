<%@page import="modelo.Cliente"%>
<%
    if(session.getAttribute("cliente")==null){
        response.sendRedirect("login.jsp");
        return;
    }
    if(session.getAttribute("carrinho")==null){
        response.sendRedirect("index.jsp");
        return;
    }
    Cliente cliente = (Cliente) session.getAttribute("cliente");
%>
<%@include file="cabecalho.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Checkout</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Wish shop project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/checkout.css">
        <link rel="stylesheet" type="text/css" href="styles/checkout_responsive.css">
    </head>
    <body>

        <div class="super_container">


            <!-- Home -->

            <div class="home">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/categories.jpg" data-speed="0.8"></div>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="home_container">
                                <div class="home_content">
                                    <div class="home_title">Checkout</div>
                                    <div class="breadcrumbs">
                                        <ul>
                                            <li><a href="index.html">Home</a></li>
                                            <li><a href="index.html">Shopping Cart</a></li>
                                            <li>Shopping Cart</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Checkout -->

            <div class="checkout">
                <div class="container">
                    <div class="row">

                        <!-- Billing Details -->
                        <div class="col-lg-6">
                            <div class="billing">
                                <div class="checkout_title">Dados da compra</div>
                                <div class="checkout_form_container">
                                    <form action="#" id="checkout_form">
                                        <div class="d-flex flex-lg-row flex-column align-items-start justify-content-between">
                                            <label for=fname>Nome:</label>
                                            <%=cliente.getNome()%>
                                        </div>
                                          <div class="d-flex flex-lg-row flex-column align-items-start justify-content-between">
                                            <label for=fname>Endereço:</label>
                                            <%=cliente.getEndereco()%>
                                        </div>
                          
                                        
                    
                                            
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Cart Details -->
                        <div class="col-lg-6">
                            <div class="cart_details">
                                <div class="checkout_title">Total Carrinho</div>
                                <div class="cart_total">
                                    <ul>
                                        <li class="d-flex flex-row align-items-center justify-content-start">
                                            <div class="cart_total_title">Produto</div>
                                            <div class="cart_total_price ml-auto">Total</div>
                                        </li>
                                        <li class="d-flex flex-row align-items-center justify-content-start">
                                            <div class="cart_total_title">2 Piece Swimsuit x1</div>
                                            <div class="cart_total_price ml-auto">$35.00</div>
                                        </li>
                                        <li class="d-flex flex-row align-items-center justify-content-start">
                                            <div class="cart_total_title">Subtotal</div>
                                            <div class="cart_total_price ml-auto">$35.00</div>
                                        </li>
                                        <li class="d-flex flex-row align-items-center justify-content-start">
                                            <div class="cart_total_title">Shipping</div>
                                            <div class="cart_total_price ml-auto">$5.00</div>
                                        </li>
                                        <li class="d-flex flex-row align-items-start justify-content-start total_row">
                                            <div class="cart_total_title">Total</div>
                                            <div class="cart_total_price ml-auto">$40.00</div>
                                        </li>
                                    </ul>
                                </div>
                                <div class="payment_options">
                                    <div>
                                        <input type="radio" id="radio_payment_1" name="regular_radio" class="regular_radio">
                                        <label for="radio_payment_1">Dinheiro</label>
                                    </div>
                                    <div>
                                        <input type="radio" id="radio_payment_2" name="regular_radio" class="regular_radio" checked>
                                        <label for="radio_payment_2">Cartão</label>
                                        <div class="visa payment_option"><a href="#"><img src="images/visa.jpg" alt=""></a></div>
                                        <div class="master payment_option"><a href="#"><img src="images/master.jpg" alt=""></a></div>
                                    </div>
                                    <button class="cart_total_button">Finalizar Compra</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

           
           

        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="styles/bootstrap4/popper.js"></script>
        <script src="styles/bootstrap4/bootstrap.min.js"></script>
        <script src="plugins/easing/easing.js"></script>
        <script src="plugins/parallax-js-master/parallax.min.js"></script>
        <script src="js/checkout_custom.js"></script>
    </body>
</html>
<%@include file="rodape.jsp"%>