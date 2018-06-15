<%@page import="java.util.ArrayList"%>
<%@page import="util.StormData"%>
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="dao.EditoraDAO"%>
<%@page import="dao.AutorDAO"%>
<%@page import="modelo.Editora"%>
<%@page import="java.util.List"%>
<%@page import="modelo.Autor"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Categoria"%>
<%@page import="dao.CategoriaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%
    String msg = "";
    String classe = "";
    LivroDAO dao = new LivroDAO();
    CategoriaDAO cdao = new CategoriaDAO();
    AutorDAO adao = new AutorDAO();
    EditoraDAO edao = new EditoraDAO();
    Livro obj = new Livro();
    Categoria c = new Categoria();
    Editora e = new Editora();
    
  
    

    
    //verifica se é postm ou seja, quer alterar
    if (request.getMethod().equals("POST")) {
      
          String[] autoresid = request.getParameter("autoreschk").split(";");
            
            obj.setId(Integer.parseInt(request.getParameter("txtCodigo")));
            obj.setNome(request.getParameter("txtNome"));
            obj.setPreco(Float.parseFloat(request.getParameter("txtPreco")));
            obj.setDatapublicacao(StormData.formata(request.getParameter("txtData")));
            obj.setSinopse(request.getParameter("txtSinopse"));
            c.setId(Integer.parseInt(request.getParameter("selCategoria")));
            e.setCnpj(request.getParameter("selEditora"));
            obj.setCategoria(c);
            obj.setEditora(e);
            obj.setFoto1(request.getParameter("txtFoto"));
            obj.setFoto2(request.getParameter("txtFoto2"));
            obj.setFoto3(request.getParameter("txtFoto3"));
            
            List<Autor> listaautores = new ArrayList<>();
            for (String id : autoresid) {
                Integer idinteger = Integer.parseInt(id);
                listaautores.add(adao.buscarPorChavePrimaria(idinteger));

            }

    } 
    else {
        //e GET
        if (request.getParameter("codigo") == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));

        if (obj == null) {
            response.sendRedirect("index.jsp");
            return;
        }
    }

    List<Autor> autores = adao.listar();
    List<Editora> editoras = edao.listar();
    List<Categoria> categorias = cdao.listar();
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Livro
        </div>
        <div class="panel-body">

            <div class="alert <%=classe%>">
                <%=msg%>
            </div>
            <form action="../UploadWS" method="post" enctype="multipart/form-data">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getId()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text"  name="txtNome"  required value="<%=obj.getNome()%>" />
                    </div>

                    <div class="form-group">
                        <label>Preço</label>
                        <input class="form-control" type="text"  name="txtPreco"  required value="<%=obj.getPreco()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Sinopse</label>
                        <textarea class="form-control"  name="txtSinopse"><%=obj.getSinopse()%>
                        </textarea>
                    </div>

                    <div class="form-group">
                        <label>Data Publicação</label>
                        <input class="form-control" type="text"  name="txtDataPublicacao"  required value="<%=obj.getDatapublicacao()%>"/>
                    </div>

                    <div class="form-group">
                        <label>Categoria</label>
                        <select name="selCategoria" class="form-control">
                            <option>Selecione</option>
                        <%
                         String selecionado;
                         for(Categoria c2:categorias){
                             
                            if(obj.getCategoria().getId()==c2.getId()){
                                selecionado="selected";
                            }
                            else{
                                selecionado="";
                            }
                        %>
                        <option value="<%=c2.getId()%>" <%=selecionado%>>
                            
                            
                        <%=c2.getNome()%>
                        </option>
                        <%}%>
                        </select>
                    </div>

                  <div class="form-group">
                        <label>Editora</label>
                        <select name="selEditora" class="form-control">
                            <option>Selecione</option>
                        <%
                         String selecionado2;
                         for(Editora e2:editoras){
                             
                            if(obj.getEditora().getCnpj() ==e2.getCnpj()){
                                selecionado2="selected";
                            }
                            else{
                                selecionado2="";
                            }
                        %>
                        <option value="<%=e2.getCnpj()%>" <%=selecionado2%>>
                            
                            
                        <%=e2.getNome()%>
                        </option>
                        <%}%>
                        </select>
                    </div>

                   <div class="form-group">
                        <label>Foto1</label>
                        <input class="form-control" type="file" name="arquivo1" id="arquivo1"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getFoto1()%>" id="img1"/>
                    </div>

                     <div class="form-group">
                        <label>Foto2</label>
                        <input class="form-control" type="file" name="arquivo2" id="arquivo2"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getFoto2()%>" id="img2"/>
                    </div>

                     <div class="form-group">
                        <label>Foto3</label>
                        <input class="form-control" type="file" name="arquivo3" id="arquivo3"  accept="image/*" />
                        <img src="../arquivos/<%=obj.getFoto3()%>" id="img3"/>
                    </div>
                    
                    <div class="form-group">
                        <label>Autores</label>

                        <%for (Autor a : autores) {
                           //verifica se o autor está na lista de autores do livro
                           if(obj.getAutorList().contains(a)){
                               selecionado = "checked";
                           }
                           else{
                               selecionado="";
                           }
                        %>
                        <input type="checkbox" name="autoreschk" value="<%=a.getId()%>"><%=a.getNome()%>

                        <%}%>
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                
                </div>
            </form>>

    </div>
</div>
<!-- /.row -->
    <%@include file="../rodape.jsp" %>
    
    <script>
    function readURL(input,destino) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('#'+destino).attr('src', e.target.result);
            }
            
            reader.readAsDataURL(input.files[0]);
        }
    }
    
    $("#arquivo1").change(function(){
        readURL(this,"img1");
    });
    $("#arquivo2").change(function(){
        readURL(this,"img2");
    });
    $("#arquivo3").change(function(){
        readURL(this,"img3");
    });
</script>