package cl.model;

import cl.database.Conexion;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author acardenas
 */
public class Usuario {

    private int id;
    private String nombre;
    private String pass;
    private int perfil;

    public static Usuario Login(String user, String pass) throws SQLException {
        String query = "SELECT * FROM t_usuario WHERE nombre_corto='" + user + "'";
        ResultSet data = Conexion.getRow(query);
        Usuario u = null;

        if (data != null) {
            if (data.getString("clave").equals(pass)) {
                u = new Usuario(data.getInt("id_usuario"), data.getString("nombre"), data.getString("clave"), data.getInt("id_perfil"));
            }
        }
        return u;
    }

    public Usuario(int id, String nombre, String pass, int perfil) {
        this.id = id;
        this.nombre = nombre;
        this.pass = pass;
        this.perfil = perfil;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getPerfil() {
        return perfil;
    }

    public void setPerfil(int perfil) {
        this.perfil = perfil;
    }

}
