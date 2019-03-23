/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.dao.specificDaoImplementation_2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import net.daw.bean.beanImplementation.UsuarioBean;
import net.daw.bean.publicBeanInterface.BeanInterface;
import net.daw.dao.genericDaoImplementation.GenericDaoImplementation;
import net.daw.dao.publicDaoInterface.DaoInterface;
import net.daw.helper.EncodingHelper;

/**
 *
 * @author Ramón
 */
public class UsuarioDao_2 extends GenericDaoImplementation implements DaoInterface {

    public UsuarioDao_2(Connection oConnection, String ob, UsuarioBean oUsuarioBeanSession) {
        super(oConnection, ob, oUsuarioBeanSession);

    }
    
    @Override
    public BeanInterface get(int id, Integer expand) throws Exception {

        if (id == oUsuarioBeanSession.getId()) {
            return (UsuarioBean) super.get(id, expand);
        } else {
            throw new Exception("Error en Dao get de " + ob + ": No autorizado");
        }

    }

    
    @Override
    public int remove(int id) throws Exception {
        throw new Exception("Error en Dao remove de " + ob + ": No autorizado");
    }
    
    @Override
    public int getcount() throws Exception {
        throw new Exception("Error en Dao getcount de " + ob + ": No autorizado");
    }

    
    @Override
    public UsuarioBean create(BeanInterface oBean) throws Exception {
        throw new Exception("Error en Dao create de " + ob + ": No autorizado");
    }

    
    @Override
    public int update(BeanInterface oBean) throws Exception {
        int id=oBean.getId();
        if (id == oUsuarioBeanSession.getId()) {
            return super.update(oBean);
        } else {
            throw new Exception("Error en Dao update de " + ob + ": No autorizado");
        }
    }

    @Override
    public ArrayList<BeanInterface> getpage(int iRpp, int iPage, HashMap<String, String> hmOrder, Integer expand) throws Exception {
        throw new Exception("Error en Dao getpage de " + ob + ": No autorizado");

    }
   public int updatePass(Integer id, String pass, UsuarioBean usuarioSession) throws Exception {
        int iResult = 0;
        String strSQL = "UPDATE " + ob + " SET pass = " + EncodingHelper.quotate(pass) + " WHERE id =" + id + ";";
        ResultSet oResultSet = null;
        PreparedStatement oPreparedStatement = null;
        try {
            if(usuarioSession.getId() == id){
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            iResult = oPreparedStatement.executeUpdate();
            }else{
            iResult = 0;
            }
        } catch (Exception e) {
            throw new Exception(e);
        } finally {
            if (oResultSet != null) {
                oResultSet.close();
            }
            if (oPreparedStatement != null) {
                oPreparedStatement.close();
            }
        }
        return iResult;
    }
}
