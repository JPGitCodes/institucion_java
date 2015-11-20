package cl.control;

import cl.model.DatosCarrera;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JP-IMED
 */
public class PeticionesServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String operacion = request.getParameter("operacion");

        switch (operacion) {
            case "obtenerCarrerasDeSede":                
                LinkedList<Carrera> lista = this.obtenerCarrerasDeSede(request);
                String carrerasOptionHtml = "";
                for (int i = 0; i < lista.size(); i++) {
                    carrerasOptionHtml += "<option value='" + lista.get(i).getId() + "'>" + lista.get(i).getCarrera() + "</option>";
                }
                out.println(carrerasOptionHtml);
                break;
        }
    }

    public LinkedList<Carrera> obtenerCarrerasDeSede(HttpServletRequest request) {
        Integer idSede = Integer.parseInt(request.getParameter("sede"));
        DatosCarrera carrera = new DatosCarrera();
        LinkedList<Carrera> lista = carrera.getCarrerasPorSede(idSede);
        return lista;
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
