/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.TipoSector;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author ricardo
 */
@FacesConverter(forClass = TipoSector.class)
public class TipoSectorC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TipoSector sector = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            sector = bean.traeTipoSector(id);
        } catch (ConsultarException | NumberFormatException e) {
        }
        return sector;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        TipoSector sector = (TipoSector) value;
        if (sector.getId() == null) {
            return "0";
        }
        return ((TipoSector)value).getId().toString();
    }

}
