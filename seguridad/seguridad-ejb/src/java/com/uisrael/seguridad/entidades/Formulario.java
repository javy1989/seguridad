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
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.Size;

/**
 *
 * @author ricardo
 */
@Entity
@Table(catalog = "seguridad", schema = "public", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"id"})})
@NamedQueries({
    @NamedQuery(name = "Formulario.findAll", query = "SELECT f FROM Formulario f")})
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
    @Temporal(TemporalType.DATE)
    private Date fecha;
    @Size(max = 2147483647)
    @Column(length = 2147483647)
    private String codigo;
    private Boolean estado;
    @OneToMany(mappedBy = "formulario", fetch = FetchType.EAGER)
    private List<Examen> examenList;
    @OneToMany(mappedBy = "formulario", fetch = FetchType.EAGER)
    private List<DatosFormulario> datosFormularioList;
    @OneToMany(mappedBy = "formulario", fetch = FetchType.EAGER)
    private List<Recomendacion> recomendacionList;

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

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
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

    public List<Examen> getExamenList() {
        return examenList;
    }

    public void setExamenList(List<Examen> examenList) {
        this.examenList = examenList;
    }

    public List<DatosFormulario> getDatosFormularioList() {
        return datosFormularioList;
    }

    public void setDatosFormularioList(List<DatosFormulario> datosFormularioList) {
        this.datosFormularioList = datosFormularioList;
    }

    public List<Recomendacion> getRecomendacionList() {
        return recomendacionList;
    }

    public void setRecomendacionList(List<Recomendacion> recomendacionList) {
        this.recomendacionList = recomendacionList;
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
        return "com.uisrael.seguridad.entidades.Formulario[ id=" + id + " ]";
    }
    
}
