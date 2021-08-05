const express = require('express');
const router = express.Router();
const {create, validar} = require('./../models/usuarios')
const sha1 = require('sha1');
const {v4: uuid} = require('uuid');
const {main} = require('./../services/mail');
const {validateRegistro} = require('./../middlewares/usuario')

const showRegistro = (req, res) => {
    res.render('registro');
  }

const createUser = async(req, res) => {
    const usuario = req.body;
    const uid = uuid();
    const usuarioFinal = {
      username: usuario.username,
      pass: sha1(usuario.pass),
      nombre: usuario.nombre,
      apellido: usuario.apellido,
      edad: usuario.edad,
      telefono: usuario.telefono,
      mail: usuario.mail,
      confirmacionCorreo: uid,
    };
    const {messageId} = await create(usuarioFinal);
    main({
      mail : usuarioFinal.mail,
      asunto : `Gracias ${usuarioFinal.username} por registrarte 😆`,
      cuerpo : `<a href=${process.env.HOST_URL}:${process.env.PORT}/registro/verify/${usuarioFinal.confirmacionCorreo}>Haz click para confirmar tu registro</a>`
    });
    res.redirect('/');
}

const verify = async(req, res) => {
    const {uid} = req.params;
    console.log(uid);
    const {messageId} = await validar(uid);
    res.redirect('/')
}

router.get('/', showRegistro);
router.post('/',validateRegistro, createUser);
router.get('/verify/:uid', verify);

module.exports = router;