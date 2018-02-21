/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.utilidades;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

/**
 *
 * @author Ricardo.Bravo
 */
public class General {

    public static String documento(int secuencial) {
        String transaccion = "";
        SimpleDateFormat anio = new SimpleDateFormat("yyyy");
        SimpleDateFormat fechaSistema = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat horaSistema = new SimpleDateFormat("HH:mm:ss");
        SimpleDateFormat hora = new SimpleDateFormat("HH");
        SimpleDateFormat minuto = new SimpleDateFormat("mm");
        SimpleDateFormat segundo = new SimpleDateFormat("ss");
        Date calendar = new Date();

        int dig1 = 0, dig2 = 0, verificador = 0, minutoVerficador = 0;
        //hora
        String horaCadena = hora.format(calendar);
        dig1 = Integer.parseInt(horaCadena.substring(0, 1));
        dig2 = Integer.parseInt(horaCadena.substring(1, 2));
        verificador = dig1 + dig2;

        //minuto
        dig1 = 0;
        dig2 = 0;
        String minutoCadena = minuto.format(calendar);
        dig1 = Integer.parseInt(minutoCadena.substring(0, 1));
        dig2 = Integer.parseInt(minutoCadena.substring(1, 2));
        minutoVerficador = Integer.parseInt(minutoCadena);
        verificador += dig1 + dig2;

        //segundo        
        dig1 = 0;
        dig2 = 0;
        String segundoCadena = segundo.format(calendar);
        dig1 = Integer.parseInt(segundoCadena.substring(0, 1));
        dig2 = Integer.parseInt(segundoCadena.substring(1, 2));
        verificador += dig1 + dig2;

        if (minutoVerficador % 2 == 0) {
            transaccion = minutoCadena + horaCadena + segundoCadena;
        } else {
            transaccion = horaCadena + segundoCadena + minutoCadena;
        }
        return transaccion + completaSecuencial(secuencial);
    }

    private static String completaSecuencial(int sec) {
        String retorno = "";
        String secuencial = String.valueOf(sec);

        if (secuencial.length() < 7) {
            for (int i = secuencial.length(); i < 7; i++) {
                retorno += "0";
            }
            retorno += secuencial;
        } else {
            retorno = secuencial;
        }

        return retorno;
    }
}
