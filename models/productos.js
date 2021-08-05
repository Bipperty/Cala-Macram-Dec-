const pool = require('./../utils/bdd');

const getAll = async() => {                     //Trae todos los productos
    const query = "SELECT p.nombre, p.modelo, p.id, p.descripcion, p.stock, p.precio, c.nombre AS nombreCategoria, ip.uid FROM ?? AS p JOIN ?? AS c on p.id_categoria = c.id LEFT JOIN ?? AS ip on p.id = ip.id_producto WHERE p.eliminado = 0";
    const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, process.env.T_PRODUCTOSIMG]
    const rows = await pool.query(query, params);
    return rows;
}

const getSingle = async(id) => {                // Trae un producto individual 
    const query = "SELECT p.nombre, p.modelo, p.id, p.descripcion, p.stock, p.precio, c.nombre AS nombreCategoria, ip.uid FROM ?? AS p JOIN ?? AS c on p.id_categoria = c.id LEFT JOIN ?? AS ip on p.id = ip.id_producto WHERE p.eliminado = 0 AND p.id = ?";
    const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, process.env.T_PRODUCTOSIMG, id];
    return await pool.query(query, params);
}

const crearProducto = async(obj) => {           //Crea nuevo producto
    const query = "INSERT INTO ?? SET ?";
    const params = [process.env.T_PRODUCTOS, obj];
    return await pool.query(query, params);
}

const crearProductoImg = async(obj) => {           //Crea nueva imagenProducto
    const query = "INSERT INTO ?? SET ?";
    const params = [process.env.T_PRODUCTOSIMG, obj];
    return await pool.query(query, params);
}

const updateProducto = async(id, obj) => {      //Actualiza un producto
    const query = "UPDATE ?? set ? WHERE id = ?";
    const params = [process.env.T_PRODUCTOS, obj ,id];
    return await pool.query(query, params);
}

const updateProductoImg = async(id, obj) => {      //Actualiza un productoImg
    const query = "UPDATE ?? set ? WHERE id_producto = ?";
    const params = [process.env.T_PRODUCTOSIMG, obj ,id];
    return await pool.query(query, params);
}

const delProducto = async(id) => {              //Eliminado lógico del producto
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
    const params = [process.env.T_PRODUCTOS, id];
    return await pool.query(query, params);
}

const delProductoImg = async(id) => {              //Eliminado lógico del productoImg
    const query = "UPDATE ?? SET eliminado = 1 WHERE id_producto = ?";
    const params = [process.env.T_PRODUCTOSIMG, id];
    return await pool.query(query, params);
}

const getNombre = async(nombre) => {            //Busca producto por nombre
    const query = "SELECT p.nombre, p.modelo, p.id, p.descripcion, p.stock, p.precio,p.id_categoria, c.nombre AS nombreCategoria FROM ?? AS p JOIN ?? AS c on p.id_categoria = c.id WHERE p.nombre LIKE ? AND p.eliminado = 0";
    const params = [process.env.T_PRODUCTOS, process.env.T_CATEGORIAS, nombre];
    const rows = await pool.query(query, params);
    return rows;
}

module.exports = {getAll, getSingle, crearProducto, crearProductoImg, updateProducto, updateProductoImg, delProducto, delProductoImg, getNombre};