//meu arquivo de conexão com o banco de dados
const mysql = require("mysql2/promise")
//pool de conexão

const pool = mysql.createPool({
    //host é o endereço do banco
    host:"localhost",
    user:"root",
    password:"",
    port:3306,
    database: "health_ia",
    waitForConnections: true,
    connectionLimit:10,
    queueLimit: 0
})
module.exports= pool