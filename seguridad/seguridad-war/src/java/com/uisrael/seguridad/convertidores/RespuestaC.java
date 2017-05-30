/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.Respuesta;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author desarrollo
 */
@FacesConverter(forClass = Respuesta.class)
public class RespuestaC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        Respuesta respuesta = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            respuesta = bean.traeRespuesta(id);
        } catch (ConsultarException | NumberFormatException e) {
            Logger.getLogger(RespuestaC.class.getName()).log(Level.SEVERE, null, e);
        }
        return respuesta;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        Respuesta respuesta = (Respuesta) value;
        if (respuesta.getId() == null) {
            return "0";
        }
        return ((Respuesta) value).getId().toString();
    }

}
