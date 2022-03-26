<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/be6328ee19.js" crossorigin="anonymous"></script>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons+Outlined">
        <title>Control de Clientes</title>
    </head>
    <body>
        <%-- cabecero HEADER <jsp:include page="/WEB-INF/paginas/comunes/header.jsp"/> --%>
        <%
            Object sesionNueva = session.getAttribute("sesionNueva");
            if (sesionNueva == null) {
                session.setAttribute("sesionNueva", true);
            }
        %>
        <header id="main-header" class="py-2 bg-info text-white sticky-top">
            <nav class="navbar navbar-expand-lg navbar-light bg-info sticky-top">
                <div class="container">
                    <a class="navbar-brand fs-4 text-body" href="#">
                        <h2>
                            <i class="fa fa-regular fa-gear"></i>
                            Control de Clientes
                        </h2>
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0 fs-6">
                            <c:if test="${sesionNueva}">
                                <li class="nav-item">
                                    <button type="button" class="nav-link disabled btn text-light" aria-current="page" data-bs-toggle="tooltip" data-bs-placement="top" title="Inicie sesion para habilidar esta opcion" disabled>
                                        <i class="fas fa-plus"></i> Agregar Cliente
                                    </button>
                                </li>
                            </c:if>
                            <c:if test="${!sesionNueva}">
                                <li class="nav-item me-auto">
                                    <a href="#" class="nav-link active btn text-light" aria-current="page" data-bs-toggle="modal" data-bs-target="#agregarClienteModal">
                                        <i class="fas fa-plus"></i> Agregar Cliente
                                    </a>
                                </li>
                            </c:if>
                        </ul>
                        <form action="${pageContext.request.contextPath}/BuscadorServlet?q=search" method="post" class="d-flex me-auto">
                            <input class="form-control me-2" type="search" name="buscador" placeholder="Buscar cliente" aria-label="Search">
                            <button class="btn btn-outline-light" type="submit">Search</button>
                        </form>
                        <ul class="nav ms-auto">
                            <c:if test="${sesionNueva}">
                                <a href="login.jsp" class="btn btn-outline-light">
                                    <span class="material-icons-outlined fs-1 align-middle me-1">
                                        account_circle
                                    </span>
                                    Acceder
                                </a>
                            </c:if>
                            <c:if test="${!sesionNueva}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="material-icons-outlined fs-1 align-middle">
                                            account_circle
                                        </span>
                                    </a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li>
                                            <a class="dropdown-item" href="#">
                                                <span class="material-icons-outlined me-2 align-middle">
                                                    person_outline
                                                </span>
                                                ${usuario.nombre}
                                            </a>
                                        </li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/UsuarioServlet?accion=signOff">
                                                <span class="material-icons-outlined me-2 align-middle">
                                                    logout
                                                </span>
                                                Cerrar sesión
                                            </a>
                                        </li> 
                                        <li>
                                            <a class="dropdown-item" href="${pageContext.request.contextPath}/UsuarioServlet?accion=setings">
                                                <span class="material-icons-outlined me-2 align-middle">
                                                    settings
                                                </span>
                                                Configuración
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <!-- Boton de navegacion al modal -->
        <%-- 
                            <c:if test="${sesionNueva}">
                        <div class="col-md-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="tooltip" data-bs-placement="top" title="Inicie sesion para habilidar esta opcion" disabled>
                                <i class="fas fa-plus"></i> Agregar Cliente
                            </button>
                        </div> 
                        <div class="col-md-3 d-grid gap-2 ms-auto">
                            <a href="login.jsp" class="btn bg-success bg-opacity-80 btn-lg text-white rounded-pill fw-bold">Log in</a>
                        </div>
                    </c:if>
                    <c:if test="${!sesionNueva}">
                        <div class="col-md-3">
                            <a href="#" class="btn btn-primary btn-block" data-bs-toggle="modal" data-bs-target="#agregarClienteModal">
                                <i class="fas fa-plus"></i> Agregar Cliente
                            </a>
                        </div>
                        <div class="col-md-3 d-grid gap-2 ms-auto">
                            <a href="#" class="btn bg-success bg-opacity-80 btn-lg text-white rounded-pill fw-bold">
                                <i class="fa fa-solid fa-user"></i>
                                ${usuario.nombre}
                            </a>
                        </div>
                    </c:if>
        --%>
        <section id="actions" class="py-4 mb-4 bg-light">
            <div class="container">
                <div class="row">

                </div>
            </div>
        </section>
        <!-- Boton de navegacion al modal -->
        <main>
            <!-- Listado de clientes (privado) -->
            <jsp:include page="/WEB-INF/paginas/cliente/listadoCliente.jsp"/>
            <!-- Agregar cliente Modal-->
            <!-- Esta agregado en el jsp listadoCliente -->

            <div class="container">
                <div class="row justify-content-md-center">
                    <c:if test="${sesionNueva}">
                        <div class="alert alert-danger" role="alert">
                            Debe iniciar sesion para ver el listado de clientes registrados!!
                        </div>
                    </c:if>
                </div>
            </div>

            <%-- Notificacion de la salida del usuario--%>
            <jsp:include page="/WEB-INF/paginas/usuario/notificacionUsuario.jsp"/>
        </main>
        <!-- Pie de pagina FOOTER-->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>
