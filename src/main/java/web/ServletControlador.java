package web;

import datos.ClienteDaoJDBC;
import dominio.Cliente;
import dominio.Usuario;
import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "editar":
                    this.editarCliente(request, response);
                    break;
                case "eliminar":
                    this.eliminarCliente(request, response);
                    break;
                default:
                    this.usuario(request, response);
                    break;
            }
        } else {
            this.usuario(request, response);
        }
    }

    private void usuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession sesion = request.getSession();
        Usuario usuario = (Usuario) sesion.getAttribute("usuario");

        if (usuario == null) {
            sesion.setAttribute("sesionNueva", true);
            request.getRequestDispatcher("clientes.jsp").forward(request, response);
        } else {
            List<Cliente> clientes = new ClienteDaoJDBC().select();
            sesion.setAttribute("sesionNueva", false);
            sesion.setAttribute("clientes", clientes);
            sesion.setAttribute("saldoTotal", calcularSaldoTotal(clientes));
            sesion.setAttribute("totalClientes", clientes.size());
            response.sendRedirect("clientes.jsp");
            
            //        request.setAttribute("clientes", clientes);
//        request.setAttribute("saldoTotal", calcularSaldoTotal(clientes));
//        request.setAttribute("totalClientes", clientes.size());
        //Solucion optioma:

        /*
        Al momento en el cual insertamos un nuevo cliente y si le damos refresh este repetira la peticion do post puesto que
        en el url esta la peticion con el: /ServletControlador?accion=Insertar, entonces es obvio que se va a repetir la peticion
        La posible solucion es hacer un sendRedirect al jsp de clientes.jsp ya que en ese caso se eliminaria el: /ServletControlador?accion=Insertar y solo
        quedaria: /ControlClientes/clientes.jsp pero este metodo no pasa los parametros de request entonces nunca llega las variables
        declaradas en este metodo.
        Pero hay un pequeño inconveniente ya que como se ve con el alcance request este solo se guarda en la peticion pero estmos redireccionando
        a otro componente por lo tanto es otra peticion y por lo cual este request se perderia, asi que la solucion mas optima es con el alcance Session
         */
        //request.getRequestDispatcher("clientes.jsp").forward(request, response);
        //Posible solucion:
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String accion = request.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    this.insertarCliente(request, response);
                    break;
                case "modificar":
                    this.modificarCliente(request, response);
                    break;
                default:
                    this.usuario(request, response);
                    break;
            }
        } else {
            this.usuario(request, response);
        }
    }

    private double calcularSaldoTotal(List<Cliente> clientes) {
        double saldoTotal = 0.0;
        for (Cliente client : clientes) {
            saldoTotal += client.getSaldo();
        }
        return saldoTotal;
    }

    private void insertarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //Capturamos los parametros
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = 0;
        String saldoStr = request.getParameter("saldo");
        if (saldoStr != null) {
            saldo = Double.parseDouble(saldoStr);
        }
        //Creamos el objeto de clinete (modelo)
        Cliente cliente = new Cliente(nombre, apellido, email, telefono, saldo);
        ClienteDaoJDBC clienteDao = new ClienteDaoJDBC();
        int registrosModificados = clienteDao.insert(cliente);
//        System.out.println("Registros modificados: " + registrosModificados);

        //Redirigimos a la accion por default
        this.usuario(request, response);
    }

    private void editarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //Recuperamos el idCliente
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        Cliente cliente = new ClienteDaoJDBC().selectId(new Cliente(idCliente));
        request.setAttribute("cliente", cliente);
        String jspEditar = "/WEB-INF/paginas/cliente/editarCliente.jsp";
        request.getRequestDispatcher(jspEditar).forward(request, response);
    }

    private void modificarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //Recuperamos el idCliente
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        double saldo = 0;
        String saldoStr = request.getParameter("saldo");
        if (saldoStr != null) {
            saldo = Double.parseDouble(saldoStr);
        }
        Cliente cliente = new Cliente(idCliente, nombre, apellido, email, telefono, saldo);
        int registrosModificados = new ClienteDaoJDBC().update(cliente);
        //  System.out.println("Registros modificados: " + registrosModificados);
        //Redirigimos a la accion por default
        this.usuario(request, response);
    }

    private void eliminarCliente(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        //Recuperamos el idCliente
        int idCliente = Integer.parseInt(request.getParameter("idCliente"));
        //Eliminamos el objeto en la base de datos
        int registrosModificados = new ClienteDaoJDBC().delete(new Cliente(idCliente));
        //Redirigimos a la accion por default
        this.usuario(request, response);
    }
}
