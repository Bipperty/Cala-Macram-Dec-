// Requerimiento de módulos
const createError = require('http-errors');
const express = require('express');
const path = require('path');
const cookieParser = require('cookie-parser');
const logger = require('morgan');
const dotenv = require('dotenv');             // Requerimiento de módulo .env
const session = require('express-session');   // Requerimiento del módulo express-session
const {verifyUser, verifyAdmin} = require('./middlewares/auth');

//Define Controladores
dotenv.config();
const indexRouter = require('./routes/index');
const productos = require('./routes/productos');
const registro = require('./routes/registro');
const login = require('./routes/login');

const adminIndex = require('./routes/admin/index');
const adminCategorias = require('./routes/admin/categorias');
const adminProductos = require('./routes/admin/productos');
const adminUsuarios = require('./routes/admin/usuarios');
const adminEmpleados = require('./routes/admin/empleados');
const adminUsuario = require('./routes/admin/usuarios');

const user = require('./routes/user');
const carrito = require('./routes/carrito');

const app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

//Define las rutas
app.use(session({
  secret : 'password',        //Password secreto, puede tener cualquier nombre
  cookie : {maxAge: null},    //Tiempo hasta que se venza la variable, se pone en segundos
  resave : true,              //Me lo guarda para un próximo inicio
  saveUninitialized : false  //Si se cae/resetea el servidor se cierra la sesión
}))

//ALL
app.use('/', indexRouter);
app.use('/registro', registro);
app.use('/login', login);
app.use('/productos', productos);

//USER
app.use('/user',verifyUser, user);
app.use('/carrito',verifyUser, carrito)

//ADMIN
app.use('/admin',verifyAdmin, adminIndex);       //El middelwares afecta a todas las rutas /admin
app.use('/admin/productos', adminProductos);
app.use('/admin/categorias', adminCategorias);
app.use('/admin/usuarios', adminUsuarios);
app.use('/admin/empleados', adminEmpleados);
app.use('/admin/usuario', adminUsuario);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;