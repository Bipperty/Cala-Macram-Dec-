//Filtrado de la extension de los archivos
const fs = require('fs');                          //Llamado al FileSystem
const {v4 : uuid} = require('uuid');               //Llamado al uuid para renombrar las imágenes y no se pisen
const allowExtensionsImg = ["png","jpg","jpeg"];   //Extensiones permitidas de Img

const saveFile = ({mimetype, path}, allowE, destFolder = `./public/images`) => {     //Comparador de extensiones. Destructuring a file por que solo uso {mimetype, path}
    try{
    const [type, extension] = mimetype.split("/");                 //Genera un array con el tipo y la extension [image, png]
    if(!allowE.includes(extension)) throw "Formato incorrecto";         //Compara si la extension esta permitida
    const uid = uuid();
    const fileName = `${uid}.${extension}`;
    const fileNameOut = `${destFolder}/${fileName}`;
    fs.createReadStream(path).pipe(fs.createWriteStream(fileNameOut));     //Flujo de archivo temp a Img
    fs.unlink(path, (error) => console.log(error));
    return fileName;
    } catch(e){
        fs.unlink(path, (error) => console.log(error));
        console.log(e);
    }
}

const imgFile = (file) => saveFile(file, allowExtensionsImg);       //Compara los formatos de imgFile
const videoFile = (file) => saveFile(file, allowExtensionsVideo);   //Compara los formatos de videoFile
const pdfFile = (file) => saveFile(file, allowExtensionsPdf);       //Compara los formatos de pdfFile

module.exports = {imgFile}