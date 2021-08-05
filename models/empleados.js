const pool = require('./../utils/bdd');

const create = (obj) => 
    pool.query("INSERT ?? SET ?", [process.env.T_EMPLEADOS, obj]).then(response => response).catch(error => console.log(error));       //Metodo oneliner de hacer una query simple (sin JOIN)

const createImages = (obj) => 
    pool.query("INSERT ?? SET ?", [process.env.T_EMPLEADOSIMG, obj]).then(response => response).catch(error => console.log(error));

const getAll = async () => {
    try {
        const query = "SELECT e.id, e.nombre, e.apellido, e.telefono, e.direccion, eI.uid AS uuid FROM ?? AS e JOIN ?? AS eI ON e.id = eI.id_empleado WHERE e.eliminado = 0";
        const params = [process.env.T_EMPLEADOS, process.env.T_EMPLEADOSIMG];
        return await pool.query(query, params);
    } catch (error){
        console.log(error);
    }
}

const getSingle = async (id) => {
    try {
        const query = "SELECT e.id, e.nombre, e.apellido, e.telefono, e.direccion, eI.uid AS uuid FROM ?? AS e JOIN ?? AS eI ON e.id = eI.id_empleado WHERE e.eliminado = 0 and e.id = ?";
        const params = [process.env.T_EMPLEADOS, process.env.T_EMPLEADOSIMG, id];
        return await pool.query(query, params);
    } catch (error){
        console.log(error);
    }
}

const update = async(id, obj) => {      //Actualiza un empleado
    const query = "UPDATE ?? set ? WHERE id = ?";
    const params = [process.env.T_EMPLEADOS, obj ,id];
    return await pool.query(query, params);
}

const updateImages = async(id, obj) => {      //Actualiza un empleadoImg
    const query = "UPDATE ?? set ? WHERE id_empleado = ?";
    const params = [process.env.T_EMPLEADOSIMG, obj ,id];
    return await pool.query(query, params);
}

const delEmpleado = async(id) => {              //Eliminado lógico del empleado
    const query = "UPDATE ?? SET eliminado = 1 WHERE id = ?";
    const params = [process.env.T_EMPLEADOS, id];
    return await pool.query(query, params);
}

const delEmpleadoImg = async(id) => {              //Eliminado lógico del empleado
    const query = "UPDATE ?? SET eliminado = 1 WHERE id_empleado = ?";
    const params = [process.env.T_EMPLEADOSIMG, id];
    return await pool.query(query, params);
}

module.exports = {create, createImages, getAll, getSingle, update, updateImages, delEmpleado, delEmpleadoImg}