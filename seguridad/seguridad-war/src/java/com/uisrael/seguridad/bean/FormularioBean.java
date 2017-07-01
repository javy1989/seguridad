/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.bean;

import com.plancurricular.excepciones.ConsultarException;
import com.plancurricular.excepciones.GrabarException;
import com.plancurricular.excepciones.InsertarException;
import com.plancurricular.utilitarios.Pantalla;
import com.uisrael.seguridad.entidades.Actividad;
import com.uisrael.seguridad.entidades.ApartadoPregunta;
import com.uisrael.seguridad.entidades.Ciudad;
import com.uisrael.seguridad.entidades.DatosExamen;
import com.uisrael.seguridad.entidades.DatosExamenPK;
import com.uisrael.seguridad.entidades.DetalleExamen;
import com.uisrael.seguridad.entidades.Empresa;
import com.uisrael.seguridad.entidades.Examen;
import com.uisrael.seguridad.entidades.Formulario;
import com.uisrael.seguridad.entidades.FormularioApartado;
import com.uisrael.seguridad.entidades.Pais;
import com.uisrael.seguridad.entidades.Provincia;
import com.uisrael.seguridad.entidades.Respuesta;
import com.uisrael.seguridad.entidades.Sector;
import com.uisrael.seguridad.entidades.SectorActividad;
import com.uisrael.seguridad.entidades.Tamanio;
import com.uisrael.seguridad.entidades.Tipo;
import com.uisrael.seguridad.entidades.TipoSector;
import com.uisrael.seguridad.servicios.ActividadFacade;
import com.uisrael.seguridad.servicios.CiudadFacade;
import com.uisrael.seguridad.servicios.CorreoFacade;
import com.uisrael.seguridad.servicios.DatosExamenFacade;
import com.uisrael.seguridad.servicios.DetalleExamenFacade;
import com.uisrael.seguridad.servicios.EmpresaFacade;
import com.uisrael.seguridad.servicios.ExamenFacade;
import com.uisrael.seguridad.servicios.FormularioFacade;
import com.uisrael.seguridad.servicios.PaisFacade;
import com.uisrael.seguridad.servicios.ProvinciaFacade;
import com.uisrael.seguridad.servicios.RespuestaFacade;
import com.uisrael.seguridad.servicios.SectorActividadFacade;
import com.uisrael.seguridad.servicios.SectorFacade;
import com.uisrael.seguridad.servicios.TamanioFacade;
import com.uisrael.seguridad.servicios.TipoFacade;
import com.uisrael.seguridad.servicios.TipoSectorFacade;
import com.uisrael.seguridad.utilidades.Combos;
import com.uisrael.seguridad.utilidades.General;
import com.uisrael.seguridad.utilidades.MostrarMensaje;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.net.URL;
import java.util.Calendar;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ViewScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.mail.MessagingException;
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
    private ActividadFacade ejbActividad;
    @EJB
    private PaisFacade ejbPais;
    @EJB
    private ProvinciaFacade ejbProvincia;
    @EJB
    private CiudadFacade ejbCiudad;
    @EJB
    private RespuestaFacade ejbRespuesta;
    @EJB
    private EmpresaFacade ejbEmpresa;
    @EJB
    private ExamenFacade ejbExamen;
    @EJB
    private DatosExamenFacade ejbDatosExamen;
    @EJB
    private DetalleExamenFacade ejbDetalleExamen;
    @EJB
    private TipoFacade ejbTipo;
    @EJB
    private CorreoFacade ejbCorreo;
    @EJB
    private TamanioFacade ejbTamanio;
    @EJB
    private TipoSectorFacade ejbTipoSector;
    @EJB
    private SectorFacade ejbSector;
    @EJB
    private SectorActividadFacade ejbSectorActividad;

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
    private List<DetalleExamen> detalleExamen;

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
                empresa.setActividad(new SectorActividad());
                empresa.getActividad().setSector(new TipoSector());
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

    public SelectItem[] getTamanioItem() throws ConsultarException {
        Map parametros = new HashMap();
        parametros.put(";where", "o.estado=true");
        return Combos.getSelectItems(ejbTamanio.encontarParametros(parametros), true);
    }

    public SelectItem[] getTipoItem() throws ConsultarException {
        Map parametros = new HashMap();
        parametros.put(";where", "o.padre=true");
        return Combos.getSelectItems(ejbTipo.encontarParametros(parametros), true);
    }

    public SelectItem[] getSectorItem() throws ConsultarException {
        if (empresa.getActividad().getSector().getTipo() == null) {
            return null;
        }
        Map parametros = new HashMap();
        parametros.put(";where", "o.tipo= :tipo");
        parametros.put("tipo", empresa.getActividad().getSector().getTipo());
        parametros.put(";orden", "o.orden");
        return Combos.getSelectItems(ejbTipoSector.encontarParametros(parametros), true);
    }

    public SelectItem[] getActividadItem() throws ConsultarException {
        if (empresa.getActividad().getSector() == null) {
            return null;
        }
        Map parametros = new HashMap();
        parametros.put(";where", "o.sector= :sector");
        parametros.put("sector", empresa.getActividad().getSector());
        parametros.put(";orden", "o.orden");
        return Combos.getSelectItems(ejbSectorActividad.encontarParametros(parametros), true);
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

    public Pais traerPais(int id) throws ConsultarException {
        return ejbPais.find(id);
    }

    public Provincia traerProvincia(int id) throws ConsultarException {
        return ejbProvincia.find(id);
    }

    public Ciudad traerCiudad(int id) throws ConsultarException {
        return ejbCiudad.find(id);
    }

    public Actividad traerActividad(int id) throws ConsultarException {
        return ejbActividad.find(id);
    }

    public Respuesta traeRespuesta(int id) throws ConsultarException {
        return ejbRespuesta.find(id);
    }

    public Tipo traeTipo(int id) throws ConsultarException {
        return ejbTipo.find(id);
    }

    public Tamanio traeTamanio(int id) throws ConsultarException {
        return ejbTamanio.find(id);
    }

    public TipoSector traeTipoSector(int id) throws ConsultarException {
        return ejbTipoSector.find(id);
    }

    public SectorActividad traeSectorActividad(int id) throws ConsultarException {
        return ejbSectorActividad.find(id);
    }

    public Sector traeSector(int id) throws ConsultarException {
        return ejbSector.find(id);
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

        }

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

    public String guardar() {
        try {
            ejbEmpresa.create(empresa, null);
            guardaExamenPrevio();
            guardaDatosExamenPrevio();
            guardaConsultoria();
            guardaDetalleExamen();
            URL url = this.getClass().getResource("/com/uisrael/seguridad/doc/nuevo-examen.html");
            File file = new File(url.getPath());
            String html = ejbCorreo.htmlContentEmail(file).replace("$CODIGO", examenConsultoria.getCodigo());
            ejbCorreo.enviarCorreo(empresa.getMail(), "Consultoria", html);
            FacesContext.getCurrentInstance().getExternalContext().redirect("/seguridad-war/");
        } catch (InsertarException | GrabarException | MessagingException | UnsupportedEncodingException ex) {
            Logger.getLogger(FormularioBean.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(FormularioBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private void guardaExamenPrevio() throws InsertarException {
        examenPrevio.setEmpresa(empresa);
        examenPrevio.setEstado(true);
        examenPrevio.setFecha(Calendar.getInstance().getTime());
        examenPrevio.setFormulario(consultoria.getAnterior());
        examenPrevio.setTotal(BigDecimal.ZERO);
        examenPrevio.setCodigo(generaCodigo(consultoria.getAnterior()));
        ejbExamen.create(examenPrevio, null);
    }

    private void guardaDatosExamenPrevio() throws InsertarException {
        for (DatosExamen dato : previoRespuestaList) {
            dato.getDatosExamenPK().setApartadoPregunta(dato.getApartadoPregunta().getId());
            dato.getDatosExamenPK().setExamen(examenPrevio.getId());
            dato.setApartadoPregunta(dato.getApartadoPregunta());
            dato.setExamen(examenPrevio);
            dato.setFecha(Calendar.getInstance().getTime());
            ejbDatosExamen.create(dato, null);
        }
    }

    private void guardaConsultoria() throws InsertarException, GrabarException {
        examenConsultoria.setEmpresa(empresa);
        examenConsultoria.setEstado(true);
        examenConsultoria.setFecha(Calendar.getInstance().getTime());
        examenConsultoria.setFormulario(consultoria);
        examenConsultoria.setCodigo(generaCodigo(consultoria));
        ejbExamen.create(examenConsultoria, null);
        BigDecimal total = BigDecimal.valueOf(procesaConsultoriaTotal());
        int numeroApartados = examenConsultoria.getFormulario().getFormularioApartadoList().size();
        System.out.println("numero de apartados" + numeroApartados);
        total = total.divide(new BigDecimal(numeroApartados));
        total.setScale(0, RoundingMode.DOWN);
        examenConsultoria.setTotal(total);
        ejbExamen.edit(examenConsultoria, null);

    }

    private String generaCodigo(Formulario formulario) {
        return General.documento(formulario.getId());
    }

    private double procesaConsultoriaTotal() throws InsertarException {
        double total_respuesta = 0;

        double total = 0;
        FormularioApartado apartadoActual;
        FormularioApartado apartadoAnterior = null;
        detalleExamen = new LinkedList<>();
        DetalleExamen detalle;
        for (DatosExamen dato : consultoriaRespuestaList) {
            System.out.println("apartado-->" + dato.getApartadoPregunta().getApartado().getId());
            apartadoActual = dato.getApartadoPregunta().getApartado();
            if (apartadoAnterior == null) {
                total_respuesta += dato.getRespuesta().getValor().doubleValue();
            } else {
                if (apartadoActual.equals(apartadoAnterior)) {
                    total_respuesta += dato.getRespuesta().getValor().doubleValue();
                } else {
                    System.out.println("verficando con " + apartadoAnterior.getApartado().getId());
                    System.out.println("sumando apartados total-->" + total_respuesta);
                    detalle = new DetalleExamen();
                    detalle.setExamen(examenConsultoria);
                    detalle.setFormularioApartado(apartadoAnterior);
                    detalle.setValor(valorApartado(total_respuesta, apartadoAnterior.getApartadoPreguntaList().size()));
                    detalleExamen.add(detalle);
                    total += detalle.getValor().doubleValue();
                    total_respuesta = 0;
                    total_respuesta += dato.getRespuesta().getValor().doubleValue();
                }
            }

            apartadoAnterior = apartadoActual;
            dato.getDatosExamenPK().setApartadoPregunta(dato.getApartadoPregunta().getId());
            dato.getDatosExamenPK().setExamen(examenConsultoria.getId());
            dato.setApartadoPregunta(dato.getApartadoPregunta());
            ejbDatosExamen.create(dato, null);
        }

        if (apartadoAnterior != null) {
            System.out.println("sumando ultimo valor de apartado" + apartadoAnterior.getApartado().getId());
            detalle = new DetalleExamen();
            detalle.setExamen(examenConsultoria);
            detalle.setFormularioApartado(apartadoAnterior);
            detalle.setValor(valorApartado(total_respuesta, apartadoAnterior.getApartadoPreguntaList().size()));
            detalleExamen.add(detalle);
            total += detalle.getValor().doubleValue();
        }

        return total;
    }

    private BigDecimal valorApartado(double total_respuesta, int size) {
        System.out.println("sacando porcentaje total respuesta-->" + total_respuesta + "size" + size);
        double total_apartado;
        total_apartado = total_respuesta;
        total_apartado = ((total_apartado * 100) / size);
        BigDecimal valor = BigDecimal.valueOf(total_apartado);
        valor.setScale(0, RoundingMode.DOWN);
        return valor;
    }

    private void guardaDetalleExamen() throws InsertarException {
        for (DetalleExamen detalle : detalleExamen) {
            ejbDetalleExamen.create(detalle, null);

        }
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
