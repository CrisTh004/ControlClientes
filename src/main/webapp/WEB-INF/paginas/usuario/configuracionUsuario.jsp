<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Material+Icons+Outlined">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/be6328ee19.js" crossorigin="anonymous"></script>

        <title>Editar Clientes</title>
    </head>
    <body>
        <!-- cabecero -->
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
                            <li class="nav-item">
                                <a href="index.jsp" class="nav-link active btn text-light">
                                    <i class="fas fa-arrow-left"></i> Regresar al inicio
                                </a>
                            </li>
                        </ul>
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
                                            <a class="dropdown-item" href="#">
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

        <!-- Boton de navegacion de editar cliente-->
        <section id="actions" class="py-4 mb-4 bg-light">
            <div class="container">
                <div class="row">
                    <div class="col">
                        <h4> 
                            <i class="fa fa-solid fa-wrench"></i>
                            Configuración
                        </h4>
                    </div>
                </div>
            </div>
        </section>
        <!-- campos de texto para la modificacion -->
        <c:if test="${!sesionNueva}">
            <section id="details">
                <div class="container">
                    <div class="row g-0">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-md-2">
                                            <img src="recursos/images/perfil.jpg" class="img-fluid rounded mx-auto d-block" alt="...">
                                        </div>
                                        <div class="col-md-10">
                                            <h5 class="card-title mt-2">Información personal</h5>
                                            <p class="card-text">${usuario.nombre}</p>
                                            <p class="card-text">${usuario.email}</p>
                                        </div>
                                    </div>
                                </div>
                                <form action="${pageContext.request.contextPath}/UsuarioServlet?accion=modificar&idUsuario=${usuario.idUsuario}" method="post" class="" id="formRegistro">
                                    <div class="card-body divInsert">
                                        <div class="mb-3 row">
                                            <label for="usuario" class="col-sm-2 col-form-label">Nombre de usuario</label>
                                            <div class="col-sm-10">
                                                <input type="text" name="usuario" class="form-control" id="usuario">
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="email" class="col-sm-2 col-form-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="email" name="email" class="form-control" id="email">
                                            </div>
                                        </div>
                                        <div class="mb-4 row">
                                            <label for="password" class="col-sm-2 col-form-label">Password</label>
                                            <div class="col-sm-10">
                                                <input type="password" name="password" class="form-control" id="password">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <button type="submit" class="btn btn-success btn-block mb-3">
                                                    <i class="fas fa-check"></i> Guardar Cambios
                                                </button>
                                            </div>
                                            <div class="col-md-3">
                                                <a href="${pageContext.request.contextPath}/UsuarioServlet?accion=eliminar&idUsuario=${usuario.idUsuario}" class="btn btn-danger btn-block">
                                                    <i class="fas fa-trash"></i> Eliminar Cuenta
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </c:if>
        <!-- Boton de navegacion de editar cliente-->

        <div class="container">
            <div class="row justify-content-md-center">
                <c:if test="${sesionNueva}">
                    <div class="alert alert-danger" role="alert">
                        Debe iniciar sesion para ver el listado de clientes registrados!!
                    </div>
                </c:if>
            </div>
        </div>
        <!-- NO SE AGREGA EL Listado de clientes (privado) -->
        <!-- NO SE Agregar cliente Modal-->

        <!-- Pie de pagina FOOOTER-->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <%-- Insertando el script --%>
        <script src="recursos/validationRegister.js"></script>
    </body>
</html>
