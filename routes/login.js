const express = require('express');
const router = express.Router();
const {auth} = require('./../models/usuarios');
const sha1 = require('sha1');
const {validateLogin} = require('./../middlewares/usuario')

const showLogin = (req, res,) => {
    res.render('login');
}

const login = async(req, res) => {
        let {username, pass} = req.body;        //Es let para para poder modificar pass con sha1
        pass = sha1(pass);
        const logeado = await auth(username, pass);
        if (logeado.length === 0) {
            res.render('login', {message: 'Usuario o contraseña incorrecto'})
        }
        else {
            const [{id, admin}] = logeado;     //Destructuring [{id}], por que el SELECT a la BDD me devuelve un RowDataPacket [{}], y me ahorro el "logeado[0].id"
            req.session.normalUser = id;       //Crea la variable de sesión para normalUssers(id es palabra reservada)
            req.session.adminUser = admin;     //Crea la variable de sesión para admins
            res.redirect('/')
        }
}   

router.get('/', showLogin);
router.post('/',validateLogin, login);
module.exports = router;