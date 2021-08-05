const {crearProducto, crearProductoImg, updateProducto, updateProductoImg} = require('./../models/productos');
const {imgFile} = require('./../utils/fileHandler');

const createProductoIMAGEN = async(body, file) => {
   try {
       const {insertId : id_producto} = await crearProducto(body);    //Un create devuelve un insertId con el id del ingresado. Uso "id_producto" por que asi esta en la BDD
       const uid = imgFile(file);
       const obj = {id_producto, uid};                                //Uso "uid" por que asi se llama en la BDD
       const {insertId : idProducImg} = await crearProductoImg(obj);
       return idProducImg;
   } catch (error) {
       console.log(error);
   }
}

const updateProductoIMAGEN = async(id, body, file) => {
    try {
        const id_producto = await updateProducto(id, body);
        if (file){
            const uid = imgFile(file);
            const obj = {uid};                                
            const idProducImg = await updateProductoImg(id, obj);
            return idProducImg;
        }
        else {
            return id_producto;
        }
    } catch (error) {
        console.log(error);
    }
 }

module.exports = {createProductoIMAGEN, updateProductoIMAGEN}
