/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plancurricular.excepciones;

import javax.ejb.ApplicationException;

/**
 *
 * @author luisfernando
 */
@ApplicationException(rollback = true)
public class BorrarException extends Exception {

    public BorrarException(String message, Throwable cause) {
        super("Error al ejecutar el borrado :\n" + message, cause);
    }

    public BorrarException(String message) {
        super("Error al ejecutar el borrado :\n" + message);
    }
}
