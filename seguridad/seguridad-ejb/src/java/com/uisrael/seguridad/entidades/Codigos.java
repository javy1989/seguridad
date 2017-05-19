/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.math.BigInteger;
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
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author ricardo
 */
@Entity
@Table(catalog = "seguridad", schema = "public")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Codigos.findAll", query = "SELECT c FROM Codigos c")
    , @NamedQuery(name = "Codigos.findById", query = "SELECT c FROM Codigos c WHERE c.id = :id")
    , @NamedQuery(name = "Codigos.findByNombre", query = "SELECT c FROM Codigos c WHERE c.nombre = :nombre")
    , @NamedQuery(name = "Codigos.findByCodigo", query = "SELECT c FROM Codigos c WHERE c.codigo = :codigo")
    , @NamedQuery(name = "Codigos.findByEstado", query = "SELECT c FROM Codigos c WHERE c.estado = :estado")
    , @NamedQuery(name = "Codigos.findByDescripcion", query = "SELECT c FROM Codigos c WHERE c.descripcion = :descripcion")
    , @NamedQuery(name = "Codigos.findByValor", query = "SELECT c FROM Codigos c WHERE c.valor = :valor")})
public class Codigos implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String nombre;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String codigo;
    private Boolean estado;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String descripcion;
    private BigInteger valor;
    @OneToMany(mappedBy = "tipo", fetch = FetchType.LAZY)
    private List<DatosFormulario> datosFormularioList;
    @JoinColumn(name = "maestro", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Maestro maestro;

    public Codigos() {
    }

    public Codigos(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public BigInteger getValor() {
        return valor;
    }

    public void setValor(BigInteger valor) {
        this.valor = valor;
    }

    @XmlTransient
    public List<DatosFormulario> getDatosFormularioList() {
        return datosFormularioList;
    }

    public void setDatosFormularioList(List<DatosFormulario> datosFormularioList) {
        this.datosFormularioList = datosFormularioList;
    }

    public Maestro getMaestro() {
        return maestro;
    }

    public void setMaestro(Maestro maestro) {
        this.maestro = maestro;
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
        if (!(object instanceof Codigos)) {
            return false;
        }
        Codigos other = (Codigos) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.model.Codigos[ id=" + id + " ]";
    }
    
}
