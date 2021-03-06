<%-- 
    Document   : examesUsuarioIndex
    Created on : 27/09/2017, 07:26:19
    Author     : Anderson2
--%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:setLocale value="pt-BR" />
<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-default">
            <div class="panel-heading">
                Lista de Exames de Clientes
            </div>
            <!-- /.panel-heading -->
            <div class="panel-body">
                <c:if test="${requestScope.msgErro != null}" >
                    <div class="alert alert-danger alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                        <strong>${requestScope.msgErro}</strong>
                    </div>
                </c:if>
                <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" style="text-align: center;">
                        <thead>
                            <tr>
                                <th>Codigo</th>
                                <th>Nome do Exame</th>
                                <th>Codigo do Cliente</th>
                                <th>Nome do Cliente</th>
                                <th>Data do Exame</th>
                                <th>Data Prevista para Entrega</th>
                                <th>Exame Pronto?</th>
                                <th>Data que foi entregue</th>
                                <th>Valor do Exame</th>
                                <th>Está Pago?</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.lstExamesUsuario}" var="exameUsuario">
                            <tr>
                                <td>${exameUsuario.id}</td>
                                <td>${exameUsuario.idexame.nomeExame}</td>
                                <td>${exameUsuario.idusuario.id}</td>
                                <td>${exameUsuario.idusuario.nome}</td>
                                <td><fmt:formatDate value="${exameUsuario.dataExame}" pattern="dd/MM/yyyy HH:mm" /></td>
                                <td><fmt:formatDate value="${exameUsuario.dataEntregaPrevista}" pattern="dd/MM/yyyy HH:mm" /></td>
                                <td>
                                    <c:if test="${exameUsuario.examePronto}">
                                        <i class="fa fa-check-square-o fa-2x" style="color: green;" title="Sim"></i>
                                    </c:if>
                                    <c:if test="${!exameUsuario.examePronto}">
                                        <i class="fa fa-square-o fa-2x" style="color: red;" title="Não"></i>
                                    </c:if>
                                </td>
                                <td>
                                    <c:if test="${exameUsuario.dataExamePronto != null}">
                                        <fmt:formatDate value="${exameUsuario.dataEntregaConcluida}" pattern="dd/MM/yyyy HH:mm" />
                                    </c:if>
                                    <c:if test="${exameUsuario.dataEntregaConcluida == null}">
                                        <u>Exame não entregue.</u>
                                    </c:if>
                                </td>
                                <td><fmt:formatNumber value="${exameUsuario.valor}" type="currency" /></td>
                                <td>
                                    <c:if test="${exameUsuario.examePago}">
                                        <i class="fa fa-check-square-o fa-2x" style="color: green;" title="Sim"></i>
                                    </c:if>
                                    <c:if test="${!exameUsuario.examePago}">
                                        <i class="fa fa-square-o fa-2x" style="color: red;" title="Não"></i>
                                    </c:if>
                                </td>
                                <td align="center">
                                    <a class="btn btn-info" title="Visualizar" href="Home?ac=exame_cliente_view&idExameCliente=${exameUsuario.id}"><i class="fa fa-eye"></i> </a>
                                    <c:if test="${exameUsuario.dataEntregaConcluida == null}">
                                        <a class="btn btn-warning" title="Entregar Exame" href="Home?ac=exame_cliente_entregar&idExameCliente=${exameUsuario.id}"><i class="fa fa-envelope"></i></a>
                                    </c:if>
                                </td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- /.table-responsive -->
            </div>
            <!-- /.panel-body -->
        </div>
        <!-- /.panel -->
    </div>
    <!-- /.col-lg-6 -->
</div>
