package cl.database;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author javaEE
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author alumno
 */
public class Conexion {

 /**
  * Variables de clase con la configuracion de la base de datos
  */
    private static String usuario = "root";
    private static String clave = "";
    private static String bd = "institucion";
    private static String servidor = "localhost:3306";
    private static String url = "jdbc:mysql://" + servidor + "/" + bd;
   
    private static Connection conexion;
    private static Statement sentencia;
    private static ResultSet datos;
 
/**
 * M�todo cargarDriver()
 * @return true o false
 */
    public static boolean cargarDriver() { // comprobamos si existe el driver.
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver cargado exitosamente");
            return true;
        } catch (ClassNotFoundException ex) {
            System.out.println("Error al cargar el driver");
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
 

   /**
    * mostrarDatos()
    *
     * @param query
    * @return un ResultSet
    */
    public static ResultSet getResults(String query) { // método  para  realizar una consulta que fe
 
        try {
            sentencia = getConexion().createStatement();
            datos = sentencia.executeQuery(query);
        } catch (SQLException ex) {
            System.out.println("Error en mostrarDatos():" + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }
   public static ResultSet getRow(String query) throws SQLException {
 
        try {
            sentencia = getConexion().createStatement();
            sentencia.setMaxRows(1);
            datos = sentencia.executeQuery(query);
            datos.next();
        } catch (SQLException ex) {
            System.out.println("Error en mostrarDatos():" + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return datos;
    }
    /**
     * getConexion
     * @return
     */
    public static Connection getConexion() {
        if (cargarDriver()) {
            try {
                conexion = DriverManager.getConnection(url, usuario, clave);
            } catch (SQLException ex) {
                System.out.println("Error en getConexion(): " + ex.getMessage());
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return conexion;
    }
 
    /**
     *
     * @param consulta
     * @return
     */
    public static int insertarEditarBorrar(String consulta) {
        int valor = 0;
        try {
            sentencia = getConexion().createStatement();
            valor = sentencia.executeUpdate(consulta);
        } catch (SQLException ex) {
            System.out.println("Error en mostrarinsertarEditarBorrar():" + ex.getMessage());
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return valor;
    }

    public static Statement createStatement() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public static void close() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public ResultSet executeQuery(String string) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}