/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.dao.specificDaoImplementation_0;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import net.daw.bean.beanImplementation.UsuarioBean;
import net.daw.bean.publicBeanInterface.BeanInterface;
import net.daw.dao.genericDaoImplementation.GenericDaoImplementation;
import net.daw.dao.publicDaoInterface.DaoInterface;

/**
 *
 * @author Ramón
 */
public class UsuarioDao_0  extends GenericDaoImplementation implements DaoInterface{

 public UsuarioDao_0(Connection oConnection, String ob,UsuarioBean oUsuarioBeanSession) {
        super(oConnection, ob, oUsuarioBeanSession);
    }

   @Override
    public BeanInterface get(int id, Integer expand) throws Exception {
        UsuarioBean oUsuario = (UsuarioBean) super.get(id, expand);
        oUsuario.setDni("");
        oUsuario.setLogin("");
        oUsuario.setPass("");
        oUsuario.setCode("");
        return oUsuario;
    }

    @Override
    public int remove(int id) throws Exception {
        throw new Exception("Error en Dao remove de " + ob + ": No autorizado");
    }

    @Override
    public int getcount() throws Exception {
        throw new Exception("Error en Dao remove de " + ob + ": No autorizado");
    }

    @Override
    public BeanInterface create(BeanInterface oBean) throws Exception {
        throw new Exception("Error en Dao remove de " + ob + ": No autorizado");
    }
    
    public UsuarioBean register(UsuarioBean oBean) throws Exception {
        return (UsuarioBean) super.create(oBean);
    }

    public int checkUsuario(String strUserName)throws Exception {
        String strSQL = "SELECT COUNT(login) FROM usuario WHERE login=?";
        int resultado = 0;
        ResultSet oResultSet = null;
        PreparedStatement oPreparedStatement = null;
        try {
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            oPreparedStatement.setString(1, strUserName);
            oResultSet = oPreparedStatement.executeQuery();
            if (oResultSet.next()) {
                resultado = oResultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new Exception("Error en Dao get de " + ob, e);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return resultado;

    }
    
    public int checkDni(String strDni)throws Exception {
        String strSQL = "SELECT COUNT(dni) FROM usuario WHERE dni=?";
        int resultado = 0;
        ResultSet oResultSet = null;
        PreparedStatement oPreparedStatement = null;
        try {
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            oPreparedStatement.setString(1, strDni);
            oResultSet = oPreparedStatement.executeQuery();
            if (oResultSet.next()) {
                resultado = oResultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new Exception("Error en Dao get de " + ob, e);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return resultado;

    }
    
    
    public int checkEmail(String strUserEmail)throws Exception {
        String strSQL = "SELECT COUNT(email) FROM usuario WHERE email=?";
        int resultado = 0;
        ResultSet oResultSet = null;
        PreparedStatement oPreparedStatement = null;
        try {
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            oPreparedStatement.setString(1, strUserEmail);
            oResultSet = oPreparedStatement.executeQuery();
            while (oResultSet.next()) {
                resultado = oResultSet.getInt(1);
            }
        } catch (SQLException e) {
            throw new Exception("Error en Dao get de " + ob, e);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return resultado;

    }
    
    public UsuarioBean validation(String code, Integer expand)throws Exception {
        String strSQL = "SELECT * FROM usuario WHERE code=?";
        UsuarioBean usuario;
        ResultSet oResultSet = null;
        PreparedStatement oPreparedStatement = null;
        try {
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            oPreparedStatement.setString(1, code);
            oResultSet = oPreparedStatement.executeQuery();
            if (oResultSet.next()) {
              usuario = new UsuarioBean();
              usuario.fill(oResultSet, oConnection, expand, oUsuarioBeanSession);
            } else {
                usuario = null;
            }
        } catch (SQLException e) {
            throw new Exception("Error en Dao get de " + ob, e);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return usuario;

    }
    
    public int update(UsuarioBean oBean) throws Exception {
        int iResult = 0;
        strSQL_update = "UPDATE " + ob + " SET ";
        strSQL_update += oBean.getPairsValidacion();
        PreparedStatement oPreparedStatement = null;
        try {
            oPreparedStatement = oConnection.prepareStatement(strSQL_update);
            iResult = oPreparedStatement.executeUpdate();

        } catch (SQLException e) {
            throw new Exception("Error en Dao update de " + ob + ": " + e.getMessage(), e);
        } finally {
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return iResult;
    }

    @Override
    public ArrayList<BeanInterface> getpage(int iRpp, int iPage, HashMap<String, String> hmOrder, Integer expand) throws Exception {        
        throw new Exception("Error en Dao remove de " + ob + ": No autorizado");
    }

    public UsuarioBean login(String strUserName, String strPassword) throws Exception {
        String strSQL = "SELECT * FROM " + ob + " WHERE login=? AND pass=? AND active>0";
        UsuarioBean oUsuarioBean;
        ResultSet oResultSet = null;
        PreparedStatement oPreparedStatement = null;
        try {
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            oPreparedStatement.setString(1, strUserName);
            oPreparedStatement.setString(2, strPassword);
            oResultSet = oPreparedStatement.executeQuery();
            if (oResultSet.next()) {
                oUsuarioBean = new UsuarioBean();
                oUsuarioBean.fill(oResultSet, oConnection, 1, oUsuarioBeanSession);
            } else {
                oUsuarioBean = null;
            }
        } catch (SQLException e) {
            throw new Exception("Error en Dao get de " + ob, e);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return oUsuarioBean;
    }
    
}
