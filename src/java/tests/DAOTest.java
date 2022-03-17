package tests;

import com.ufpr.tads.web2.dao.ConnectionFactory;
import com.ufpr.tads.web2.beans.Usuario;
import com.ufpr.tads.web2.dao.exceptions.DAOException;
import com.ufpr.tads.web2.dao.UsuarioDAO;

public class DAOTest {
    public static void main(String[] args) {
        try (ConnectionFactory factory = new ConnectionFactory()) {
            UsuarioDAO dao = new UsuarioDAO(factory.getConnection());
            Usuario user = dao.getByLogin("login");
            if(user != null) {
                System.out.println(user.toString());
            }else{
                System.out.println("User not found");
            }
        }catch(DAOException e) {
            System.out.println("#### ERRO DE DAO: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
