const express = require('express');
const router = express.Router();
const {getAll, deleteCarrito, compraRealizada} = require('./../models/carrito')

const getCarrito = async (req, res) => {
    const carrito = await getAll(req.session.normalUser);
    let precioFinal = 0;
    carrito.forEach(producto => {
        precioFinal += producto.precio;
    })
    res.render('carrito', {carrito, precioFinal});
}

const delCarrito = async (req, res) => {
    const {id} = req.params;
    const {insertId} = await deleteCarrito(id);
    res.redirect('/carrito');
}

const delCompraRealizada = async (req, res) => {
    const msgELim = await compraRealizada(req.session.normalUser)
    res.redirect('/')
}

router.get('/compra', delCompraRealizada)
router.get('/', getCarrito);
router.get('/delete/:id', delCarrito)

module.exports = router;