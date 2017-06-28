/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uisrael.seguridad.utilidades;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

/**
 *
 * @author edwin
 */
@FacesValidator("validadorEmail")
public class ValidadorEmail implements Validator {

    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-]+(\\."
            + "[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*"
            + "(\\.[A-Za-z]{2,})$";
    private Pattern pattern;
    private Matcher matcher;

    public ValidadorEmail() {
        pattern = Pattern.compile(EMAIL_PATTERN);
    }

    @Override
    public void validate(FacesContext context, UIComponent component,
            Object value) throws ValidatorException {

        matcher = pattern.matcher(value.toString());
        String email = value.toString();
        if (matcher.matches()) {
            try {
                String[] cadenaMail = email.split("@");
                String dominio = cadenaMail[1];
                System.out.println("validando dominio-->" + dominio);
                InetAddress inetHost = InetAddress.getByName(dominio);
                String hostName = inetHost.getHostName();
                System.out.println("The host name was: " + hostName);
                System.out.println("The hosts IP address is: " + inetHost.getHostAddress());
            } catch (UnknownHostException ex) {
                Logger.getLogger(ValidadorEmail.class.getName()).log(Level.SEVERE, null, ex);
                FacesMessage msg
                        = new FacesMessage("Falla en validaciòn de email.",
                                "Nombre de dominio invalido");
                msg.setSeverity(FacesMessage.SEVERITY_ERROR);
                throw new ValidatorException(msg);
            }
        } else {
            FacesMessage msg
                    = new FacesMessage("Falla en validaciòn de email.",
                            "Formato de email incorrecto");
            msg.setSeverity(FacesMessage.SEVERITY_ERROR);
            throw new ValidatorException(msg);
        }
    }
}
