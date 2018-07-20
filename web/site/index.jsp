<%@page import="java.util.List"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@include file="cabecalho.jsp"%>
<%
    LivroDAO dao = new LivroDAO();
    List<Livro> lista;
    //se é para filtrar por categoria
    if(request.getParameter("categoriaid")!=null){
        
        Integer id = 
        Integer.parseInt(request.getParameter("categoriaid"));
        Categoria c = cdao.buscarPorChavePrimaria(id);
        lista = c.getLivroList();
    }
    else{
        lista = dao.listar();
    }
   
    dao.fecharConexao();
    
       
    
%>

 
	<!-- Destaques -->

	<div class="arrivals">
		<div class="container">
			<div class="row">
				<div class="col">
					<div class="section_title_container text-center">
						<div class="section_subtitle">only the best</div>
						<div class="section_title">Destaques</div>
					</div>
				</div>
			</div>
			<div class="row products_container">

				<!-- Início Livros -->
                                <%for(Livro livro:lista){
                                %>
				<div class="col-lg-4 product_col">
					<div class="product">
						<div class="product_image">
							<img src="../arquivos/<%=livro.getFoto1()%>" alt="" >
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
								<div class="product_name"><%=livro.getNome()%></div>
								<div class="product_price"><%=livro.getPreco()%></div>
							</div>
							<div class="product_options">
								
                                                                <div class="product_fav product_option"><a href="product.jsp?id=<%=livro.getId()%>">Detalhes</a></div>
							</div>
                                                    
                                                     
						</div>
					</div>
				</div>
                                <%}%>                        
				<!--Fim do livro -->

			</div>
		</div>
	</div>

	

	
        
<%@include file="rodape.jsp"%>

	