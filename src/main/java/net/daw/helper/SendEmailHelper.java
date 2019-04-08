package net.daw.helper;

import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmailHelper {
    
    public static void sendEmail(String correo, String code) {
        try {
            String host = "smtp.gmail.com";
            String user = "fondoverdemilitar7@gmail.com";
            String pass = "tioverdemilitar7";
            String to = correo;
            String from = "fondoverdemilitar7@gmail.com";
            String subject = "Hola soy la aplicacion de correo";
            String messageText;
            if (code == null) {
                messageText = "Email validado correctamente. Logueate";
            } else {
                messageText = "Dale a este enlace para validar tu cuenta: http://localhost:8080/json?ob=usuario&op=validation&code=" + code;
            }
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new Date());
            msg.setText(messageText);

            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            System.out.println("message send successfully");
        } catch (MessagingException ex) {
            System.out.println(ex);
        }
    }

}
