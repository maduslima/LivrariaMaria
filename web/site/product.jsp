<%@page import="modelo.Autor"%>
<%@page import="modelo.Compralivro"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    if(request.getParameter("id")==null)
    {
        response.sendRedirect("index.jsp");
        return;
    }
    
    Integer id = Integer.parseInt(request.getParameter("id"));
    LivroDAO dao = new LivroDAO();
    Livro obj = dao.buscarPorChavePrimaria(id); 
    
%>
<!DOCTYPE html>

<html lang="en">
<head>
<title>Product</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Wish shop project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="styles/bootstrap4/bootstrap.min.css">
<link href="plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="styles/product.css">
<link rel="stylesheet" type="text/css" href="styles/product_responsive.css">
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
				<li class="menu_mm"><a href="#">Categorias</a></li>
				<li class="menu_mm"><a href="#">Autores</a></li>
				<li class="menu_mm"><a href="#">Editoras</a></li>
				<li class="menu_mm"><a href="#">Autores</a></li>
			</ul>
		</nav>
	</div>
       
	<!-- Product -->

	<div class="product">
		<div class="container">
			
			<div class="row product_row">

				<!-- Product Image -->
				<div class="col-lg-7">
					<div class="product_image">
						<div class="product_image_large"><img src="../arquivos/<%=obj.getFoto1()%>" alt="" ></div>
						<div class="product_image_thumbnails d-flex flex-row align-items-start justify-content-start">
							<div class="product_image_thumbnail" style="background-image:url(../arquivos/<%=obj.getFoto1()%>)" data-image="images/product_image_1.jpg"></div>
							<div class="product_image_thumbnail" style="background-image:url(../arquivos/<%=obj.getFoto2()%>)" data-image="images/product_image_1.jpg"></div>
                                                        <div class="product_image_thumbnail" style="background-image:url(../arquivos/<%=obj.getFoto3()%>)" data-image="images/product_image_1.jpg"></div>
                                                </div>
					</div>
				</div>

				<!-- Product Content -->
				<div class="col-lg-5">
					<div class="product_content">
						<div class="product_name">Nome: <%=obj.getNome()%></div>
                                                <div class="product_price"></br>R$: <%=obj.getPreco()%></div>
                                                <div class="product_name"></br>Editora: <%=obj.getEditora()%></div>
                                                <div class="product_name"></br>Categoria: <%=obj.getCategoria()%></div>
                                                <div class="product_name"></br>Sinopse: <%=obj.getSinopse()%></div>
                                                <div class="product_name"></br>Autores: 
                                                    <%
                                                        for(Autor a: obj.getAutorList()){
                                                    %>
                                                    <a href="detalheautor?id=<%=a.getId()%>"><%=a.getNome()%></a>
                                                    <%
                                                        }
                                                    %>
                                                    
                                               <div class="button cart_button"><a href="carrinho.jsp?id=<%=obj.getId()%>">add to cart</a></div>
							
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
<script src="js/product_custom.js"></script>
</body>
</html>
<%@include file="rodape.jsp"%>