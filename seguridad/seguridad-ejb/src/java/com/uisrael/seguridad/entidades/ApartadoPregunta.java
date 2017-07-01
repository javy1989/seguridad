/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author ricardo
 */
@Entity
@Table(name = "apartado_pregunta", catalog = "seguridad", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
@NamedQueries({
    @NamedQuery(name = "ApartadoPregunta.findAll", query = "SELECT a FROM ApartadoPregunta a")})
public class ApartadoPregunta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    private Integer orden;
    private Boolean estado;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "valor_pregunta", precision = 5, scale = 2)
    private BigDecimal valorPregunta;
    @JoinColumn(name = "apartado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private FormularioApartado apartado;
    @JoinColumn(name = "pregunta", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Pregunta pregunta;
    @JoinColumn(name = "respuesta", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Respuesta respuesta;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "apartadoPregunta", fetch = FetchType.LAZY)
    private List<DatosExamen> datosExamenList;

    public ApartadoPregunta() {
    }

    public ApartadoPregunta(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public BigDecimal getValorPregunta() {
        return valorPregunta;
    }

    public void setValorPregunta(BigDecimal valorPregunta) {
        this.valorPregunta = valorPregunta;
    }

    public FormularioApartado getApartado() {
        return apartado;
    }

    public void setApartado(FormularioApartado apartado) {
        this.apartado = apartado;
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

    public List<DatosExamen> getDatosExamenList() {
        return datosExamenList;
    }

    public void setDatosExamenList(List<DatosExamen> datosExamenList) {
        this.datosExamenList = datosExamenList;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ApartadoPregunta)) {
            return false;
        }
        ApartadoPregunta other = (ApartadoPregunta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.entidades.ApartadoPregunta[ id=" + id + " ]";
    }
    
}
