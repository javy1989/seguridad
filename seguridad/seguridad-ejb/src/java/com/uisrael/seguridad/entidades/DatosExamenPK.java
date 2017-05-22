/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.entidades;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author ricardo
 */
@Embeddable
public class DatosExamenPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "apartado_pregunta", nullable = false)
    private int apartadoPregunta;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int examen;

    public DatosExamenPK() {
    }

    public DatosExamenPK(int apartadoPregunta, int examen) {
        this.apartadoPregunta = apartadoPregunta;
        this.examen = examen;
    }

    public int getApartadoPregunta() {
        return apartadoPregunta;
    }

    public void setApartadoPregunta(int apartadoPregunta) {
        this.apartadoPregunta = apartadoPregunta;
    }

    public int getExamen() {
        return examen;
    }

    public void setExamen(int examen) {
        this.examen = examen;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) apartadoPregunta;
        hash += (int) examen;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof DatosExamenPK)) {
            return false;
        }
        DatosExamenPK other = (DatosExamenPK) object;
        if (this.apartadoPregunta != other.apartadoPregunta) {
            return false;
        }
        if (this.examen != other.examen) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.entidades.DatosExamenPK[ apartadoPregunta=" + apartadoPregunta + ", examen=" + examen + " ]";
    }
    
}
