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
import java.io.File;
import java.util.HashMap;
import java.util.List;
import net.daw.factory.ConnectionFactory;
import net.daw.factory.DaoFactory;
import net.daw.helper.EncodingHelper;
import net.daw.service.genericServiceImplementation.GenericServiceImplementation;
import net.daw.service.publicServiceInterface.ServiceInterface;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class BlogService_1 extends GenericServiceImplementation implements ServiceInterface {

    HttpServletRequest oRequest;
    String ob = null;
    
    public BlogService_1(HttpServletRequest oRequest) {
       super(oRequest);
        this.oRequest = oRequest;
        ob = oRequest.getParameter("ob");
    }

    public ReplyBean loadimage() throws Exception {
        ReplyBean oReplyBean = null;
        String name = "";
        String strMessage = "";
        HashMap<String, String> hash = new HashMap<>();
        if (ServletFileUpload.isMultipartContent(oRequest)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(oRequest);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        name = new File(item.getName()).getName();
                        item.write(new File(".//..//webapps//imagenes//" + name));
                    } else {
                        hash.put(item.getFieldName(), item.getString());
                    }
                }
                strMessage = "File upload";
                Gson oGson = new Gson();
                oReplyBean = new ReplyBean(200, oGson.toJson(strMessage));
            } catch (Exception ex) {
                strMessage = "Failed to upload file";
                oReplyBean = new ReplyBean(500, "ERROR: " + EncodingHelper.escapeQuotes(EncodingHelper.escapeLine(ex.getMessage())) + strMessage);
            }
        } else {
            strMessage = "File no upload";
            oReplyBean = new ReplyBean(500, "ERROR: " + EncodingHelper.escapeQuotes(EncodingHelper.escapeLine(strMessage)));
        }

        return oReplyBean;

    }
    

}
