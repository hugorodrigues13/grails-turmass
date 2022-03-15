<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>


<div id="divMensagem"></div>
<g:formRemote name="frmTurma" url="[controller: 'controleTurma', action: 'salvar']" update="divMensagem" onSuccess="carregarLista()">
        Codigo <input type="text" name="codigo" value="${controleTurma.codigo}"/><br/>
        Disciplina <input type="text" name="disciplina" value="${controleTurma.disciplina}"/><br/>
        Horario <input type="text" name="horario" value="${controleTurma.horario}"/><br/>
        QtdMaximaAlunos <input type="text" name="qtdMaximaAlunos" value="${controleTurma.qtdMaximaAlunos}"/><br/>
        AlunosMatriculados <input type="text" name="alunosMatriculados" value="${controleTurma.alunosMatriculados}"/><br/>
<!--        Professor <input type="text" name="professor" value=""/><br/>
        Aluno <input type="text" name="alunoTurma" value=""/><br/>-->
        <input type="submit" name="btnSalvar" value="Salvar"/>
        <input type="button" name="btnCancelar" value="Cancelar" onClick="cancelar()"/>
        <input type="hidden" name="id" value="${controleTurma.id}"/>
</g:formRemote>
