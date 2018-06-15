<%@page import="java.util.List"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    LivroDAO ldao = new LivroDAO();
    List<Livro> lista;
    
    if (request.getParameter("txtFiltro") != null) {
        lista = ldao.listar(request.getParameter("txtFiltro"));
        
    } else{ 
   
    //verifico se é excluir
        if(request.getParameter("codigo") != null){
            Livro obj = ldao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
            if(obj != null){
                ldao.excluir(obj);
            }
        }
        
        lista = ldao.listar();
    }
%>


	<!-- New Arrivals -->

	<div class="arrivals">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<div class="section_subtitle">only the best</div>
						<div class="section_title">new arrivals</div>
					</div>
				</div>
			</div>
			<div class="row products_container">

				<!-- Product -->
				<div class="col-lg-4 product_col">
					<div class="product">
						<div class="product_image">
							<img src="images/product_1.jpg" alt="">
						</div>
						<div class="rating rating_4">
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
						</div>
						<div class="product_content clearfix">
							<div class="product_info">
								<div class="product_name"><a href="product.html">Woman's Long Dress</a></div>
								<div class="product_price">$45.00</div>
							</div>
							<div class="product_options">
								<div class="product_buy product_option"><img src="images/shopping-bag-white.svg" alt=""></div>
								<div class="product_fav product_option">+</div>
							</div>
                                                    
                                                     <%for(Livro item: lista)
                                                     {
                                                     %>
                                                    <tr>
                                                        <td><%=item.getId() %></td>
                                                        <td><%=item.getNome()%></td>
                                                        <td><a href="upd.jsp?codigo=<%=item.getId()%>" class="btn  btn-primary btn-sm">Alterar</a>
                                                            <button class="btn  btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=item.getId()%>">Excluir</button>  
                                                        </td>
                                                    </tr>
                                                    <% } %>
						</div>
					</div>
				</div>

				

			</div>
		</div>
	</div>

	

	
        
<%@include file="rodape.jsp"%>

	