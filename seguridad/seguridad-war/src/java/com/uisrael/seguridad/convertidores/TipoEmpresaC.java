/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.convertidores;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.bean.FormularioBean;
import com.uisrael.seguridad.entidades.TipoEmpresa;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.convert.Converter;
import javax.faces.convert.FacesConverter;

/**
 *
 * @author desarrollo
 */
@FacesConverter(forClass = TipoEmpresa.class)
public class TipoEmpresaC implements Converter {

    @Override
    public Object getAsObject(FacesContext context, UIComponent component, String value) {
        TipoEmpresa tipo = null;
        try {
            FormularioBean bean = (FormularioBean) context.getELContext().getELResolver().getValue(context.getELContext(), null, "formulario");
            int id = Integer.parseInt(value);
            tipo = bean.traerTipoEmpresa(id);
        } catch (ConsultarException | NumberFormatException e) {
        }
        return tipo;
    }

    @Override
    public String getAsString(FacesContext context, UIComponent component, Object value) {
        TipoEmpresa tipo=(TipoEmpresa)value;
        if (tipo.getId()==null) {
            return "0";
        }
        return ((TipoEmpresa)value).getId().toString();
    }

}
