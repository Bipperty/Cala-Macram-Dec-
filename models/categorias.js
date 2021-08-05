const pool = require('./../utils/bdd');

const getCategoria = async () => {
    const query = "SELECT * FROM ?? WHERE eliminado = 0";
    const params = [process.env.T_CATEGORIAS];
    return await pool.query(query, params);
}

const crearCategoria = async(obj) => {           
    const query = "INSERT INTO ?? SET ?";
    const params = [process.env.T_CATEGORIAS, obj];
    return await pool.query(query, params);
}

const getSingle = async(id) => {
    const query = "SELECT * FROM ?? WHERE id = ? AND eliminado = 0";
    const params = [process.env.T_CATEGORIAS, id];
    return await pool.query(query, params);
}

const updateCategoria = async(id, obj) => {
    const query = "UPDATE ?? set ? WHERE id = ?";
    const params = [process.env.T_CATEGORIAS, obj ,id];
    return await pool.query(query, params);
}

const delCategoria = async(id) => {
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
    const params = [process.env.T_CATEGORIAS, id];
    return await pool.query(query, params);
}

module.exports = {getCategoria, crearCategoria, getSingle, updateCategoria, delCategoria}