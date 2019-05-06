package net.daw.service.specificServiceImplementation_0;

import net.daw.service.genericServiceImplementation.GenericServiceImplementation;
import net.daw.service.publicServiceInterface.ServiceInterface;
import javax.servlet.http.HttpServletRequest;

public class BlogService_0 extends GenericServiceImplementation implements ServiceInterface {

    HttpServletRequest oRequest;
    String ob = null;

    public BlogService_0(HttpServletRequest oRequest) {
        super(oRequest);
        this.oRequest = oRequest;
        ob = oRequest.getParameter("ob");
    }

   



}
