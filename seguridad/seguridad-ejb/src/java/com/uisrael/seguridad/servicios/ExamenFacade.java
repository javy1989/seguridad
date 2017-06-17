/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.servicios;

import com.uisrael.seguridad.entidades.Examen;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ricardo
 */
@Stateless
public class ExamenFacade extends AbstractFacade<Examen> {

    @PersistenceContext(unitName = "seguridad-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ExamenFacade() {
        super(Examen.class);
    }

    /**
     * busca examen por codigo que se envia como argumento de la funcion 
     * @param codigo
     * @return Examen
     */
    public Examen buscarExamenPorCodigo(String codigo) {
        try {
            Query q = em.createQuery("select e from Examen as e where e.codigo= :codigo");
            q.setParameter("codigo", codigo);
            return (Examen) q.getSingleResult();
        } catch (Exception e) {
            return null;
        }

    }
}
