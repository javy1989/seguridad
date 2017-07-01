/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.math.BigDecimal;
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
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 *
 * @author ricardo
 */
@Entity
@Table(name = "detalle_examen", catalog = "seguridad", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
@NamedQueries({
    @NamedQuery(name = "DetalleExamen.findAll", query = "SELECT d FROM DetalleExamen d")})
public class DetalleExamen implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(precision = 5, scale = 2)
    private BigDecimal valor;
    @JoinColumn(name = "examen", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Examen examen;
    @JoinColumn(name = "formulario_apartado", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private FormularioApartado formularioApartado;

    public DetalleExamen() {
    }

    public DetalleExamen(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public Examen getExamen() {
        return examen;
    }

    public void setExamen(Examen examen) {
        this.examen = examen;
    }

    public FormularioApartado getFormularioApartado() {
        return formularioApartado;
    }

    public void setFormularioApartado(FormularioApartado formularioApartado) {
        this.formularioApartado = formularioApartado;
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
        if (!(object instanceof DetalleExamen)) {
            return false;
        }
        DetalleExamen other = (DetalleExamen) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.entidades.DetalleExamen[ id=" + id + " ]";
    }
    
}
