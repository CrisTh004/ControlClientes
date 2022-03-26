<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/be6328ee19.js" crossorigin="anonymous"></script>

        <title>Editar Clientes</title>
    </head>
    <body>
        <!-- cabecero -->
        <jsp:include page="/WEB-INF/paginas/comunes/header.jsp"/>
        
        <!-- Boton de navegacion de editar cliente-->
        <form action="${pageContext.request.contextPath}/ServletControlador?accion=modificar&idCliente=${cliente.idCliente}" method="post" class="was-validated">
            <section id="actions" class="py-4 mb-4 bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <a href="index.jsp" class="btn btn-ligth btn-block mb-3">
                                <i class="fas fa-arrow-left"></i> Regresar al inicio
                            </a>
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-success btn-block mb-3">
                                <i class="fas fa-check"></i> Guardar Cliente
                            </button>
                        </div>
                        <div class="col-md-3">
                            <a href="${pageContext.request.contextPath}/ServletControlador?accion=eliminar&idCliente=${cliente.idCliente}" class="btn btn-danger btn-block">
                                <i class="fas fa-trash"></i> Eliminar Cliente
                            </a>
                        </div>
                    </div>
                </div>
            </section>
            <!-- campos de texto para la modificacion -->
            <section id="details">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-header">
                                    <h4>Editar Cliente</h4>
                                </div>
                                <div class="card-body">
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="nombre" placeholder="Enter nombre" required value="${cliente.nombre}">
                                        <label for="nombre">Nombre</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="text" class="form-control" name="apellido" placeholder="Enter apellido" required value="${cliente.apellido}">
                                        <label for="apellido">Apellido</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="email" class="form-control" name="email" placeholder="Enter email" required value="${cliente.email}">
                                        <label for="email">Email</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="tel" class="form-control" name="telefono" placeholder="Enter telefono" required value="${cliente.telefono}">
                                        <label for="telefono">Teléfono</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input type="number" class="form-control" name="saldo" placeholder="Enter saldo" required value="${cliente.saldo}" step="any">
                                        <label for="saldo">Saldo</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </form>
        <!-- Boton de navegacion de editar cliente-->
        <main>
            <!-- NO SE AGREGA EL Listado de clientes (privado) -->
            <!-- NO SE Agregar cliente Modal-->
        </main>
        <!-- Pie de pagina FOOOTER-->
        <jsp:include page="/WEB-INF/paginas/comunes/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    </body>
</html>