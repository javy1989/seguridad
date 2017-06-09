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
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author desarrollo
 */
@Entity
@Table(name = "formulario_apartado", catalog = "seguridad", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
@NamedQueries({
    @NamedQuery(name = "FormularioApartado.findAll", query = "SELECT f FROM FormularioApartado f")})
public class FormularioApartado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    private Integer orden;
    private Boolean estado;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(name = "valor_apartado", precision = 5, scale = 2)
    private BigDecimal valorApartado;
    @OrderBy("apartado asc")
    @OneToMany(mappedBy = "apartado", fetch = FetchType.EAGER)
    private List<ApartadoPregunta> apartadoPreguntaList;
    @OneToMany(mappedBy = "formularioApartado", fetch = FetchType.EAGER)
    private List<DetalleExamen> detalleExamenList;
    @JoinColumn(name = "apartado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Apartado apartado;
    @JoinColumn(name = "formulario", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.EAGER)
    private Formulario formulario;

    public FormularioApartado() {
    }

    public FormularioApartado(Integer id) {
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

    public BigDecimal getValorApartado() {
        return valorApartado;
    }

    public void setValorApartado(BigDecimal valorApartado) {
        this.valorApartado = valorApartado;
    }

    public List<ApartadoPregunta> getApartadoPreguntaList() {
        return apartadoPreguntaList;
    }

    public void setApartadoPreguntaList(List<ApartadoPregunta> apartadoPreguntaList) {
        this.apartadoPreguntaList = apartadoPreguntaList;
    }

    public List<DetalleExamen> getDetalleExamenList() {
        return detalleExamenList;
    }

    public void setDetalleExamenList(List<DetalleExamen> detalleExamenList) {
        this.detalleExamenList = detalleExamenList;
    }

    public Apartado getApartado() {
        return apartado;
    }

    public void setApartado(Apartado apartado) {
        this.apartado = apartado;
    }

    public Formulario getFormulario() {
        return formulario;
    }

    public void setFormulario(Formulario formulario) {
        this.formulario = formulario;
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
        if (!(object instanceof FormularioApartado)) {
            return false;
        }
        FormularioApartado other = (FormularioApartado) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.entidades.FormularioApartado[ id=" + id + " ]";
    }
    
}
