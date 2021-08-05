const express = require('express');
const router = express.Router();
const multer = require('multer');
const config = {dest : './public/temp'};
const upload = multer(config);
const {getAll, crearProducto, delProducto, delProductoImg, getSingle, updateProducto} = require('./../../models/productos');
const {getCategoria} = require('./../../models/categorias');
const service = require('./../../services/productos');

const get = async(req, res) => {                        // Muestro todos los productos
    const productos = await getAll();
    res.render('adminProductos',{productos});
}

const showCreate = async(req, res) => {                 // Muestra el formulario de producto
    const categorias = await getCategoria();
    res.render('createProductos', {categorias});
}

const create = async(req, res) => {                     // Crea un producto
    const idProducImg = await service.createProductoIMAGEN(req.body, req.file)
    res.redirect('/admin/productos');
}

const showUpdate = async(req, res) => {                 // Muestra el formulario del producto con los datos de tabla
    const {id} = req.params;
    const [producto] = await getSingle(id);
    const categorias = await getCategoria();
    res.render('updateProducto',{producto, categorias});
}

const update = async(req, res) => {                     // Actualiza los datos del producto
    const idProducImg = await service.updateProductoIMAGEN(req.params.id, req.body, req.file)
    res.redirect('/admin/productos');
}

const del = async(req, res) => {                         // Eliminado lógico del producto
    const {id} = req.params;
    const msgProducto = await delProducto(id);
    const msgProductoImg = await delProductoImg(id);
    res.redirect('/admin/productos');
}

router.get('/', get);
router.get('/create', showCreate);
router.post('/create', upload.single("imagen"), create);
router.get('/update/:id', showUpdate);
router.post('/update/:id', upload.single("imagen"), update);
router.get('/delete/:id', del);
module.exports = router;