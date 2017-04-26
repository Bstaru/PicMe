
package Controlador;

import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Consulta extends Conexion {

    /*  public static void main(String[] args)  {
       Consulta co =  new Consulta();
       System.out.println( co.editarPer(5,"esto es una descripcion",null,null));
   } */
    public boolean autenticacion(String email, String contra) {
        
        CallableStatement proc = null;
        ResultSet rs = null;

        try {
            String consulta = "{ call loguser(?, ?) }";
            proc = getCon().prepareCall(consulta);
            proc.setString(1, email);
            proc.setString(2, contra);
            rs = proc.executeQuery();

            if (rs.absolute(1)) {
                return true;
            }
        } catch (Exception ex) {
            System.err.println("Error"+ex);
        }finally {
            try{
                if(getCon()!=null) getCon().close();
                if (proc != null) proc.close();
                if (rs != null) rs.close();
            }
            catch (Exception e){
                System.err.println("Error"+e);
            }
        }
        return false;
    }

    public boolean registrar(String username, String contra,String email,int genero, InputStream imagenP, InputStream imagenC,
        String nombre, String descp, boolean tipo, boolean privado, String dia, String resp, int ciudad, int pregunta){ 
    
     CallableStatement proc = null;
     
     try{
         String consulta = "{ call newuser(?,?,?,?,?,?,?,?,?,?,?,?,?,?) }";
         proc = getCon().prepareCall(consulta);
         proc.setString(1, username);
         proc.setString(2, contra);
         proc.setString(3, email);
         proc.setInt(4, genero); 
         
         proc.setBlob(5, imagenP);
         proc.setBlob(6, imagenC);
             
         proc.setString(7, nombre);
         proc.setString(8, descp);  
         proc.setBoolean(9, tipo);
         proc.setBoolean(10,privado);  
         proc.setString(11, dia);
         proc.setString(12, resp);      
         proc.setInt(13, ciudad);
         proc.setInt(14, pregunta);
                  
         if (proc.executeUpdate() ==  1){
             return true;
         }         
        }catch(Exception ex){
         System.err.println("Error"+ex);
        }finally {
         try{
              if(getCon()!=null) getCon().close();
              if (proc != null) proc.close();
            }
         catch (Exception e){
                System.err.println("Error"+e);
            }
     }
    return false;
}
 
    public boolean registrarPo(String dia, String titulo,String cuerpo,String tipo, InputStream imagenPost, String videoPost, int idu){ 
    
     CallableStatement proc = null;
     
     try{
         String consulta = "{ call newpost(?,?,?,?,?,?,?) }";
         proc = getCon().prepareCall(consulta);
         proc.setString(1, dia);
         proc.setString(2, titulo);
         proc.setString(3, cuerpo);
         proc.setString(4, tipo);          
         proc.setBlob(5, imagenPost);             
         proc.setString(6, videoPost);
         proc.setInt(7, idu);
                  
         if (proc.executeUpdate() ==  1){
             return true;
         }         
        }catch(Exception ex){
         System.err.println("Error"+ex);
        }finally {
         try{
              if(getCon()!=null) getCon().close();
              if (proc != null) proc.close();
            }
         catch (Exception e){
                System.err.println("Error"+e);
            }
     }
    return false;
}
      
    public boolean editar(int idus, String username, String contra,String email,int genero, String nombre,  
         boolean privado, String dia, String resp, int ciudad, int pregunta){
       CallableStatement proc = null;
     
     try{
         String consulta = "{ call edituser(?,?,?,?,?,?,?,?,?,?,?) }";
         proc = getCon().prepareCall(consulta);
         proc.setInt(1, idus);
         proc.setString(2, username);
         proc.setString(3, contra);
         proc.setString(4, email);
         proc.setInt(5, genero);    
         proc.setString(6, nombre);
         proc.setBoolean(7,privado);  
         proc.setString(8, dia);
         proc.setString(9, resp);      
         proc.setInt(10, ciudad);
         proc.setInt(11, pregunta);
                  
         if (proc.executeUpdate() ==  1){
             return true;
         }         
        }catch(Exception ex){
         System.err.println("Error"+ex);
        }finally {
         try{
              if(getCon()!=null) getCon().close();
              if (proc != null) proc.close();
            }
         catch (Exception e){
                System.err.println("Error"+e);
            }
        }        
       return false;
      }
      
    public boolean editarPer(int idus,String descp,InputStream imagenP, InputStream imagenC){
       CallableStatement proc = null;
     
     try{
         String consulta = "{ call editPerfil(?,?,?,?) }";
         proc = getCon().prepareCall(consulta);
         proc.setInt(1, idus);         
         proc.setString(2, descp);
         proc.setBlob(3, imagenP);
         proc.setBlob(4, imagenC);
         
         if (proc.executeUpdate() ==  1){
             return true;
         }         
        }catch(Exception ex){
         System.err.println("Error"+ex);
        }finally {
         try{
              if(getCon()!=null) getCon().close();
              if (proc != null) proc.close();
            }
         catch (Exception e){
                System.err.println("Error"+e);
            }
        }        
       return false;
      }
  
    public boolean editarPo(int idpo,String descp,InputStream imagenPo){
       CallableStatement proc = null;
     
     try{
         String consulta = "{ call editpost(?,?,?) }";
         proc = getCon().prepareCall(consulta);
         proc.setInt(1, idpo);         
         proc.setString(2, descp);
         proc.setBlob(3, imagenPo);
         
         if (proc.executeUpdate() ==  1){
             return true;
         }         
        }catch(Exception ex){
         System.err.println("Error"+ex);
        }finally {
         try{
              if(getCon()!=null) getCon().close();
              if (proc != null) proc.close();
            }
         catch (Exception e){
                System.err.println("Error"+e);
            }
        }        
       return false;
      }
    
    public boolean eliminarPo(int idus){
       CallableStatement proc = null;
     
     try{
         String consulta = "{ call deletpost(?) }";
         proc = getCon().prepareCall(consulta);
         proc.setInt(1, idus); 
         
         if (proc.executeUpdate() ==  1){
             return true;
         }         
        }catch(Exception ex){
         System.err.println("Error"+ex);
        }finally {
         try{
              if(getCon()!=null) getCon().close();
              if (proc != null) proc.close();
            }
         catch (Exception e){
                System.err.println("Error"+e);
            }
        }        
       return false;
      }
   /*  public static void main(String[] args)  {
       Consulta co =  new Consulta();
       System.out.println( co.eliminarPo(3));
   } */
    public boolean buscarAlgo(String usuario){
       CallableStatement proc = null;
     
     try{
         String consulta = "{ call buscar(?) }";
         proc = getCon().prepareCall(consulta);
         proc.setString(1, usuario); 
         
         if (proc.executeUpdate() ==  1){
             return true;
         }         
        }catch(Exception ex){
         System.err.println("Error"+ex);
        }finally {
         try{
              if(getCon()!=null) getCon().close();
              if (proc != null) proc.close();
            }
         catch (Exception e){
                System.err.println("Error"+e);
            }
        }        
       return false;
      }
}

