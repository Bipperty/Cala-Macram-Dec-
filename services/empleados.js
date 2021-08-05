 const {create, createImages, update, updateImages} = require('./../models/empleados');
 const {imgFile} = require('./../utils/fileHandler');

 const createEmpleado = async(body, file) => {
    try {
        const {insertId : id_empleado} = await create(body);    //Un create devuelve un insertId con el id del ingresado. Uso "id_empleado" por que asi esta en la BDD
        const uid = imgFile(file);
        const obj = {id_empleado, uid};                         //Uso "uid" por que asi se llama en la BDD
        const {insertId : idImg} = await createImages(obj);
        return idImg;
    } catch (e) {
        console.log(e);
    }
 }

 const updateEmpleado = async(id, body, file) => {
    try {
        const id_empleado = await update(id, body);    
        if (file){
            const uid = imgFile(file);
            const obj = {uid};                         
            const idImg = await updateImages(id, obj);
            return idImg;
        }
        else {
            return id_empleado;
        }
    } catch (e) {
        console.log(e);
    }
 }
module.exports = {createEmpleado, updateEmpleado}