package web;

import datos.ClienteDaoJDBC;
import dominio.Cliente;
import dominio.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/BuscadorServlet")
public class BuscadorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("q");
        switch (accion) {
            case "search":
                this.buscadorInterno(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }

    private void buscadorInterno(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String buscador = request.getParameter("buscador");
        Usuario usuario = (Usuario)request.getSession().getAttribute("usuario");
        if (usuario != null) {
            List<Cliente> clientes = new ClienteDaoJDBC().select();
            List<Cliente> clientesFiltrados = new ArrayList<>();

            clientes.forEach(cliente -> {
                if (buscador.equalsIgnoreCase(cliente.getNombre().toLowerCase())) {
                    clientesFiltrados.add(cliente);
                }
            });

            if (clientesFiltrados.size() <= 0) {
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("clientes", clientesFiltrados);
                request.setAttribute("saldoTotal", calcularSaldoTotal(clientesFiltrados));
                request.setAttribute("totalClientes", clientesFiltrados.size());
                request.getRequestDispatcher("clientes.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("index.jsp");
        }
    }

    private double calcularSaldoTotal(List<Cliente> clientes) {
        double saldoTotal = 0.0;
        for (Cliente client : clientes) {
            saldoTotal += client.getSaldo();
        }
        return saldoTotal;
    }
}
