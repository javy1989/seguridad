/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.Tamanio;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author Ricardo.Bravo
 */
@FacesConverter(forClass = Tamanio.class)
public class TamanioC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        Tamanio tamanio = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            tamanio = bean.traeTamanio(id);
        } catch (ConsultarException | NumberFormatException e) {
        }
        return tamanio;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        Tamanio tipo = (Tamanio) value;
        if (tipo.getId() == null) {
            return "0";
        }
        return ((Tamanio) value).getId().toString();
    }

}
