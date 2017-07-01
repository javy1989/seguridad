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
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author ricardo
 */
@Entity
@Table(name = "sector_actividad", catalog = "seguridad", schema = "public")
@NamedQueries({
    @NamedQuery(name = "SectorActividad.findAll", query = "SELECT s FROM SectorActividad s")})
public class SectorActividad implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    private Integer orden;
    private Boolean estado;
    @JoinColumn(name = "actividad", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Actividad actividad;
    @JoinColumn(name = "sector", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private TipoSector sector;
    @OneToMany(mappedBy = "actividad", fetch = FetchType.LAZY)
    private List<Empresa> empresaList;

    public SectorActividad() {
    }

    public SectorActividad(Integer id) {
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

    public Actividad getActividad() {
        return actividad;
    }

    public void setActividad(Actividad actividad) {
        this.actividad = actividad;
    }

    public TipoSector getSector() {
        return sector;
    }

    public void setSector(TipoSector sector) {
        this.sector = sector;
    }

    public List<Empresa> getEmpresaList() {
        return empresaList;
    }

    public void setEmpresaList(List<Empresa> empresaList) {
        this.empresaList = empresaList;
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
        if (!(object instanceof SectorActividad)) {
            return false;
        }
        SectorActividad other = (SectorActividad) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        if (actividad != null) {
            return actividad.toString();
        }
        return "";

    }

}
