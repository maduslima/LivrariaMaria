<%@page import="modelo.Compra"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Compralivro"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="cabecalho.jsp"%>
<%    if (request.getParameter("id") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Integer id = Integer.parseInt(request.getParameter("id"));
    LivroDAO dao = new LivroDAO();
    List<Livro> lista = dao.listar();
    Livro l = dao.buscarPorChavePrimaria(id);
    List<Compralivro> carrinho;
    Compralivro cl = new Compralivro();
    cl.setLivro(l);
    cl.setValorunitario(l.getPreco());
    cl.setQuantidade(1);

    if (session.getAttribute("carrinho") != null) {
        carrinho = (List<Compralivro>) session.getAttribute("carrinho");
        carrinho.add(cl);
    } else {
        carrinho = new ArrayList<Compralivro>();
        carrinho.add(cl);
    }
    session.setAttribute("carrinho", carrinho);
    
//Total
Compra compra = new Compra();
Float valor = 0.0f;
for(Compralivro car:carrinho){
    valor = valor + car.getValorunitario()*car.getQuantidade();
    }
compra.setValor(valor);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Cart</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Wish shop project">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
        <link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" type="text/css" href="styles/cart.css">
        <link rel="stylesheet" type="text/css" href="styles/cart_responsive.css">
    </head>
    <body>

        <div class="super_container">


            <!-- Menu -->

            <div class="menu d-flex flex-column align-items-end justify-content-start text-right menu_mm trans_400">
                <div class="menu_close_container"><div class="menu_close"><div></div><div></div></div></div>
                <div class="logo menu_mm"><a href="#">Livraria Maria</a></div>
                <div class="search">
                    <form action="#">
                        <input type="search" class="search_input menu_mm" required="required">
                        <button type="submit" id="search_button_menu" class="search_button menu_mm"><img class="menu_mm" src="images/magnifying-glass.svg" alt=""></button>
                    </form>
                </div>
                <nav class="menu_nav">
                    <ul class="menu_mm">
                        <li class="menu_mm"><a href="index.html">home</a></li>
                        <li class="menu_mm"><a href="#">categorias</a></li>
                        <li class="menu_mm"><a href="#">autores</a></li>
                        <li class="menu_mm"><a href="#">editoras</a></li>
                        <li class="menu_mm"><a href="#">livros</a></li>
                    </ul>
                </nav>
            </div>

            <!-- Home -->

            <div class="home">
                <div class="home_background parallax-window" data-parallax="scroll" data-image-src="images/cart.jpg" data-speed="0.8"></div>
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="home_container">
                                <div class="home_content">
                                    <div class="home_title">Shopping Cart</div>
                                    <div class="breadcrumbs">
                                        <ul>
                                            <li><a href="index.html">Home</a></li>
                                            <li>Shopping Cart</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Cart -->

            <div class="cart_container">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="cart_title">Seu Carrinho</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="cart_bar d-flex flex-row align-items-center justify-content-start">
                                <div class="cart_bar_title_name">Produto</div>    

                                <div class="cart_bar_title_content ml-auto">
                                    <div class="cart_bar_title_content_inner d-flex flex-row align-items-center justify-content-end">
                                        <div class="cart_bar_title_price">Preço</div>
                                        <div class="cart_bar_title_quantity">Quantidade</div>
                                        <div class="cart_bar_title_total">Total</div>
                                        <div class="cart_bar_title_button"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <div class="cart_products">
                                <ul>
                                    <%for (Compralivro obj : carrinho) {
                                    %>
                                    <li class=" cart_product d-flex flex-md-row flex-column align-items-md-center align-items-start justify-content-start">

                                        <!-- Imagem do Produto -->
                                        <div class="cart_product_image"><img src="../arquivos/<%=cl.getLivro().getFoto1()%>" width="100" hight="100" alt="" ></div>

                                        <!-- Nome do Produto -->
                                        <div class="cart_product_name"><a href="product.html"><%=cl.getLivro().getNome()%></a></div>
                                        <div class="cart_product_info ml-auto">
                                            <div class="cart_product_info_inner d-flex flex-row align-items-center justify-content-md-end justify-content-start">
                                                <!-- Preço -->
                                                <div class="cart_product_price">R$ <%=cl.getLivro().getPreco()%></div>
                                                <!-- Quantidade -->
                                                <div class="product_quantity_container">
                                                    <div class="product_quantity clearfix">
                                                        <input id="quantity_input" type="text" pattern="[0-9]*" value="1">
                                                        <div class="quantity_buttons">
                                                            <div id="quantity_inc_button" class="quantity_inc quantity_control"><i class="fa fa-caret-up" aria-hidden="true"></i></div>
                                                            <div id="quantity_dec_button" class="quantity_dec quantity_control"><i class="fa fa-caret-down" aria-hidden="true"></i></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- Valor Total do Produto -->
                                                <div class="cart_product_total">R$ <%=cl.getLivro().getPreco()%></div>
                                                <!-- Botão Lixo Carrinho -->
                                                <div class="cart_product_button">
                                                    <button class="cart_product_remove"><img src="images/trash.png" alt=""></button>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                    <%}%>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="row cart_extra">
                        <!-- Cart Total -->
                        <div class="col-lg-5 offset-lg-1">
                            <div class="cart_total">
                                <div class="cart_title">Total Carrinho</div>
                                <ul>
                                 
                                    <li class="d-flex flex-row align-items-center justify-content-start">
                                        <div class="cart_total_title">Total</div>
                                        <div class="cart_total_price ml-auto">R$ <%=compra.getValor()%></div>
                                    </li>

                                </ul>
                                <button class="cart_total_button"><a href="checkout.jsp?id%>">Seguir para o checkout</button>
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
        <script src="js/cart_custom.js"></script>
    </body>
</html>
<%@include file="rodape.jsp"%>