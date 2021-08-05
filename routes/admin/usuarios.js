const express = require('express');
const router = express.Router();
const {getAll, getSingle, updateUsuario, delUsuario} = require('./../../models/usuarios');

const getAllUsers = async(req, res) => {
  const usuarios = await getAll();
  res.render('adminUsuarios', {usuarios})
}

const showUpdate = async(req, res) => {
  const {id} = req.params;
  const [usuario] = await getSingle(id);
  res.render('updateUsuario', {usuario});
}

const update = async(req, res) => {
  const {id} = req.params;
  const {body: usuario} = req;
  const {insertId} = await updateUsuario(id,usuario);
  res.redirect('/admin/usuarios');
}

const del = async(req, res) => {
  const {id} = req.params;
  const {insertId} = await delUsuario(id);
  res.redirect('/admin/usuarios');
}

router.get('/',getAllUsers);
router.get('/update/:id', showUpdate);
router.post('/update/:id', update);
router.get('/delete/:id', del);

module.exports = router;