/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.servicios;

import com.uisrael.seguridad.entidades.DetalleExamen;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ricardo
 */
@Stateless
public class DetalleExamenFacade extends AbstractFacade<DetalleExamen> {

    @PersistenceContext(unitName = "seguridad-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public DetalleExamenFacade() {
        super(DetalleExamen.class);
    }
    
}
