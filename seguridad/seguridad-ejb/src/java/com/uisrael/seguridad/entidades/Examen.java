/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Size;

/**
 *
 * @author Ricardo.Bravo
 */
@Entity
@Table(catalog = "seguridad", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
@NamedQueries({
    @NamedQuery(name = "Examen.findAll", query = "SELECT e FROM Examen e")})
public class Examen implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    private Boolean estado;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String codigo;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(precision = 5, scale = 2)
    private BigDecimal total;
    @JoinColumn(name = "empresa", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Empresa empresa;
    @JoinColumn(name = "formulario", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Formulario formulario;
    @OneToMany(mappedBy = "examen", fetch = FetchType.LAZY)
    private List<RecomendacionExamen> recomendacionExamenList;
    @OneToMany(mappedBy = "examen", fetch = FetchType.LAZY)
    private List<DetalleExamen> detalleExamenList;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "examen1", fetch = FetchType.LAZY)
    private List<DatosExamen> datosExamenList;

    public Examen() {
    }

    public Examen(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public BigDecimal getTotal() {
        return total;
    }

    public void setTotal(BigDecimal total) {
        this.total = total;
    }

    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }

    public Formulario getFormulario() {
        return formulario;
    }

    public void setFormulario(Formulario formulario) {
        this.formulario = formulario;
    }

    public List<RecomendacionExamen> getRecomendacionExamenList() {
        return recomendacionExamenList;
    }

    public void setRecomendacionExamenList(List<RecomendacionExamen> recomendacionExamenList) {
        this.recomendacionExamenList = recomendacionExamenList;
    }

    public List<DetalleExamen> getDetalleExamenList() {
        return detalleExamenList;
    }

    public void setDetalleExamenList(List<DetalleExamen> detalleExamenList) {
        this.detalleExamenList = detalleExamenList;
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
        if (!(object instanceof Examen)) {
            return false;
        }
        Examen other = (Examen) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.entidades.Examen[ id=" + id + " ]";
    }
    
}
