/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.dao.specificDaoImplementation_1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import net.daw.bean.beanImplementation.BlogBean;
import net.daw.bean.beanImplementation.UsuarioBean;
import net.daw.dao.genericDaoImplementation.GenericDaoImplementation;
import net.daw.dao.publicDaoInterface.DaoInterface;

/**
 *
 * @author a044531896d
 */
public class BlogDao_1 extends GenericDaoImplementation implements DaoInterface{

    public BlogDao_1(Connection oConnection, String ob,UsuarioBean oUsuarioBeanSession) {
        super(oConnection, ob, oUsuarioBeanSession);

    }

    public int getcountXusuario(int idusuario) throws Exception {
        String strSQL_getcount = "SELECT COUNT(id) FROM " + ob + " WHERE id_usuario=? ";
        return super.getcount();
    }

    public ArrayList<BlogBean> getpageXusuario(int iRpp, int iPage, int idUsuario, Integer expand) throws Exception {
        String strSQL = "SELECT * FROM " + ob;
        ArrayList<BlogBean> alBlogBean;
        if (iRpp > 0 && iRpp < 100000 && iPage > 0 && iPage < 100000000) {
            strSQL += " WHERE id_usuario=? ";
            strSQL += " LIMIT " + (iPage - 1) * iRpp + ", " + iRpp;
            ResultSet oResultSet = null;
            PreparedStatement oPreparedStatement = null;
            try {

                oPreparedStatement = oConnection.prepareStatement(strSQL);
                oPreparedStatement.setInt(1, idUsuario);
                oResultSet = oPreparedStatement.executeQuery();
                alBlogBean = new ArrayList<BlogBean>();

                while (oResultSet.next()) {
                    BlogBean oBlogBean = new BlogBean();
                    oBlogBean.fill(oResultSet, oConnection, expand, oUsuarioBeanSession);
                    alBlogBean.add(oBlogBean);
                }
            } catch (SQLException e) {
                throw new Exception("Error en Dao getpage de " + ob, e);
            } finally {
                if (oResultSet != null) {
                    oResultSet.close();
                }
                if (oPreparedStatement != null) {
                    oPreparedStatement.close();
                }
            }
        } else {
            throw new Exception("Error en Dao getpage de " + ob);
        }
        return alBlogBean;

    }
    public int getcountBlogUser(int idusuario) throws Exception {
        String strSQL = "SELECT COUNT(id) FROM " + ob + " WHERE id_usuario=? ";

        int res = 0;
        ResultSet oResultSet = null;
        PreparedStatement oPreparedStatement = null;
        try {
            oPreparedStatement = oConnection.prepareStatement(strSQL);
            oPreparedStatement.setInt(1, idusuario);
            oResultSet = oPreparedStatement.executeQuery();
            if (oResultSet.next()) {
                res = oResultSet.getInt(1);
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
        return res;
    }

}
