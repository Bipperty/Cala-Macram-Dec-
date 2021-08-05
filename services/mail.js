const nodemailer = require('nodemailer');

// función asincronica por la demora del envió del mail
const main = async({mail, asunto, cuerpo}) => {
    try {
    const transporter = nodemailer.createTransport ({
        /*
        host: 'smtp.gmail.com', // Hosteo de mail, en este caso gmail. Es el mail con el cual vamos a responder al usuario.
        port: 587, // puerto que nos da en las docs
        secure: false, //true para el puerto 465, false para el resto de los puertos. Es para tener certificado SSL
        */ 
        service : process.env.MAIL_SERVICE || 'gmail', // 'gmail' || Es lo mismo que el host, port y secure de arriba
        auth : {
            user: process.env.MAIL_USER || 'mail',
            pass: process.env.MAIL_PASSWORD || 'password',
        },
    });

    // Enviar correo con objeto de transporte definido
    const info = {
        from: '<no-reply>', // Dirección del remitente
        to: mail,           // Lista de receptores
        subject: asunto,    // Línea de asunto
        html: cuerpo,       // Cuerpo html
        /* text: cuerpo,    // Cuerpo de texto sin formato */
    };

    const {messageId} = await transporter.sendMail(info);
    return messageId;
    }
    catch (error) {
        console.log(error);
    }
};

module.exports = {main};