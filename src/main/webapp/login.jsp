<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">   
        <script src="https://kit.fontawesome.com/be6328ee19.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="recursos/styles.css"/>
        <title>Login</title>
    </head>
    <body>
        <!-- cabecero -->
        <jsp:include page="/WEB-INF/paginas/comunes/header.jsp"/>
        <!-- Boton de navegacion al modal -->
        <main>
            <div class="container">
                <div class="row main-conten text-center main-content">
                    <div class="col-md-4 text-center text-white bg-success company_info py-3">
                        <h2>
                            <i class="fab fa-brands fa-java"></i>
                        </h2>
                        <h4 class="company_title">JavaOfPlink</h4>
                    </div>
                    <div class="col-md-8 col-xs-12 col-sm-12">
                        <div class="container-fluid text-success">
                            <div class="row py-3">
                                <h2>Log in</h2>
                            </div>
                            <c:if test="${mensage != null}">
                                <div class="row">
                                    <div class="col d-grid gap-2 mx-auto">
                                        <p class="text-danger">${mensage}</p>
                                    </div>
                                </div>
                            </c:if>
                            <div class="row">
                                <form action="${pageContext.request.contextPath}/UsuarioServlet?accion=login" method="post" class="was-validated">
                                    <div class="row mb-3">
                                        <input type="email" name="email" placeholder="Email" class="form-control" required>
                                    </div>
                                    <div class="row mb-3">
                                        <input type="password" name="password" placeholder="Password" class="form-control" required autocomplete="on">
                                    </div>
                                    <div class="row mb-3">
                                        <label for="remember" class="text-dark">
                                            <input type="checkbox" name="remember" id="remember">
                                            Remember Me!
                                        </label>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="d-grid col-8 mx-auto">
                                            <button type="submit" class="btn btn-outline-success rounded-pill">Submit</button>
                                        </div>
                                    </div> 
                                    <div class="row">
                                        <p class="text-dark">No tienes una cuenta? 
                                            <button class="btn btn-link text-decoration-none" type="button" data-bs-toggle="offcanvas" data-bs-target="#usuarioRegistroCanvas">
                                                Registrate aqui!!
                                            </button>
                                        </p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Registro de usuario offcanvas-->
            <jsp:include page="/WEB-INF/paginas/usuario/registroUsuario.jsp"/>
        </main>
        <!-- Pie de pagina FOOTER-->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
        <%-- Insertando el script --%>
        <script src="recursos/validationRegister.js"></script>
    </body>
</html>