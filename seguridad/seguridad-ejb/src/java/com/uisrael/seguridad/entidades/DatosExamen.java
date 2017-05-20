/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author ricardo
 */
@Entity
@Table(name = "datos_examen", catalog = "seguridad", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"dato_formulario", "examen"})})
@NamedQueries({
    @NamedQuery(name = "DatosExamen.findAll", query = "SELECT d FROM DatosExamen d")})
public class DatosExamen implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected DatosExamenPK datosExamenPK;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @OneToMany(mappedBy = "datosExamen", fetch = FetchType.EAGER)
    private List<DetalleExamen> detalleExamenList;
    @JoinColumn(name = "dato_formulario", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private DatosFormulario datosFormulario;
    @JoinColumn(name = "examen", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    private Examen examen1;
    @JoinColumn(name = "pregunta", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Pregunta pregunta;
    @JoinColumn(name = "respuesta", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Respuesta respuesta;

    public DatosExamen() {
    }

    public DatosExamen(DatosExamenPK datosExamenPK) {
        this.datosExamenPK = datosExamenPK;
    }

    public DatosExamen(int datoFormulario, int examen) {
        this.datosExamenPK = new DatosExamenPK(datoFormulario, examen);
    }

    public DatosExamenPK getDatosExamenPK() {
        return datosExamenPK;
    }

    public void setDatosExamenPK(DatosExamenPK datosExamenPK) {
        this.datosExamenPK = datosExamenPK;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public List<DetalleExamen> getDetalleExamenList() {
        return detalleExamenList;
    }

    public void setDetalleExamenList(List<DetalleExamen> detalleExamenList) {
        this.detalleExamenList = detalleExamenList;
    }

    public DatosFormulario getDatosFormulario() {
        return datosFormulario;
    }

    public void setDatosFormulario(DatosFormulario datosFormulario) {
        this.datosFormulario = datosFormulario;
    }

    public Examen getExamen1() {
        return examen1;
    }

    public void setExamen1(Examen examen1) {
        this.examen1 = examen1;
    }

    public Pregunta getPregunta() {
        return pregunta;
    }

    public void setPregunta(Pregunta pregunta) {
        this.pregunta = pregunta;
    }

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (datosExamenPK != null ? datosExamenPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DatosExamen)) {
            return false;
        }
        DatosExamen other = (DatosExamen) object;
        if ((this.datosExamenPK == null && other.datosExamenPK != null) || (this.datosExamenPK != null && !this.datosExamenPK.equals(other.datosExamenPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.entidades.DatosExamen[ datosExamenPK=" + datosExamenPK + " ]";
    }
    
}
