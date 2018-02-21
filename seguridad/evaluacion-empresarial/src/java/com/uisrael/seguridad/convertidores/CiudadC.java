/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.Ciudad;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author desarrollo
 */
@FacesConverter(forClass = Ciudad.class)
public class CiudadC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        Ciudad ciudad = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            ciudad = bean.traerCiudad(id);
        } catch (ConsultarException | NumberFormatException e) {
        }
        return ciudad;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        Ciudad ciudad = (Ciudad) value;
        if (ciudad.getId() == null) {
            return "0";
        }
        return ((Ciudad) ciudad).getId().toString();
    }

}
