/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.servicios;

import com.uisrael.seguridad.entidades.Examen;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.Stateless;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.naming.NamingException;

/**
 *
 * @author desarrollo
 */
@Stateless
public class CorreoFacade {

    @Resource(name = "jdni/auditoria")
    private Session jmscorreo;
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public void enviarCorreo(String correo, String asunto, String cuerpo) throws MessagingException, UnsupportedEncodingException {
        try {
            sendMail(correo, asunto, cuerpo);
        } catch (NamingException ex) {
            Logger.getLogger(CorreoFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void sendMail(String email, String subject, String body) throws NamingException, MessagingException, UnsupportedEncodingException {
        MimeMessage message = new MimeMessage(jmscorreo);
        message.setSubject(subject);

        message.setFrom(new InternetAddress(
                "softenterprise.com@gmail.com",
                "Sistema de Planificación Curricular"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
        Multipart multipart = new MimeMultipart("alternative");
        MimeBodyPart textPart = new MimeBodyPart();
        String textContent = "Bienvenid@";
        textPart.setText(textContent);
        MimeBodyPart htmlPart = new MimeBodyPart();
        String htmlContent = body;
        htmlPart.setContent(htmlContent, "text/html;  charset=utf-8");
        multipart.addBodyPart(textPart);
        multipart.addBodyPart(htmlPart);
        message.setContent(multipart);
        Transport.send(message);
    }

    public String htmlExamenNuevo(Examen examen) {
        String html;
        html = "<!DOCTYPE html>"
                + "<html>"
                + "    <head>"
                + "        <style>"
                + "         body{"
                + "             background-color: white;"
                + "         }"
                + "         #contenido{"
                + "             width: 500px;"
                + "             margin: 0 auto;"
                + "         }"
                + "         h1{"
                + "             margin: 10 auto;"
                + "             font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;"
                + "             font-size: 15px;"
                + "         }"
                + "         div[class *='cab']{ "
                + "             background-color: #5b7989;"
                + "             height: 50px;"
                + "         }"
                + "         footer{"
                + "             background-color: #5b7989;"
                + "             height: 20px;"
                + "         }"
                + "         .enlace {"
                + "             margin: 10px;"
                + "             border-radius: 10px 10px;"
                + "             width: 500px;"
                + "             text-align: center;"
                + "         }"
                + ""
                + ".  a {    font-family: verdana, arial, sans-serif;"
                + "     font-size: 10pt;"
                + "     font-weight: bold;"
                + "     padding: 4px; "
                + "     background-color: dodgerblue;"
                + "     border-radius: 10px 10px;"
                + "     color: #666666; "
                + "     text-decoration: none; "
                + "}       "
                + "        </style>"
                + "    </head> "
                + "    <body>"
                + "        <div id=\"contenido\">"
                + "            <div class=\"cabecera\">"
                + "                <b><font color=\"white\"  face=\"serif\">Consultoria-Auditoria</font></b><br/>"
                + "                <font color=\"white\">Sistema de Autoevalucion Etica-Empresarial</font>"
                + "            </div>"
                + "            <h1>Resultados de informe:</h1>"
                + "            <p>"
                + "            Estimad@ Usuari@, en el siguiente enlace ya tiene disponible para consulta del informe de diagnóstico solicitado."
                + "            </p>"
                + "            <center>"
                + "                   <a href=\"localhost:8080/seguridad-war/resultado.jsf?faces-redirect=true&cod=\\"+examen.getCodigo()+"\" target=\"_blank\">Enlace de Visualizacion</a>"
                + "            </center>"
                + "<br></br>"
                + "            <footer>"
                + "                <span>Mensaje enviado automaticamente</span>"
                + "            </footer>"
                + "        </div>"
                + "    </body>"
                + "</html>";
        return html;
    }
}
