/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.bean;

import com.plancurricular.excepciones.ConsultarException;
import com.plancurricular.utilitarios.Pantalla;
import com.uisrael.seguridad.entidades.Apartado;
import com.uisrael.seguridad.entidades.ApartadoPregunta;
import com.uisrael.seguridad.entidades.Ciudad;
import com.uisrael.seguridad.entidades.DatosExamen;
import com.uisrael.seguridad.entidades.DatosExamenPK;
import com.uisrael.seguridad.entidades.Empresa;
import com.uisrael.seguridad.entidades.Examen;
import com.uisrael.seguridad.entidades.Formulario;
import com.uisrael.seguridad.entidades.FormularioApartado;
import com.uisrael.seguridad.entidades.Pais;
import com.uisrael.seguridad.entidades.Provincia;
import com.uisrael.seguridad.entidades.Respuesta;
import com.uisrael.seguridad.entidades.TipoEmpresa;
import com.uisrael.seguridad.servicios.CiudadFacade;
import com.uisrael.seguridad.servicios.FormularioFacade;
import com.uisrael.seguridad.servicios.PaisFacade;
import com.uisrael.seguridad.servicios.ProvinciaFacade;
import com.uisrael.seguridad.servicios.RespuestaFacade;
import com.uisrael.seguridad.servicios.TipoEmpresaFacade;
import com.uisrael.seguridad.utilidades.Combos;
import com.uisrael.seguridad.utilidades.MostrarMensaje;
import java.util.HashMap;
import java.util.LinkedList;
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
    @EJB
    private RespuestaFacade ejbRespuesta;

    private Pantalla pantallaDatos = new Pantalla();
    private Pantalla pantallaPrevio = new Pantalla();
    private Pantalla pantallaConsultoria = new Pantalla();
    private Formulario previo;
    private Formulario consultoria;
    private Examen examenPrevio;
    private Examen examenConsultoria;
    private Empresa empresa;
    private List<DatosExamen> previoRespuestaList;
    private List<DatosExamen> consultoriaRespuestaList;
    private List<FormularioApartado> previoList;
    private List<FormularioApartado> consultoriaList;
    private Apartado apartadoActua;

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

    public TipoEmpresa traerTipoEmpresa(int id) throws ConsultarException {
        return ejbTipoEmpresa.find(id);
    }

    public Respuesta traeRespuesta(int id) throws ConsultarException {
        return ejbRespuesta.find(id);
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

    public String continuarPrevio() throws ConsultarException {

        if (empresa.getCiudad() == null) {
            MostrarMensaje.error("Informacion", "Se debe seleccinar la ciudad");
        }
        previo = ejbFormulario.find(consultoria.getAnterior().getId());
        previoList = previo.getFormularioApartadoList();
        if (previoList == null) {
            MostrarMensaje.error("Informacion", "No existe configuracion asignada");
        }
        examenPrevio = new Examen();
        examenPrevio.setEmpresa(empresa);
        previoRespuestaList = new LinkedList<>();
        for (FormularioApartado apartado : previoList) {
            for (ApartadoPregunta pregunta : apartado.getApartadoPreguntaList()) {
                DatosExamen dexamen = new DatosExamen();
                DatosExamenPK pk = new DatosExamenPK();
                pk.setApartadoPregunta(pregunta.getId());
                dexamen.setApartadoPregunta(pregunta);
                dexamen.setDatosExamenPK(pk);
                dexamen.setExamen(examenPrevio);
                Respuesta res = new Respuesta();
                dexamen.setRespuesta(res);
                previoRespuestaList.add(dexamen);
            }

        }/*
         previoList.forEach((apartado) -> {
         apartado.getApartadoPreguntaList().forEach((pregunta) -> {
         DatosExamen dexamen = new DatosExamen();
         DatosExamenPK pk = new DatosExamenPK();
         pk.setApartadoPregunta(pregunta.getId());
         dexamen.setApartadoPregunta(pregunta);
         dexamen.setDatosExamenPK(pk);
         dexamen.setExamen(examenPrevio);
         Respuesta res = new Respuesta();
         dexamen.setRespuesta(res);
         previoRespuestaList.add(dexamen);
         });
         });*/

        irPantalla(0);
        return null;
    }

    public String continuarConsultoria() {
        if (consultoria == null) {
            return null;
        }
        examenConsultoria = new Examen();
        examenConsultoria.setEmpresa(empresa);
        consultoriaRespuestaList = new LinkedList<>();
        consultoriaList = consultoria.getFormularioApartadoList();
        for (FormularioApartado apartado : consultoriaList) {
            for (ApartadoPregunta pregunta : apartado.getApartadoPreguntaList()) {
                DatosExamen dexamen = new DatosExamen();
                DatosExamenPK pk = new DatosExamenPK();
                pk.setApartadoPregunta(pregunta.getId());
                dexamen.setApartadoPregunta(pregunta);
                dexamen.setDatosExamenPK(pk);
                dexamen.setExamen(examenConsultoria);
                Respuesta res = new Respuesta();
                dexamen.setRespuesta(res);
                consultoriaRespuestaList.add(dexamen);
            }

        }
        /*
         consultoriaList.forEach((apartado) -> {
         apartado.getApartadoPreguntaList().forEach((pregunta) -> {
         DatosExamen dexamen = new DatosExamen();
         DatosExamenPK pk = new DatosExamenPK();
         pk.setApartadoPregunta(pregunta.getId());
         dexamen.setApartadoPregunta(pregunta);
         dexamen.setDatosExamenPK(pk);
         dexamen.setExamen(examenConsultoria);
         Respuesta res = new Respuesta();
         dexamen.setRespuesta(res);
         consultoriaRespuestaList.add(dexamen);
         });
         });
         */
        irPantalla(1);

        return null;
    }

    public void irPantalla(int tipo) {
        switch (tipo) {
            case 0:
                pantallaDatos.cancelar();
                pantallaPrevio.insertar();
                break;
            case 1:
                pantallaPrevio.cancelar();
                pantallaConsultoria.insertar();
                break;
        }
    }

    /**
     * 0 continua a previo formulario 1 continua a consultoria
     *
     * @param opcion
     */
    public void continua(int opcion) {
        switch (opcion) {
            case 0:
                previo = ejbFormulario.traerFormulario("PR3V10");

                pantallaDatos.cancelar();
                pantallaPrevio.insertar();
                break;
            case 1:
                pantallaPrevio.cancelar();
                pantallaConsultoria.insertar();
                break;
        }
    }

    private void traeDatoFormularioPrevio() {
        Map parametros = new HashMap();
        parametros.put(";where", "o.formulario");
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

    public Examen getExamenPrevio() {
        return examenPrevio;
    }

    public void setExamenPrevio(Examen examenPrevio) {
        this.examenPrevio = examenPrevio;
    }

    public Examen getExamenConsultoria() {
        return examenConsultoria;
    }

    public void setExamenConsultoria(Examen examenConsultoria) {
        this.examenConsultoria = examenConsultoria;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

    public List<DatosExamen> getPrevioRespuestaList() {
        return previoRespuestaList;
    }

    public void setPrevioRespuestaList(List<DatosExamen> previoRespuestaList) {
        this.previoRespuestaList = previoRespuestaList;
    }

    public List<DatosExamen> getConsultoriaRespuestaList() {
        return consultoriaRespuestaList;
    }

    public void setConsultoriaRespuestaList(List<DatosExamen> consultoriaRespuestaList) {
        this.consultoriaRespuestaList = consultoriaRespuestaList;
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
