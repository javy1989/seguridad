/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.servicios;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
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
            System.out.println("enviando correo");
            sendMail(correo, asunto, cuerpo);
            System.out.println("enviado");
        } catch (NamingException ex) {
            Logger.getLogger(CorreoFacade.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void sendMail(String email, String subject, String body) throws NamingException, MessagingException, UnsupportedEncodingException {
        MimeMessage message = new MimeMessage(jmscorreo);
        message.setSubject(subject);

        message.setFrom(new InternetAddress(
                "autoevaluacion.com@gmail.com",
                "Sistema de Autoevalucion Etica-Empresarial"));
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email, false));
        Multipart multipart = new MimeMultipart("alternative");
        MimeBodyPart textPart = new MimeBodyPart();
        textPart.setText(body);
        MimeBodyPart htmlPart = new MimeBodyPart();
        htmlPart.setContent(body, "text/html;  charset=utf-8");
        multipart.addBodyPart(textPart);
        multipart.addBodyPart(htmlPart);
        message.setContent(multipart);
        message.setSubject("Información");
        Transport.send(message);
    }

    public String htmlContentEmail(File file) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new FileReader(file));
        StringBuilder sb = new StringBuilder();
        String line = br.readLine();
        while (line != null) {
            sb.append(line);
            sb.append(System.lineSeparator());
            line = br.readLine();
        }
        return sb.toString();
    }
}
