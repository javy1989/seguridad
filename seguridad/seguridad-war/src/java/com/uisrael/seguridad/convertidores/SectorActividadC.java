/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.SectorActividad;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author ricardo
 */
@FacesConverter(forClass = SectorActividad.class)
public class SectorActividadC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        SectorActividad actividad = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            actividad = bean.traeSectorActividad(id);
        } catch (ConsultarException | NumberFormatException e) {
        }
        return actividad;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        SectorActividad actividad = (SectorActividad) value;
        if (actividad.getId() == null) {
            return "0";
        }
        return ((SectorActividad) value).getId().toString();
    }

}
