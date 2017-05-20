/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.Provincia;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author ricardo
 */
@FacesConverter(forClass = Provincia.class)
public class ProvinciaC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        Provincia provincia=null;
        try {
            FormularioBean bean=(FormularioBean)context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id=Integer.parseInt(value);
            provincia=bean.traerProvincia(id);
            
        } catch (ConsultarException | NumberFormatException e) {
            Logger.getLogger(ProvinciaC.class.getName()).log(Level.SEVERE, null, e);
        }
        return provincia;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        Provincia provincia=(Provincia)value;
        if (provincia.getId()==null) {
            return "0";
        }
        return ((Provincia)value).getId().toString();
    }

}
