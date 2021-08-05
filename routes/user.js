const express = require('express');
const router = express.Router();
const {getSingle} = require('./../models/usuarios')

const getUser = async(req, res) => {
    const [usuario] = await getSingle(req.session.normalUser);
    console.log(usuario);
    res.render('user', {usuario});
}

router.get('/', getUser)     //Muestra el usuario
module.exports = router;