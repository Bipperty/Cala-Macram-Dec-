const pool = require('./../utils/bdd');

const getAll = async() => {                             //Query para traer todos los usuarios
    const query = 'SELECT * FROM ?? WHERE eliminado = 0';
    const params = [process.env.T_USUARIOS];
    return await pool.query(query, params);
}

const getSingle = async(id) => {                        //Query para traer singleUser
    const query = 'SELECT * FROM ?? WHERE id = ?';
    const params = [process.env.T_USUARIOS, id];
    return await pool.query(query, params);
}

const create = async (obj) => {                         //Query para crear un usuario
    const query = 'INSERT INTO ?? SET ?';
    const params = [process.env.T_USUARIOS, obj];
    return await pool.query(query, params);
}

const validar = async(uid) => {                          //Query para validar el email
    const query = 'UPDATE ?? SET habilitado = 1 WHERE confirmacionCorreo = ?';
    const params = [process.env.T_USUARIOS, uid];
    return await pool.query(query, params);
}

const auth = async(username, pass) => {                  //Query para loguear
    const query = "SELECT id, admin FROM ?? WHERE username = ? AND pass = ? AND habilitado = 1 AND eliminado = 0";
    const params = [process.env.T_USUARIOS, username, pass]
    return await pool.query(query, params);
}

const updateUsuario = async(id, obj) => {
    const query = 'UPDATE ?? SET ? WHERE id = ?';
        const params = [process.env.T_USUARIOS, obj, id];
        return await pool.query(query, params);
}

const delUsuario = async(id) => {
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
    const params = [process.env.T_USUARIOS, id];
    return await pool.query(query, params);
}

module.exports = {getAll, getSingle, create, validar, auth, getSingle, updateUsuario, delUsuario}