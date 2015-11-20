package cl.model;

import cl.control.Carrera;
import cl.database.Conexion;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;

/**
 *
 * @author acardenas
 */
public class DatosCarrera {

    public static LinkedList<Carrera> getCarreras() {
        LinkedList<Carrera> listaContactos = new LinkedList<Carrera>();
        try {
            String query = "SELECT tc.descripcion,ts.direccion,ts.nombre_sede, ts.telefono FROM t_carreras tc \n"
                    + "inner join t_sede_carrera tsc on tsc.id_carrera = tc.id_carreras\n"
                    + "inner join t_sede ts on ts.id_sede= tsc.id_sede";
            Conexion.getRow(query);
            ResultSet rs = Conexion.getResults(query);
            while (rs.next()) {
                Carrera carrera = new Carrera();
                carrera.setCarrera(rs.getString("descripcion"));
                carrera.setDirecion(rs.getString("direccion"));
                carrera.setNombresede(rs.getString("nombre_sede"));
                carrera.setTelefono(rs.getString("telefono"));

                listaContactos.add(carrera);
            }
            rs.close();

            Conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaContactos;
    }

    public static LinkedList<Carrera> getCarrerasPorSede(int idSede) {
        LinkedList<Carrera> listaContactos = new LinkedList<Carrera>();
        try {
            String query = "SELECT\n"
                    + "	tc.id_carreras,\n"
                    + "	tc.descripcion,\n"
                    + "	ts.direccion\n"
                    + "FROM\n"
                    + "	t_carreras tc\n"
                    + "INNER JOIN t_sede_carrera tsc ON tsc.id_carrera = tc.id_carreras\n"
                    + "INNER JOIN t_sede ts ON ts.id_sede = tsc.id_sede\n"
                    + "WHERE ts.id_sede = " + idSede;
            Conexion.getRow(query);
            ResultSet rs = Conexion.getResults(query);
            while (rs.next()) {
                Carrera carrera = new Carrera();
                carrera.setId(rs.getString("id_carreras"));
                carrera.setCarrera(rs.getString("descripcion"));
                carrera.setDirecion(rs.getString("direccion"));
                listaContactos.add(carrera);
            }
            rs.close();

            Conexion.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaContactos;
    }

}
