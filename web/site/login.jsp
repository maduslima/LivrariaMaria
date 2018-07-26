<%@page import="dao.ClienteDAO"%>
<%
        ///se os dois campos forem informados, é login
    if (request.getParameter("txtEmail") != null
            && request.getParameter("txtSenha") != null) {
        
        ClienteDAO dao = new ClienteDAO();
        Cliente c = dao.logar(request.getParameter("txtEmail"),
                request.getParameter("txtSenha"));
        
        if (c != null) {
            session.setAttribute("cliente", c);
            response.sendRedirect("checkout.jsp");
            return;
        } 
        else {
        %>
        <script> alert('login e/ou senha inválidos');
        </script>
        <% }
    }
    /// Se preencheu o cadastro
    if (request.getParameter("txtNEmail") != null
            && request.getParameter("txtNEnd") != null
            && request.getParameter("txtNSenha") != null
            && request.getParameter("txtNNome") != null)
    {
        ClienteDAO dao = new ClienteDAO();
        Cliente c = new Cliente();
        c.setEmail(request.getParameter("txtNEmail"));
        c.setEndereco(request.getParameter("txtNEnd"));
        c.setSenha(request.getParameter("txtNSenha"));
        c.setNome(request.getParameter("txtNNome"));
        dao.incluir(c);
        session.setAttribute("cliente", c);
        response.sendRedirect("checkout.jsp");
        return;
    }
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
                                <div class="checkout_title">Login</div>
                                <div class="checkout_form_container">
                                    <form action="#" id="checkout_form">
                                        <div class="d-flex flex-lg-row flex-column align-items-start justify-content-between">
                                            <input type="text" class="checkout_input" placeholder="Nome" required="required">
                       
                                        </div>

                                        <input type="password" class="checkout_input" placeholder="Senha" required="required">
                                       
                                       <button class="cart_total_button">Entrar</button>
                                        
                                        
                                            
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <!-- Billing Details -->
                        <div class="col-lg-6">
                            <div class="billing">
                                <div class="checkout_title">Cadastro</div>
                                <div class="checkout_form_container">
                                    <form action="#" id="checkout_form">
                                        <div class="d-flex flex-lg-row flex-column align-items-start justify-content-between">
                                            <input type="text" class="checkout_input checkout_input_50" placeholder="Nome" required="required">
                                            
                                        </div>

                                        <input type="text" class="checkout_input" placeholder="E-mail" required="required">
                                        
                                        <input type="text" class="checkout_input" placeholder="Endereço" required="required">
                                        
                                        <input type="password" class="checkout_input" placeholder="Senha" required="required">
                                                <button class="cart_total_button">Cadastrar</button>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

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