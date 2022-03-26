<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="es_PE"/>

<%--

<%! 
    private double calcularSaldoTotal(List<Cliente> clientes) {
        double saldoTotal = 0.0;
        for (Cliente client : clientes) {
            saldoTotal += client.getSaldo();
        }
        return saldoTotal;
    }
%>

<%
    if (session.isNew()) {
        List<Cliente> clientes = new ClienteDaoJDBC().select();
        session.setAttribute("clientes", clientes);
        session.setAttribute("saldoTotal", calcularSaldoTotal(clientes));
        session.setAttribute("totalClientes", clientes.size());
    }
%>

--%>



<section id="clientes">
    <div class="container">
        <div class="row">
            <div class="col-md-9">
                <div class="card">
                    <div class="card-header">
                        <h4>Listado de clientes</h4>
                    </div>
                    <table class="table table-striped">
                        <thead class="table-dark">
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Saldo</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="cliente" items="${clientes}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.count}</th>
                                    <td>${cliente.nombre} ${cliente.apellido}</td>
                                    <td> <fmt:formatNumber value="${cliente.saldo}" type="currency"/></td>
                                    <td>
                                        <a href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}" class="btn btn-secondary">
                                            <i class="fas fa-angle-double-right"></i> Editar
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Tarjetas laterales -->
            <div class="col-md-3">
                <div class="card text-center bg-danger text-white mb-3">
                    <div class="card-body">
                        <h3>Saldo Total</h3>
                        <h4 class="display-4">
                            <fmt:formatNumber value="${saldoTotal}" type="currency"/>
                        </h4>
                    </div>
                </div>
                <div class="card text-center bg-success text-white mb-3">
                    <div class="card-body">
                        <h3>Total Clientes</h3>
                        <h4 class="display-4">
                            <i class="fas fa-users"></i>
                            ${totalClientes}
                        </h4>
                    </div>
                </div>
            </div>
            <!-- Tarjetas laterales -->
        </div>
    </div>
</section>
<%-- Agregando la advertncia de usuario nuevo--%>
<!-- Agregar cliente Modal-->
<jsp:include page="/WEB-INF/paginas/cliente/agregarCliente.jsp"/>