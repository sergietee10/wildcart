/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.dao.publicDaoInterface;

import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import net.daw.bean.publicBeanInterface.BeanInterface;

/**
 *
 * @author raznara
 */
public interface DaoInterface {

    public BeanInterface get(int id, Integer expand) throws Exception;

    public int remove(int id) throws Exception;

    public int getcount() throws Exception;

    public BeanInterface create(BeanInterface oBean) throws Exception;

    public int update(BeanInterface oBean) throws Exception;

    public ArrayList<BeanInterface> getpage(int iRpp, int iPage, HashMap<String, String> hmOrder, Integer expand) throws Exception;

}
