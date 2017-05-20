/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.servicios;

import com.uisrael.seguridad.entidades.Formulario;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author ricardo
 */
@Stateless
public class FormularioFacade extends AbstractFacade<Formulario> {

    @PersistenceContext(unitName = "seguridad-ejbPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FormularioFacade() {
        super(Formulario.class);
    }

    public Formulario traerFormulario(String codigo) {
        try {
            Query q = em.createQuery("select f from Formulario as f where f.codigo= :codigo");
            q.setParameter("codigo", codigo);
            return (Formulario) q.getSingleResult();
        } catch (Exception e) {
            return null;
        }
    }
}
