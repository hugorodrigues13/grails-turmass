<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${professor.size() > 0}">
<table>
    <tr>
        <th>nome</th>
        <th>endereco</th>
        <th>dataNascimento</th>
        <th>Ações</th>
      
     </tr>
     <g:each var="controleProfessor" in="${professor}">
        <tr>
        <td>${controleProfessor?.nome}</td>
        <td>${controleProfessor?.endereco}</td>
        <td>${controleProfessor?.dataNascimento}</td>
       
            <td>				
            <g:remoteLink controller="controleProfessor" action="alterar" update="divForm" id="${controleProfessor.id}">Alterar</g:remoteLink>
				&nbsp;
            <a href="#" onclick="excluir('${controleProfessor.id}')">Excluir</a>
	</td>	
     </tr>
     </g:each>
</table>
</g:if>
<g:else>
	Não há Professores cadastrados
</g:else>
