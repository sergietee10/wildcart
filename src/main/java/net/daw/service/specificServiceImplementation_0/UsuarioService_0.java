/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.service.specificServiceImplementation_0;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import net.daw.bean.beanImplementation.ReplyBean;
import net.daw.bean.beanImplementation.UsuarioBean;
import net.daw.bean.publicBeanInterface.BeanInterface;
import net.daw.connection.publicinterface.ConnectionInterface;
import net.daw.constant.ConnectionConstants;
import net.daw.dao.publicDaoInterface.DaoInterface;
import net.daw.dao.specificDaoImplementation_0.UsuarioDao_0;
import net.daw.dao.specificDaoImplementation_1.UsuarioDao_1;
import net.daw.factory.BeanFactory;
import net.daw.factory.ConnectionFactory;
import net.daw.factory.DaoFactory;
import net.daw.helper.EncodingHelper;
import net.daw.service.genericServiceImplementation.GenericServiceImplementation;
import net.daw.service.publicServiceInterface.ServiceInterface;

/**
 *
 * @author Ramón
 */
public class UsuarioService_0 extends GenericServiceImplementation implements ServiceInterface {

    public UsuarioService_0(HttpServletRequest oRequest) {
        super(oRequest);
        ob = oRequest.getParameter("ob");
    }

    public ReplyBean fill() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            Integer number = Integer.parseInt(oRequest.getParameter("number"));
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            UsuarioDao_1 oUsuarioDao = new UsuarioDao_1(oConnection, ob, oUsuarioBeanSession);
            UsuarioBean oUsuarioBean = new UsuarioBean();
            for (int i = 1; i <= number; i++) {
                oUsuarioBean.setDni("765934875A");
                oUsuarioBean.setNombre("Rigoberto");
                oUsuarioBean.setApe1("Pérez");
                oUsuarioBean.setApe2("Gómez");
                oUsuarioBean.setLogin("ripego");
                oUsuarioBean.setPass("hola");
                oUsuarioBean.setEmail("rigobertogp@gmail.com");
                oUsuarioBean.setId_tipoUsuario(2);
                oUsuarioBean = (UsuarioBean) oUsuarioDao.create(oUsuarioBean);
            }
            oReplyBean = new ReplyBean(200, oGson.toJson(number));
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: create method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }

        return oReplyBean;
    }

    public ReplyBean login() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        String strLogin = oRequest.getParameter("user");
        String strPassword = oRequest.getParameter("pass");

        oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
        oConnection = oConnectionPool.newConnection();
        UsuarioDao_0 oUsuarioDao = new UsuarioDao_0(oConnection, ob, oUsuarioBeanSession);

        UsuarioBean oUsuarioBean = oUsuarioDao.login(strLogin, strPassword);
        if (oUsuarioBean != null) {
            if (oUsuarioBean.getId() > 0) {
                oRequest.getSession().setAttribute("user", oUsuarioBean);
                oRequest.getSession().setAttribute("user_id", oUsuarioBean.getId());
                Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
                oReplyBean = new ReplyBean(200, oGson.toJson(oUsuarioBean));
            } else {
                //throw new Exception("ERROR Bad Authentication: Service level: get page: " + ob + " object");
                oReplyBean = new ReplyBean(401, "Bad Authentication");
            }
        } else {
            oReplyBean = new ReplyBean(401, "Bad Authentication");
        }
        oConnectionPool.disposeConnection();
        return oReplyBean;
    }

    public ReplyBean logout() throws Exception {
        oRequest.getSession().invalidate();
        return new ReplyBean(200, EncodingHelper.quotate("OK"));
    }

    public ReplyBean check() throws Exception {
        ReplyBean oReplyBean;
        //Aquí  no haría falta el usuarioBean de session, ya lo cogemos del generic, pero lo dejo por ahora:
        UsuarioBean oUsuarioBean;
        oUsuarioBean = (UsuarioBean) oRequest.getSession().getAttribute("user");
        if (oUsuarioBean != null) {
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            oReplyBean = new ReplyBean(200, oGson.toJson(oUsuarioBean));
        } else {
            oReplyBean = new ReplyBean(401, "No active session");
        }
        return oReplyBean;
    }

    public ReplyBean validation() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        try {
            String strJsonFromClient = oRequest.getParameter("code");
          
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
          
            UsuarioDao_0 oDao_0 = (UsuarioDao_0) DaoFactory.getDao(oConnection, "usuario", oUsuarioBeanSession);

            //si el id existe en la base de datos cambiar el campo active de false a true
            
            //enviar mail avisando de que se ha activado y que puede loguearse
            
            oReplyBean = new ReplyBean(200, "Usuario validado correctamente");

            oConnectionPool.disposeConnection();
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: register method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;
    }

    public ReplyBean register() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        Gson oGson;
        try {
            String strJsonFromClient = oRequest.getParameter("json");
            oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            UsuarioBean oBean = (UsuarioBean) BeanFactory.getBeanFromJson("usuario", oGson, strJsonFromClient);
            oBean.setId_tipoUsuario(2);
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            UsuarioDao_0 oDao_0 = (UsuarioDao_0) DaoFactory.getDao(oConnection, "usuario", oUsuarioBeanSession);

            //comprobar email no se repita y username no se repita
            int oUsuarioBean = oDao_0.checkUsuario(oBean.getLogin());
            int oUsuarioeBean = oDao_0.checkEmail(oBean.getEmail());
            //si no existe el usuario ni el email entonces crear usuario y devolver reply bean
            if (oUsuarioBean > 0) {
                oReplyBean = new ReplyBean(400, "Ese usuario ya esta registrado");
            }else if (oUsuarioeBean > 0){
                oReplyBean = new ReplyBean(401, "Ese correo ya esta registrado");
            }else{
                oBean = (UsuarioBean) oDao_0.register(oBean);                
                oGson = new Gson();
                oReplyBean = new ReplyBean(200, oGson.toJson("Usuario creado correctamente"));
                //oReplyBean = new ReplyBean(200, "Usuario creado correctamente");
                //return oReplyBean
            }
            //el usuario creado tendra el campo active a false
            //generar numero guardar en la tabla y enviarlo por correo
            
            //http://localhost:8081/json?ob=usuario&op=validation&code=EDA453WRE667R494UV577D187
        } catch (Exception ex) {
            throw new Exception("ERROR: Service level: register method: " + ob + " object", ex);
        } finally {
            oConnectionPool.disposeConnection();
        }
        return oReplyBean;
    }
}
