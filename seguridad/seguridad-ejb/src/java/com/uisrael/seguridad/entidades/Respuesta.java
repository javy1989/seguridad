/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
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
    @NamedQuery(name = "Respuesta.findAll", query = "SELECT r FROM Respuesta r")
    , @NamedQuery(name = "Respuesta.findById", query = "SELECT r FROM Respuesta r WHERE r.id = :id")
    , @NamedQuery(name = "Respuesta.findByDescripcion", query = "SELECT r FROM Respuesta r WHERE r.descripcion = :descripcion")
    , @NamedQuery(name = "Respuesta.findByEstado", query = "SELECT r FROM Respuesta r WHERE r.estado = :estado")})
public class Respuesta implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String descripcion;
    private Boolean estado;
    @OneToMany(mappedBy = "respuesta", fetch = FetchType.LAZY)
    private List<DatosFormulario> datosFormularioList;
    @OneToMany(mappedBy = "respuesta", fetch = FetchType.LAZY)
    private List<ExaDatos> exaDatosList;

    public Respuesta() {
    }

    public Respuesta(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Boolean getEstado() {
        return estado;
    }

    public void setEstado(Boolean estado) {
        this.estado = estado;
    }

    @XmlTransient
    public List<DatosFormulario> getDatosFormularioList() {
        return datosFormularioList;
    }

    public void setDatosFormularioList(List<DatosFormulario> datosFormularioList) {
        this.datosFormularioList = datosFormularioList;
    }

    @XmlTransient
    public List<ExaDatos> getExaDatosList() {
        return exaDatosList;
    }

    public void setExaDatosList(List<ExaDatos> exaDatosList) {
        this.exaDatosList = exaDatosList;
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
        if (!(object instanceof Respuesta)) {
            return false;
        }
        Respuesta other = (Respuesta) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.model.Respuesta[ id=" + id + " ]";
    }
    
}
