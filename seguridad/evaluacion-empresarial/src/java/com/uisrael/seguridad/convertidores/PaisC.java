/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.Pais;
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
@FacesConverter(forClass = Pais.class)
public class PaisC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        Pais pais = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            pais = bean.traerPais(id);
        } catch (ConsultarException | NumberFormatException e) {
            Logger.getLogger(PaisC.class.getName()).log(Level.SEVERE, null, e);
        }
        return pais;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        Pais pais = (Pais) value;
        if (pais.getId() == null) {
            return "0";
        }
        return ((Pais) value).getId().toString();
    }

}
