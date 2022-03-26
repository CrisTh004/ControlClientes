package web;

import datos.UsuarioDaoJDBC;
import dominio.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "signOff":
                this.usuarioSingOff(request, response);
                break;
            case "setings":
                this.usuarioSetings(request, response);
                break;
            default:
                this.doDefault(request, response, null);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "login":
                this.usuarioLogin(request, response);
                break;
            case "register":
                this.usuarioRegister(request, response);
                break;
            case "modificar":
                this.modificarUsuario(request, response);
                break;
            default:
                response.sendRedirect("login.jsp");
                break;
        }
    }

    private void doDefault(HttpServletRequest request, HttpServletResponse response, Usuario usuario) throws IOException, ServletException {
        HttpSession sesion = request.getSession();
        if (usuario != null) {
            sesion.setAttribute("usuario", usuario);
//            response.sendRedirect("clientes.jsp");
            request.getServletContext().getRequestDispatcher("/ServletControlador?accion=null").forward(request, response);
//            request.getRequestDispatcher(request.getServletContext()+"/ServletControlador").forward(request, response);
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    private void usuarioLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Usuario usuarioIngreso = null;

        //Obtenemos los usuarios que ya han sido registrados
        List<Usuario> usuarios = new UsuarioDaoJDBC().select();

        if (usuarios != null) {
            usuarioIngreso = validarIngreso(usuarios, email, password, request);
            if (usuarioIngreso != null) {
                this.doDefault(request, response, usuarioIngreso);
            } else {
                this.doDefault(request, response, null);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    private void usuarioRegister(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String userName = request.getParameter("usuario");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        int registrosModificados = new UsuarioDaoJDBC().insert(new Usuario(userName, email, password));
        request.getSession().setAttribute("notificacion", "Hola, se acaba de registrar correctamente!! ahora puede iniciar sesion y ver la lista de clientes :D");
        response.sendRedirect("login.jsp");
    }

    private void usuarioSingOff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        sesion.invalidate();
        request.getSession().setAttribute("notificacion", "Se ha cerrado la sesión de forma correcta");
        request.getSession().setAttribute("usuario", null);
        request.getSession().setAttribute("sesionNueva", true);
        response.sendRedirect("clientes.jsp");
//        request.getRequestDispatcher("/ServletControlador").forward(request, response);
    }

    private Usuario validarIngreso(List<Usuario> usuarios, String email, String password, HttpServletRequest request) {
        for (Usuario user : usuarios) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                if (user.getPassword().equalsIgnoreCase(password)) {
                    return user;
                } else {
                    request.setAttribute("mensage", "contraseña invalida. Inténtalo de nuevo.");
                }
            } else {
                request.setAttribute("mensage", "No se encontró la dirección de correo electrónico. Inténtalo de nuevo.");
            }
        }
        return null;
    }

    private void usuarioSetings(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jspSetings = "/WEB-INF/paginas/usuario/configuracionUsuario.jsp";
        request.getRequestDispatcher(jspSetings).forward(request, response);
    }

    private void modificarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
        String userName = request.getParameter("usuario");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Usuario usuarioModificado = new Usuario(idUsuario, userName, email, password);
        int registrosModificados = new UsuarioDaoJDBC().update(usuarioModificado);
        request.getSession().setAttribute("notificacion", "Se han modificado los datos correctamente");
        this.doDefault(request, response, usuarioModificado);
//        request.getServletContext().getRequestDispatcher("/ServletControlador?accion=null").forward(request, response);
    }
}
