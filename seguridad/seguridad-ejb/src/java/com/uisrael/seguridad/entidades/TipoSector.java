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
@Table(name = "tipo_sector", catalog = "seguridad", schema = "public")
@NamedQueries({
    @NamedQuery(name = "TipoSector.findAll", query = "SELECT t FROM TipoSector t")})
public class TipoSector implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(nullable = false)
    private Integer id;
    private Integer orden;
    private Boolean estado;
    @OneToMany(mappedBy = "sector", fetch = FetchType.LAZY)
    private List<SectorActividad> sectorActividadList;
    @JoinColumn(name = "sector", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Sector sector;
    @JoinColumn(name = "tipo", referencedColumnName = "id")
    @ManyToOne(fetch = FetchType.LAZY)
    private Tipo tipo;

    public TipoSector() {
    }

    public TipoSector(Integer id) {
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

    public List<SectorActividad> getSectorActividadList() {
        return sectorActividadList;
    }

    public void setSectorActividadList(List<SectorActividad> sectorActividadList) {
        this.sectorActividadList = sectorActividadList;
    }

    public Sector getSector() {
        return sector;
    }

    public void setSector(Sector sector) {
        this.sector = sector;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
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
        if (!(object instanceof TipoSector)) {
            return false;
        }
        TipoSector other = (TipoSector) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return sector.toString();
    }
    
}
