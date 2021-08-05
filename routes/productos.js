const express = require('express');
const router = express.Router();
const {getAll, getSingle, getNombre} = require('./../models/productos');
const modelCarrito = require('./../models/carrito');
const {verifyUser} = require('../middlewares/auth');


const all = async(req, res) => {
    const productos = await getAll();
    res.render('productos',{productos});
}

const single = async(req, res) => {
    const {id} = req.params;
    const [producto] = await getSingle(id);     // Destructuring a producto para no hacer el #each del single
    res.render('producto',{producto});
}

const buscador = async(req, res) => {           //busca producto por nombre
    let {buscar} = req.body;
    buscar = '%' + buscar + '%';
    const productos = await getNombre(buscar);
    res.render('productos',{productos});
}

const insertCarrito = async(req, res) => {
    const {id : id_producto} = req.params;
    const id_usuario = req.session.normalUser;
    const   obj = {
        id_producto,
        id_usuario
    }
    const {insertId} = await modelCarrito.insertCarrito(obj);
    console.log(insertId);
    res.redirect('/carrito');
}

router.get('/', all);
router.get('/single/:id', single);
router.post('/', buscador);
router.get('/compra/:id', verifyUser ,insertCarrito)

module.exports = router;