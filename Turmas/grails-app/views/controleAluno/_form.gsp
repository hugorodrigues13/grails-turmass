<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>


<div id="divMensagem"></div>
<g:formRemote name="frmTurma" url="[controller: 'controleAluno', action: 'salvar']" update="divMensagem" onSuccess="carregarLista()">
        Nome <input type="text" name="nome" value="${controleAluno.nome}"/><br/>
        Endereço <input type="text" name="endereco" value="${controleAluno.endereco}"/><br/>
        Data de Nasc <input type="text" name="dataNascimento" value="${controleAluno.dataNascimento}"/><br/>
        N° Matricula <input type="text" name="matricula" value="${controleAluno.matricula}"/><br/>
        <input type="submit" name="btnSalvar" value="Salvar"/>
        <input type="button" name="btnCancelar" value="Cancelar" onClick="cancelar()"/>
        <input type="hidden" name="id" value="${controleAluno.id}"/>
</g:formRemote>
