const express = require('express');
const router = express.Router();
const multer = require('multer');                    // Multer
const config = {dest : './public/temp'};            // Configuración de multer, carpeta donde va a insertar los archivos temporales
const upload = multer(config);                     // Multer
const service = require('./../../services/empleados')
const model = require('./../../models/empleados')

const create = async (req, res) => {
    const idImg = await service.createEmpleado(req.body, req.file);
    res.redirect('/admin/empleados');
} 

const getAll = async (req, res) => {
    const empleados = await model.getAll();
    res.render('adminEmpleados', {empleados});
}

const showUpdate = async(req, res) => {                 // Muestra el formulario del empleado con los datos de tabla
    const {id} = req.params;
    const [empleado] = await model.getSingle(id);
    res.render('updateEmpleados',{empleado});
}

const update = async(req, res) => {                     // Actualiza los datos en la tabla empleados
    const idImg = await service.updateEmpleado(req.params.id, req.body, req.file);
    res.redirect('/admin/empleados');

}

const del = async(req, res) => {                         // Eliminado lógico del empleado
    const {id} = req.params;
    const msgEmpleado = await model.delEmpleado(id);
    const msgEmpleadoImg = await model.delEmpleadoImg(id);
    res.redirect('/admin/empleados');
}

router.get('/create', (req, res) => res.render('createEmpleados'));     //Oneliner para no hacer el showCreate
router.post('/create', upload.single("imagen"), create);                 //Se llama "imagen" por el nombre del form del HBS
router.get('/', getAll);
router.get('/update/:id', showUpdate);
router.post('/update/:id', upload.single("imagen"), update);
router.get('/delete/:id', del);
module.exports = router;