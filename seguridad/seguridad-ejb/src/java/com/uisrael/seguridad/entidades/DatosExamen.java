/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author desarrollo
 */
@Entity
@Table(name = "datos_examen", catalog = "seguridad", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"apartado_pregunta", "examen"})})
@NamedQueries({
    @NamedQuery(name = "DatosExamen.findAll", query = "SELECT d FROM DatosExamen d")})
public class DatosExamen implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected DatosExamenPK datosExamenPK;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @JoinColumn(name = "apartado_pregunta", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private ApartadoPregunta apartadoPregunta;
    @JoinColumn(name = "examen", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Examen examen;
    @JoinColumn(name = "respuesta", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Respuesta respuesta;

    public DatosExamen() {
    }

    public DatosExamen(DatosExamenPK datosExamenPK) {
        this.datosExamenPK = datosExamenPK;
    }

    public DatosExamen(int apartadoPregunta, int examen) {
        this.datosExamenPK = new DatosExamenPK(apartadoPregunta, examen);
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

    public ApartadoPregunta getApartadoPregunta() {
        return apartadoPregunta;
    }

    public void setApartadoPregunta(ApartadoPregunta apartadoPregunta) {
        this.apartadoPregunta = apartadoPregunta;
    }

    public Examen getExamen() {
        return examen;
    }

    public void setExamen(Examen examen) {
        this.examen = examen;
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
