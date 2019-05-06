/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.service.specificServiceImplementation_1;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.sql.Connection;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import net.daw.bean.beanImplementation.BlogBean;
import net.daw.bean.beanImplementation.ReplyBean;
import net.daw.connection.publicinterface.ConnectionInterface;
import net.daw.constant.ConnectionConstants;
import net.daw.dao.publicDaoInterface.DaoInterface;
import net.daw.dao.specificDaoImplementation_1.BlogDao_1;
import net.daw.factory.BeanFactory;
import com.thedeanda.lorem.Lorem;
import com.thedeanda.lorem.LoremIpsum;
import net.daw.factory.ConnectionFactory;
import net.daw.factory.DaoFactory;
import net.daw.service.genericServiceImplementation.GenericServiceImplementation;
import net.daw.service.publicServiceInterface.ServiceInterface;

public class BlogService_1 extends GenericServiceImplementation implements ServiceInterface {

    HttpServletRequest oRequest;
    String ob = null;
    
    public BlogService_1(HttpServletRequest oRequest) {
       super(oRequest);
        this.oRequest = oRequest;
        ob = oRequest.getParameter("ob");
    }

    public ReplyBean fillBlog() throws Exception {
        ReplyBean oReplyBean;
        ConnectionInterface oConnectionPool = null;
        Connection oConnection;
        Lorem lorem = LoremIpsum.getInstance();
        try {
            int numero = Integer.parseInt(oRequest.getParameter("num"));
            Gson oGson = (new GsonBuilder()).excludeFieldsWithoutExposeAnnotation().create();
            oConnectionPool = ConnectionFactory.getConnection(ConnectionConstants.connectionPool);
            oConnection = oConnectionPool.newConnection();
            String[] titulo1 = {"La huerta", "El campo", "La cosecha", "El clima"};
            String[] titulo2 = {"de hoy", "este año", "mejora", "empeora", "en la ciudad"};
            String mensaje = lorem.getParagraphs(3, 4);
            String[] foto = {"noticias1.jpeg", "noticias2.jpeg", "noticias3.jpeg", "noticias4.jpeg", "noticias5.jpeg"};
            int[] id_usuario = {52, 53, 54, 55, 56};

            ArrayList<BlogBean> resultado = new ArrayList<>();

            DaoInterface oDao = DaoFactory.getDao(oConnection, ob, oUsuarioBeanSession);
            for (int i = 0; i < numero; i++) {
                BlogBean oBean = (BlogBean) BeanFactory.getBean(ob);
                oBean.setTitulo(titulo1[randomMath(titulo1.length)] + " " + titulo2[randomMath(titulo2.length)]);
                oBean.setContenido(mensaje);
                oBean.setEtiquetas(mensaje);
                oBean.setId_usuario(id_usuario[randomMath(id_usuario.length)]);
                resultado.add(oBean);
                oDao.create(oBean);
            }
            oReplyBean = new ReplyBean(200, oGson.toJson(resultado));
        } catch (Exception e) {
            throw new Exception("ERROR: Service level: create method: " + ob + " object: " + e.getMessage(), e);
        } finally {
            oConnectionPool.disposeConnection();
        }

        return oReplyBean;
    }

    private int randomMath(int number) {
        return (int) (Math.random() * number);
    }
}
