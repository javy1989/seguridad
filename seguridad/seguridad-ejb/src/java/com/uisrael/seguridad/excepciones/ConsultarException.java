/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.plancurricular.excepciones;

/**
 *
 * @author luisfernando
 */
public class ConsultarException extends Exception{
    public ConsultarException(String message, Throwable cause) {
        super("Error al ejecutar la consulta :\n"+message, cause);
    }
    public ConsultarException(String message) {
        super("Error al ejecutar la consulta :\n"+message);
    }

}