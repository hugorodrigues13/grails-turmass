<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Gerenciamento de Turmas</title>
                <g:javascript library="jquery"/>
                    <script type="text/javascript">
                        
                    function carregarLista(){
                        <g:remoteFunction controller="controleTurma" action="lista" update="divLista"/>
                    }
                    function excluir(id){
                        if(confirm("Deseja realmente excluir?")){
                        <g:remoteFunction controller="controleTurma" action="excluir" update="divLista" id="'+id+'"/>
                        }
                    }
                    function cancelar(){
                            jQuery("#divForm").html("")
                        }
               
                </script>
	</head>
        <body>
            <g:remoteLink controller="controleTurma" action="adicionar" update="divForm">Adicionar</g:remoteLink>
            
            <div id="divLista">
                <g:render template="lista" model="[turmas: turmas]"></g:render>
            </div>
            
            <div id="divForm"></div>
     </body>
</html>
