/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.servicios;

import com.uisrael.seguridad.entidades.Sector;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author ricardo
 */
@Stateless
public class SectorFacade extends AbstractFacade<Sector> {

    @PersistenceContext(unitName = "seguridad-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SectorFacade() {
        super(Sector.class);
    }
    
}
