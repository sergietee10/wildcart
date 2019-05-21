/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package net.daw.bean.beanImplementation;

import com.google.gson.annotations.Expose;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Date;
import net.daw.bean.genericBeanImplementation.GenericBeanImplementation;
import net.daw.bean.publicBeanInterface.BeanInterface;
import net.daw.dao.publicDaoInterface.DaoInterface;
import net.daw.factory.DaoFactory;
import net.daw.helper.EncodingHelper;

/**
 *
 *
 */
public class BlogBean extends GenericBeanImplementation implements BeanInterface {
    
    @Expose
    private String foto;
    @Expose
    private String titulo;
    @Expose
    private String contenido;
    @Expose
    private String etiquetas;
    @Expose(serialize = false)
    private int id_usuario;
    @Expose
    private Date fecha;
    @Expose(deserialize = false)
    private UsuarioBean obj_Usuario;

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public String getEtiquetas() {
        return etiquetas;
    }

    public void setEtiquetas(String etiquetas) {
        this.etiquetas = etiquetas;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public UsuarioBean getObj_Usuario() {
        return obj_Usuario;
    }

    public void setObj_Usuario(UsuarioBean obj_Usuario) {
        this.obj_Usuario = obj_Usuario;
    }
    

    @Override
    public BlogBean fill(ResultSet oResultSet, Connection oConnection, Integer expand, UsuarioBean oUsuarioBeanSession) throws Exception {

        this.setId(oResultSet.getInt("id"));
        this.setFoto(oResultSet.getString("foto"));
        this.setTitulo(oResultSet.getString("titulo"));
        this.setContenido(oResultSet.getString("contenido"));
        this.setEtiquetas(oResultSet.getString("etiquetas"));
        this.setId_usuario(oResultSet.getInt("id_usuario"));
        this.setFecha(oResultSet.getDate("fecha"));
        
        
        
        if (expand > 0) {
            DaoInterface oUsuarioDao = DaoFactory.getDao(oConnection, "usuario", oUsuarioBeanSession);
            this.setObj_Usuario((UsuarioBean) oUsuarioDao.get(oResultSet.getInt("id_usuario"), expand - 1));
        } else {
            this.setId_usuario(oResultSet.getInt("id_usuario"));
        }
        
        
        
        return this;
    }

    @Override
    public String getPairs() {
        
        ZoneId defaultZoneId = ZoneId.systemDefault();

        Instant instant = fecha.toInstant();

        LocalDate localDate = instant.atZone(defaultZoneId).toLocalDate();
        
        String strPairs = "";
        strPairs += "foto=" + EncodingHelper.quotate(foto) + ",";
        strPairs += "titulo=" + EncodingHelper.quotate(titulo) + ",";
        strPairs += "contenido=" + EncodingHelper.quotate(contenido) + ",";
        strPairs += "etiquetas=" + EncodingHelper.quotate(etiquetas) + ",";
        strPairs += "id_usuario=" + id_usuario + ",";
        strPairs += "fecha=" + EncodingHelper.quotate(localDate.toString());
        strPairs += " WHERE id=" + id;
        return strPairs;

    }

    @Override
    public String getColumns() {
        String strColumns = "";
        strColumns += "id,";
        strColumns += "foto,";
        strColumns += "titulo,";
        strColumns += "contenido,";
        strColumns += "etiquetas,";
        strColumns += "id_usuario,";
        strColumns += "fecha";
        return strColumns;
    }

    @Override
    public String getValues() {

        ZoneId defaultZoneId = ZoneId.systemDefault();

        Instant instant = fecha.toInstant();

        LocalDate localDate = instant.atZone(defaultZoneId).toLocalDate();
        
        String strColumns = "";
        strColumns += "null,";
        strColumns += EncodingHelper.quotate(foto) + ",";
        strColumns += EncodingHelper.quotate(titulo) + ",";
        strColumns += EncodingHelper.quotate(contenido) + ",";
        strColumns += EncodingHelper.quotate(etiquetas) + ",";
        strColumns += this.getId_usuario() + ",";
        strColumns += EncodingHelper.quotate(localDate.toString());
        return strColumns;
    }
}
