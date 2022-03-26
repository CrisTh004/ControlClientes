<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="offcanvas offcanvas-start" id="usuarioRegistroCanvas" tabindex="-1">
    <div class="offcanvas-header">
        <h3 class="offcanvas-title text-success text-center">
            Register 
        </h3>
        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
    </div>
    <form action="${pageContext.request.contextPath}/UsuarioServlet?accion=register" method="post" class="" id="formRegistro">
        <div class="offcanvas-body divInsert">
            <div class="form-group mb-3">
                <label for="usuario">User-Name</label>
                <input type="text" class="form-control" id="usuario" name="usuario" placeholder="User-Name">
            </div>
            <div class="form-group mb-3">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="E-mail" >
            </div>
            <div class="form-group mb-3">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password"  autocomplete="on">
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button type="submit" class="btn btn-outline-primary">Registrarse</button>
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="offcanvas">Close</button>
            </div>
        </div>
    </form>
</div>
<%-- Notificacion de registro del usuario--%>
<jsp:include page="/WEB-INF/paginas/usuario/notificacionUsuario.jsp"/>

<%--
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 11">
    <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
        <div class="toast-header">
            <i class="fab fa-brands fa-java rounded me-2"></i>
            <strong class="me-auto">JavaOfPlink</strong>
            <small>Hace un momento</small>
            <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
        <div class="toast-body">
            Hola, se acaba de registrar correctamente!! ahora puede iniciar sesion y ver la lista de clientes :D.
        </div>
    </div>
</div>
<c:if test="${register}">
    <script>
        document.addEventListener("DOMContentLoaded", iniciarApp);
        function iniciarApp() {
            const toastLiveExample = document.getElementById('liveToast');

            const toast = new bootstrap.Toast(toastLiveExample);

            toast.show();
        }
    </script>
    <%
    request.getSession().setAttribute("register", false);
    %>
</c:if>
--%>

