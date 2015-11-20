/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cl.model;

import cl.control.Sede;
import cl.database.Conexion;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author acardenas
 */

public class DatosSede {
    
    
    public static ArrayList<Sede> getSede()
   {
      ArrayList<Sede> listaSedes=new ArrayList();
      try
      {

           String query = "SELECT * FROM t_sede";
          Conexion.getRow(query);
         ResultSet rs = Conexion.getResults(query);
         while (rs.next())
         {
            Sede datosede = new Sede();
            datosede.setNombreSede(rs.getString("nombre_sede"));
            datosede.setIdSede(rs.getInt("id_sede"));
            
            listaSedes.add(datosede);

         }
         rs.close();
    
         Conexion.close();
      }
      catch (Exception e)
      {
         e.printStackTrace();
      }
      return listaSedes;
   }

    
}
