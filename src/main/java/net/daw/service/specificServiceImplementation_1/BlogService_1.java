/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.service.specificServiceImplementation_1;

import com.google.gson.Gson;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import net.daw.bean.beanImplementation.BlogBean;
import net.daw.bean.beanImplementation.ReplyBean;
import net.daw.connection.publicinterface.ConnectionInterface;
import net.daw.constant.ConnectionConstants;
import net.daw.dao.specificDaoImplementation_1.BlogDao_1;
import net.daw.factory.ConnectionFactory;
import net.daw.factory.DaoFactory;
import net.daw.service.genericServiceImplementation.GenericServiceImplementation;
import net.daw.service.publicServiceInterface.ServiceInterface;

public class BlogService_1 extends GenericServiceImplementation implements ServiceInterface {

    public BlogService_1(HttpServletRequest oRequest) {
        super(oRequest);
        ob = oRequest.getParameter("ob");
        //oUsuarioBeanSession = (UsuarioBean) oRequest.getSession().getAttribute("user");
    }

    public ReplyBean getcountXusuario() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            Integer id = Integer.parseInt(oRequest.getParameter("id"));
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            //FacturaDao_1 oFacturaDao = new FacturaDao_1(oConnection, ob, oUsuarioBeanSession);               
            BlogDao_1 oDao = (BlogDao_1) DaoFactory.getDao(oConnection, ob, oUsuarioBeanSession);
            Integer registros = oDao.getcountBlogUser(id);

            Gson oGson = new Gson();
            oReplyBean = new ReplyBean(200, oGson.toJson(registros));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: getcount method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;

    }

    public ReplyBean getpageXusuario() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            Integer id_usuario = Integer.parseInt(oRequest.getParameter("id"));
            Integer iRpp = Integer.parseInt(oRequest.getParameter("rpp"));
            Integer iPage = Integer.parseInt(oRequest.getParameter("page"));
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            BlogDao_1 oBlogDao = new BlogDao_1(oConnection, ob, oUsuarioBeanSession);
            ArrayList<BlogBean> alLineaBean = oBlogDao.getpageXusuario(iRpp, iPage, id_usuario, 1);
            Gson oGson = new Gson();
            oReplyBean = new ReplyBean(200, oGson.toJson(alLineaBean));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: getpage method: " + ob + " object" + ex.getMessage(), ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;

    }
}
