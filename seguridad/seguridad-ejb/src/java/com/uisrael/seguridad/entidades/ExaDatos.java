/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
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
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ricardo
 */
@Entity
@Table(name = "exa_datos", catalog = "seguridad", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ExaDatos.findAll", query = "SELECT e FROM ExaDatos e")
    , @NamedQuery(name = "ExaDatos.findByExamen", query = "SELECT e FROM ExaDatos e WHERE e.exaDatosPK.examen = :examen")
    , @NamedQuery(name = "ExaDatos.findByPregunta", query = "SELECT e FROM ExaDatos e WHERE e.exaDatosPK.pregunta = :pregunta")
    , @NamedQuery(name = "ExaDatos.findByFecha", query = "SELECT e FROM ExaDatos e WHERE e.fecha = :fecha")})
public class ExaDatos implements Serializable {

    private static final long serialVersionUID = 1L;
    @EmbeddedId
    protected ExaDatosPK exaDatosPK;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "exaDatos", fetch = FetchType.LAZY)
    private List<ExaResultado> exaResultadoList;
    @JoinColumn(name = "pregunta", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private DatosFormulario datosFormulario;
    @JoinColumn(name = "examen", referencedColumnName = "id", nullable = false, insertable = false, updatable = false)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private Examen examen1;
    @JoinColumn(name = "respuesta", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Respuesta respuesta;

    public ExaDatos() {
    }

    public ExaDatos(ExaDatosPK exaDatosPK) {
        this.exaDatosPK = exaDatosPK;
    }

    public ExaDatos(int examen, int pregunta) {
        this.exaDatosPK = new ExaDatosPK(examen, pregunta);
    }

    public ExaDatosPK getExaDatosPK() {
        return exaDatosPK;
    }

    public void setExaDatosPK(ExaDatosPK exaDatosPK) {
        this.exaDatosPK = exaDatosPK;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    @XmlTransient
    public List<ExaResultado> getExaResultadoList() {
        return exaResultadoList;
    }

    public void setExaResultadoList(List<ExaResultado> exaResultadoList) {
        this.exaResultadoList = exaResultadoList;
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

    public Respuesta getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(Respuesta respuesta) {
        this.respuesta = respuesta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (exaDatosPK != null ? exaDatosPK.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExaDatos)) {
            return false;
        }
        ExaDatos other = (ExaDatos) object;
        if ((this.exaDatosPK == null && other.exaDatosPK != null) || (this.exaDatosPK != null && !this.exaDatosPK.equals(other.exaDatosPK))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.model.ExaDatos[ exaDatosPK=" + exaDatosPK + " ]";
    }
    
}
