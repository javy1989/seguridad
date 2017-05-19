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
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author ricardo
 */
@Entity
@Table(name = "exa_resultado", catalog = "seguridad", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ExaResultado.findAll", query = "SELECT e FROM ExaResultado e")
    , @NamedQuery(name = "ExaResultado.findByExamen", query = "SELECT e FROM ExaResultado e WHERE e.examen = :examen")
    , @NamedQuery(name = "ExaResultado.findByValor", query = "SELECT e FROM ExaResultado e WHERE e.valor = :valor")})
public class ExaResultado implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private Integer examen;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(precision = 6, scale = 2)
    private BigDecimal valor;
    @JoinColumns({
        @JoinColumn(name = "examen", referencedColumnName = "examen", nullable = false, insertable = false, updatable = false)
        , @JoinColumn(name = "apartado", referencedColumnName = "pregunta", nullable = false)})
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    private ExaDatos exaDatos;

    public ExaResultado() {
    }

    public ExaResultado(Integer examen) {
        this.examen = examen;
    }

    public Integer getExamen() {
        return examen;
    }

    public void setExamen(Integer examen) {
        this.examen = examen;
    }

    public BigDecimal getValor() {
        return valor;
    }

    public void setValor(BigDecimal valor) {
        this.valor = valor;
    }

    public ExaDatos getExaDatos() {
        return exaDatos;
    }

    public void setExaDatos(ExaDatos exaDatos) {
        this.exaDatos = exaDatos;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (examen != null ? examen.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExaResultado)) {
            return false;
        }
        ExaResultado other = (ExaResultado) object;
        if ((this.examen == null && other.examen != null) || (this.examen != null && !this.examen.equals(other.examen))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.model.ExaResultado[ examen=" + examen + " ]";
    }
    
}
