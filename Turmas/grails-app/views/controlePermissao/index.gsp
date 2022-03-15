<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <head>
        <meta name="layout" content="main"/>
        <title>Controle de Permissao</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
        <style type="text/css">
         #divUsuarios{
		width: 30%;
		float:left;	
		border: 1px solid #000;	
		margin: 5px;
	}
	#divPermissoes{
		width: 45%;
		float:right;
		border: 1px solid #fc0;
		margin: 5px;
	}
	#divDetalhesUsuario{
		width: 20%;
		float:left;
		border: 1px solid #000;
		margin: 5px;
	}
	#divFormUsuario, #divFormPermissao{
		padding: 5px;
	}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		carregarListaUsuarios()
		carregarListaPermissoes()
	})
	function carregarListaPermissoes(){
		$.ajax({
			  method: "POST",
			  url: "listarPermissao",
			  data: { },
			  success: function(data){
				  $("#divListaPermissao").html(data)
			  }
			})
               	}
        function carregarListaUsuarios(){
		$.ajax({
		  method: "POST",
		  url: "listarUsuario",
		  data: { },
		  success: function(data){
			  $("#divListaUsuario").html(data)
		  }
		})
	}
	function retornoSalvarUsuario(data){
		if(data.mensagem=="OK"){
			$("#divMensagemUsuario").html("Usuário salvo com sucesso.")
			$("#formUsuario input[name=login]").val("")
			$("#formUsuario input[name=id]").val("")
			carregarListaUsuarios()
		}else{
			$("#divMensagemUsuario").html("Não foi possível salvar o usuário.")
		}		
	}
	function retornoSalvarPermissao(data){
		if(data.mensagem=="OK"){
			$("#divMensagemPermissao").html("Permissão salva com sucesso.")
			$("#formPermissao input[name=permissao]").val("")
			$("#formPermissao input[name=id]").val("")
			carregarListaPermissoes()
		}else{
			$("#divMensagemPermissao").html("Não foi possível salvar a permissão.")
		}		
	}
	function alterarUsuario(id){
		$.ajax({
		  method: "POST",
		  url: "getUsuario",
		  data: { "id": id },
		  success: function(data){
                  console.log(data)
			  $("#formUsuario input[name=login]").val(data.usuario.username)
			  $("#formUsuario input[name=id]").val(data.usuario.id)
                          $("#divDetalhesUsuario").html("")
                          for(i in data.permissoes){
                                var permissao = data.permissao[i]
                                $("#divDetalhesUsuario").append(permissao.authority+"<a href='javascript: desvincularPermissao("+permissao.id+")'>X</a><br />")
                          
                          }
			 
		  }
		})
	}
	function alterarPermissao(id){
		$.ajax({
		  method: "POST",
		  url: "getPermissao",
		  data: { "id": id },
		  success: function(data){
                  console.log(data)
			$("#formPermissao input[name=permissao]").val(data.authority)
			$("#formPermissao input[name=id]").val(id)
		  }
		})
              }
              
          function excluirPermissao(id){
                if(confirm("Deseja realmente excluir a permissão?")){
                    $.ajax({
                      method: "POST",
                      url: "excluirPermissao",
                      data: { "id": id },
                      success: function(data){
                            if (data.mensagem=="OK"){
                            carregarListaPermissoes()
                            }else{
                                $("#divMensagemPermissao").html("Não foi possivel excluir")
                            }
                      }
                    })
                 }
            }
             function excluirUsuario(id){
                if(confirm("Deseja realmente excluir o Usuario?")){
                    $.ajax({
                      method: "POST",
                      url: "excluirUsuario",
                      data: { "id": id },
                      success: function(data){
                            if (data.mensagem=="OK"){
                            carregarListaUsuarios()
                            }else{
                                $("#divMensagemUsuario").html("Não foi possivel excluir")
                            }
                      }
                    })
                 }
            }
            
            </script>
    </head>
    <body>
       	<div id="divUsuarios">
		<div id="divFormUsuario">
			<div id="divMensagemUsuario"></div>
			<g:formRemote id="formUsuario" name="formUsuario" url="[controller: 'controlePermissao', action: 'salvarUsuario']" onSuccess="retornoSalvarUsuario(data)">
				Login <input type="text" name="login" value="" />
				<input type="hidden" name="id" />
				<input type="submit" name="salvar" value="Salvar" />			
			</g:formRemote>
		</div>
		<div id="divListaUsuario">			
		</div>		
	</div>
	<div id="divDetalhesUsuario">
	</div>
        <div id="divPermissoes">
            <div id="divFormPermissao">
                <div id="divMensagemPermissao"></div>
                <g:formRemote id="formPermissao" name="formPermissao" url="[controller: 'controlePermissao', action: 'salvarPermissao']" onSuccess="retornoSalvarPermissao(data)">
                    Permissao <input type="text" name="permissao" value="" />
                    <input type="hidden" name="id"/>
                    <input type="submit" name="salvar" value="Salvar" />
                </g:formRemote>
            </div>
            <div id="divListaPermissao">
            </div>
             </div>
    </body>
</html>
