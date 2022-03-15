<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${alunos.size() > 0}">
<table>
    <tr>
        <th>nome</th>
        <th>endereco</th>
        <th>dataNascimento</th>
        <th>matricula</th>
        <th>Ações</th>
      
     </tr>
     <g:each var="controleAluno" in="${alunos}">
        <tr>
        <td>${controleAluno?.nome}</td>
        <td>${controleAluno?.endereco}</td>
        <td>${controleAluno?.dataNascimento}</td>
        <td>${controleAluno?.matricula}</td>
       
            <td>				
            <g:remoteLink controller="controleAluno" action="alterar" update="divForm" id="${controleAluno.id}">Alterar</g:remoteLink>
				&nbsp;
            <a href="#" onclick="excluir('${controleAluno.id}')">Excluir</a>
	</td>	
     </tr>
     </g:each>
</table>
</g:if>
<g:else>
	Não há Alunos cadastrados
</g:else>
