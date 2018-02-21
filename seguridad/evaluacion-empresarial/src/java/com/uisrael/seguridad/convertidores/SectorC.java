/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.Sector;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author ricardo
 */
@FacesConverter(forClass = Sector.class)
public class SectorC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        Sector sector = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            sector = bean.traeSector(id);
        } catch (ConsultarException | NumberFormatException e) {
        }
        return sector;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        Sector sector = (Sector) value;
        if (sector.getId() == null) {
            return "0";
        }
        return ((Sector)value).getId().toString();
    }

}
