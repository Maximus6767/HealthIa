const express = require('express')
const cors = require('cors')
const myslq2 = require('mysql2/promise')
const porta = 3000
const app = express()
const conexao = require('./db.js')

//permissão para acessar os dados do body
app.use(express.json())
app.use(cors())

//mensagem para saber que o server está no ar
app.listen(porta, () => {
    console.log('Servidor pocandissimo')
})


//criando a rota do contate-nos
app.post("/contate_nos", async (req, res) => {
    try {
        const { nome, email, instituicao, assunto, mensagem } = req.body
        const sql = `INSERT INTO contate_nos (nome,email,instituicao,assunto,mensagem) VALUES (?,?,?,?,?)`
        const [resultado] = await conexao.query(sql, [nome, email, instituicao, assunto, mensagem])
        //tratando a resposta
        if (resultado.affectedRows == 1) {

            return res.json({
                "resposta": " Mensagem enviada aguarde nossa resposta no email! "
            })
        } else {
            return res.json({
                "resposta": " Erro inesperado "
            })
        }


    } catch (error) {
        res.json({ "resposta": error })
    }
})