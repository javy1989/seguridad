/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.utilidades;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;

/**
 *
 * @author root
 */
public class MostrarMensaje {

    public static void error(String resumen, String detalle) {
        FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_ERROR, resumen, detalle);
        FacesContext.getCurrentInstance().addMessage(null, fm);

    }

    public static void informacion(String resumen, String detalle) {
        FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_INFO, resumen, detalle);
        FacesContext.getCurrentInstance().addMessage(null, fm);
    }

    public static void fatal(String resumen, String detalle) {
        FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_FATAL, resumen, detalle);
        FacesContext.getCurrentInstance().addMessage(null, fm);
    }

    public static void warning(String resumen, String detalle) {
        FacesMessage fm = new FacesMessage(FacesMessage.SEVERITY_WARN, resumen, detalle);
        FacesContext.getCurrentInstance().addMessage(null, fm);
    }

}
