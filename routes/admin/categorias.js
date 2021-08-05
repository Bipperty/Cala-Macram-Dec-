const express = require('express');
const router = express.Router();
const {getCategoria, crearCategoria, getSingle, updateCategoria, delCategoria} = require('./../../models/categorias')

const get = async (req, res) => {
    const categoria = await getCategoria();
    res.render('adminCategorias',{categoria});
}

const showCreate = async (req, res) => {
    const categorias = await getCategoria();
    res.render('createCategoria', {categorias});
}

const create = async (req, res) => {
    const {body: categoria} = req;
    const {insertId} = await crearCategoria(categoria);
    console.log(insertId);
    res.redirect('/admin/categorias');
}

const showUpdate = async (req, res) => {
    const {id} = req.params;
    const [categoria] = await getSingle(id);
    res.render('updateCategoria',{categoria});
}

const update = async (req, res) => {
    const {id} = req.params;
    const {body: categoria} = req;
    const {insertId} = await updateCategoria(id,categoria);
    res.redirect('/admin/categorias');
}

const del = async (req, res) => {
    const {id} = req.params;
    const {insertId} = await delCategoria(id);
    res.redirect('/admin/categorias');
}

router.get('/', get);
router.get('/create', showCreate);
router.post('/create', create);
router.get('/update/:id', showUpdate);
router.post('/update/:id', update);
router.get('/delete/:id', del);

module.exports = router;