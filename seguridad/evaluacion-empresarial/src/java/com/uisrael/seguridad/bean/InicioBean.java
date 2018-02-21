/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.bean;

import com.plancurricular.excepciones.ConsultarException;
import com.uisrael.seguridad.entidades.Formulario;
import com.uisrael.seguridad.servicios.FormularioFacade;
import com.uisrael.seguridad.utilidades.MostrarMensaje;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;

/**
 *
 * @author ricardo
 */
@ManagedBean(name = "inicio")
@ViewScoped
public class InicioBean {
    
    @EJB
    private FormularioFacade ejbFormulario;
    private List<Formulario> formularioList;
    private Formulario formulario;
    
    public InicioBean() {
    }
    
    @PostConstruct
    private void init() {
        try {
            traerFormularios();
        } catch (ConsultarException ex) {
            Logger.getLogger(InicioBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public String traerFormularios() throws ConsultarException {
        Map parametros = new HashMap();
        parametros.put(";where", "o.estado=true");
        formularioList = ejbFormulario.encontarParametros(parametros);
        return null;
    }
    
    
    public List<Formulario> getFormularioList() {
        return formularioList;
    }
    
    public String irFormulario() {
        if (formulario == null) {
            MostrarMensaje.informacion("Informacion", "No se ha seleccionado formulario");
            //"/LoginVista.jsf?faces-redirect=true&g=" + grupo.getId();
        }
        
        return "/formulario.jsf?faces-redirect=true&form="+formulario.getCodigo();
    }
    
    public void setFormularioList(List<Formulario> formularioList) {
        this.formularioList = formularioList;
    }
    
    public Formulario getFormulario() {
        return formulario;
    }
    
    public void setFormulario(Formulario formulario) {
        this.formulario = formulario;
    }
    
}
