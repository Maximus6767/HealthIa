// Criando meu arquivo para a conexão com meu banco de dados
const mysql = require("mysql2/promise")
//pool para a conexão
const pool = mysql.createPool({
    //host é o endereço do seu banco
    host:"localhost",
    user:"root",
    password:"",
    port:3306,
    database:"health_ia",
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
})
module.exports=pool