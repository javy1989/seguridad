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
public class ExaDatosPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int examen;
    @Basic(optional = false)
    @NotNull
    @Column(nullable = false)
    private int pregunta;

    public ExaDatosPK() {
    }

    public ExaDatosPK(int examen, int pregunta) {
        this.examen = examen;
        this.pregunta = pregunta;
    }

    public int getExamen() {
        return examen;
    }

    public void setExamen(int examen) {
        this.examen = examen;
    }

    public int getPregunta() {
        return pregunta;
    }

    public void setPregunta(int pregunta) {
        this.pregunta = pregunta;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) examen;
        hash += (int) pregunta;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ExaDatosPK)) {
            return false;
        }
        ExaDatosPK other = (ExaDatosPK) object;
        if (this.examen != other.examen) {
            return false;
        }
        if (this.pregunta != other.pregunta) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.uisrael.seguridad.model.ExaDatosPK[ examen=" + examen + ", pregunta=" + pregunta + " ]";
    }
    
}
