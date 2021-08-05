// Conexión a la BDD
const mysql = require('mysql');
const util = require('util');

let pool = mysql.createPool({               //Crea un pool para conexiones en simultaneo
    host : process.env.DB_HOST,
    user : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    port : process.env.DB_PORT,
    database : process.env.DB_DATABASE,
    connectionLimit : 10,                   //Indica las consultas en simultaneo. Genera una cola FirstInFirstOut.
});

pool.query = util.promisify(pool.query);    // transforma la consulta en promesa
module.exports = pool;