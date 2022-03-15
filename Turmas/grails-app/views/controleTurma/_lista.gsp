<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<g:if test="${turmas.size() > 0}">
<table>
    <tr>
        <th>codigo</th>
        <th>disciplina</th>
        <th>horario</th>
        <th>qtdMaximaAlunos</th>
        <th>alunosMatriculados</th>
        <th>Ações</th>
      
     </tr>
     <g:each var="controleTurma" in="${turmas}">
        <tr>
        <td>${controleTurma?.codigo}</td>
        <td>${controleTurma?.disciplina}</td>
        <td>${controleTurma?.horario}</td>
        <td>${controleTurma?.qtdMaximaAlunos}</td>
        <td>${controleTurma?.alunosMatriculados}</td>
            <td>				
            <g:remoteLink controller="controleTurma" action="alterar" update="divForm" id="${controleTurma.id}">Alterar</g:remoteLink>
				&nbsp;
            <a href="#" onclick="excluir('${controleTurma.id}')">Excluir</a>
	</td>	
     </tr>
     </g:each>
</table>
</g:if>
<g:else>
	Não há produtos.
</g:else>
