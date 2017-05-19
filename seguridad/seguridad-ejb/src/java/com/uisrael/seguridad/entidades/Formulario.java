/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
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
    @NamedQuery(name = "Formulario.findAll", query = "SELECT f FROM Formulario f")
    , @NamedQuery(name = "Formulario.findById", query = "SELECT f FROM Formulario f WHERE f.id = :id")
    , @NamedQuery(name = "Formulario.findByNombre", query = "SELECT f FROM Formulario f WHERE f.nombre = :nombre")
    , @NamedQuery(name = "Formulario.findByDescripcion", query = "SELECT f FROM Formulario f WHERE f.descripcion = :descripcion")
    , @NamedQuery(name = "Formulario.findByCodigo", query = "SELECT f FROM Formulario f WHERE f.codigo = :codigo")
    , @NamedQuery(name = "Formulario.findByEstado", query = "SELECT f FROM Formulario f WHERE f.estado = :estado")
    , @NamedQuery(name = "Formulario.findByFecha", query = "SELECT f FROM Formulario f WHERE f.fecha = :fecha")
    , @NamedQuery(name = "Formulario.findByUserid", query = "SELECT f FROM Formulario f WHERE f.userid = :userid")})
public class Formulario implements Serializable {

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
    private String descripcion;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String codigo;
    private Boolean estado;
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String userid;
    @OneToMany(mappedBy = "formulario", fetch = FetchType.LAZY)
    private List<Examen> examenList;
    @OneToMany(mappedBy = "formulario", fetch = FetchType.LAZY)
    private List<DatosFormulario> datosFormularioList;

    public Formulario() {
    }

    public Formulario(Integer id) {
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    @XmlTransient
    public List<Examen> getExamenList() {
        return examenList;
    }

    public void setExamenList(List<Examen> examenList) {
        this.examenList = examenList;
    }

    @XmlTransient
    public List<DatosFormulario> getDatosFormularioList() {
        return datosFormularioList;
    }

    public void setDatosFormularioList(List<DatosFormulario> datosFormularioList) {
        this.datosFormularioList = datosFormularioList;
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
        if (!(object instanceof Formulario)) {
            return false;
        }
        Formulario other = (Formulario) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.model.Formulario[ id=" + id + " ]";
    }
    
}
