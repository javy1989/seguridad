/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.bean;

import com.plancurricular.excepciones.ConsultarException;
import com.plancurricular.utilitarios.Pantalla;
import com.uisrael.seguridad.entidades.Ciudad;
import com.uisrael.seguridad.entidades.DatosExamen;
import com.uisrael.seguridad.entidades.Empresa;
import com.uisrael.seguridad.entidades.Examen;
import com.uisrael.seguridad.entidades.Formulario;
import com.uisrael.seguridad.entidades.Pais;
import com.uisrael.seguridad.entidades.Provincia;
import com.uisrael.seguridad.servicios.CiudadFacade;
import com.uisrael.seguridad.servicios.FormularioFacade;
import com.uisrael.seguridad.servicios.PaisFacade;
import com.uisrael.seguridad.servicios.ProvinciaFacade;
import com.uisrael.seguridad.servicios.TipoEmpresaFacade;
import com.uisrael.seguridad.utilidades.Combos;
import com.uisrael.seguridad.utilidades.MostrarMensaje;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author ricardo
 */
@ManagedBean(name = "formulario")
@ViewScoped
public class FormularioBean {

    @EJB
    private FormularioFacade ejbFormulario;
    @EJB
    private TipoEmpresaFacade ejbTipoEmpresa;
    @EJB
    private PaisFacade ejbPais;
    @EJB
    private ProvinciaFacade ejbProvincia;
    @EJB
    private CiudadFacade ejbCiudad;

    private Pantalla pantallaDatos = new Pantalla();
    private Pantalla pantallaPrevio = new Pantalla();
    private Pantalla pantallaConsultoria = new Pantalla();
    private Formulario previo;
    private Formulario consultoria;
    private Examen examen;
    private Empresa empresa;
    private List<DatosExamen> previoList;
    private List<DatosExamen> consultoriaList;

    public FormularioBean() {
    }

    @PostConstruct
    private void init() {
        HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
        if (request.getParameter("form") != null) {
            String codigo = request.getParameter("form");
            consultoria = ejbFormulario.traerFormulario(codigo);
            if (consultoria != null) {
                empresa = new Empresa();
                empresa.setCiudad(new Ciudad());
                pantallaDatos.insertar();
            } else {
                MostrarMensaje.fatal("Informacion", "Codigo de Formulario invalido");
            }
        }
    }

    public void change(int tipo) throws ConsultarException {
        switch (tipo) {
            case 0:
                getProvinciaItem();
                break;
            case 1:
                getCiudadItem();
                break;
        }
    }

    public SelectItem[] getTipoEmpresaItem() throws ConsultarException {
        Map parametros = new HashMap();
        parametros.put(";where", "o.estado=true");
        return Combos.getSelectItems(ejbTipoEmpresa.encontarParametros(parametros), true);
    }

    public SelectItem[] getPaisItem() throws ConsultarException {
        Map parametros = new HashMap();
        parametros.put(";where", "o.estado=true");
        return Combos.getSelectItems(ejbPais.encontarParametros(parametros), true);
    }

    public SelectItem[] getProvinciaItem() throws ConsultarException {
        if (empresa.getCiudad() != null) {
            if (empresa.getCiudad().getPais() != null) {
                Map parametros = new HashMap();
                parametros.put(";where", "o.estado=true and o.pais= :pais");
                parametros.put("pais", empresa.getCiudad().getPais());
                return Combos.getSelectItems(ejbProvincia.encontarParametros(parametros), true);
            }
        }
        return null;
    }

    public Pais traerPais(int id) throws ConsultarException {
        return ejbPais.find(id);
    }

    public Provincia traerProvincia(int id) throws ConsultarException {
        return ejbProvincia.find(id);
    }

    public Ciudad traerCiudad(int id) throws ConsultarException {
        return ejbCiudad.find(id);
    }

    public SelectItem[] getCiudadItem() throws ConsultarException {
        if (empresa.getCiudad() != null) {
            if (empresa.getCiudad().getProvincia() != null) {
                Map parametros = new HashMap();
                parametros.put(";where", "o.estado=true and o.provincia= :provincia");
                parametros.put("provincia", empresa.getCiudad().getProvincia());
                return Combos.getSelectItems(ejbCiudad.encontarParametros(parametros), true);
            }
        }
        return null;
    }

    public Formulario getPrevio() {
        return previo;
    }

    public void setPrevio(Formulario previo) {
        this.previo = previo;
    }

    public Formulario getConsultoria() {
        return consultoria;
    }

    public void setConsultoria(Formulario consultoria) {
        this.consultoria = consultoria;
    }

    public Examen getExamen() {
        return examen;
    }

    public void setExamen(Examen examen) {
        this.examen = examen;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

    public List<DatosExamen> getPrevioList() {
        return previoList;
    }

    public void setPrevioList(List<DatosExamen> previoList) {
        this.previoList = previoList;
    }

    public List<DatosExamen> getConsultoriaList() {
        return consultoriaList;
    }

    public void setConsultoriaList(List<DatosExamen> consultoriaList) {
        this.consultoriaList = consultoriaList;
    }

    public Pantalla getPantallaDatos() {
        return pantallaDatos;
    }

    public void setPantallaDatos(Pantalla pantallaDatos) {
        this.pantallaDatos = pantallaDatos;
    }

    public Pantalla getPantallaPrevio() {
        return pantallaPrevio;
    }

    public void setPantallaPrevio(Pantalla pantallaPrevio) {
        this.pantallaPrevio = pantallaPrevio;
    }

    public Pantalla getPantallaConsultoria() {
        return pantallaConsultoria;
    }

    public void setPantallaConsultoria(Pantalla pantallaConsultoria) {
        this.pantallaConsultoria = pantallaConsultoria;
    }

}
