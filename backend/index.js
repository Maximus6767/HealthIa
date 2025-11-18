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

        //minhas variaveis sem ter espaço 
        const nomeTrim = nome?.trim();
        const emailTrim = email?.trim();
        const instituicaoTrim = instituicao?.trim();
        const assuntoTrim = assunto?.trim();
        const mensagemTrim = mensagem?.trim();


        //tradando erros dos usuario sacana
        if (!nomeTrim || nomeTrim.length < 10) {
            return res.json({
                "resposta": " Insira seu nome e sobrenome para entrar na lista de contato."
            })
        } else if (!emailTrim) {
            return res.json({
                "resposta": " O email deve ser preenchido para entrarmos em contato."
            })
        } else if (!mensagemTrim) {
            return res.json({
                "resposta": " Você deve escrever sua mensagem para te ajudarmos"
            })
        } else if (mensagemTrim.length < 30) {
            return res.json({
                "resposta": "Mensagens devem conter pelo menos 30 caracteres."
            })
        } else if (assuntoTrim.length < 10) {
            return res.json({
                "resposta": " Detalhe sobre o que gostaria de falar."
            })
        } else if (!assuntoTrim) {
            return res.json({
                "resposta": " Você deve dizer sobre o que se trata a mensagem na qual deseja nos contatar."
            })
        } else if (!instituicaoTrim) {
            return res.json({
                "resposta": " Insira o nome de uma de nossas instituições."
            })
        }
        // Fazendo meu insertzin no bancos dos dados
        const sql = `INSERT INTO contate_nos (nome,email,instituicao,assunto,mensagem) VALUES (?,?,?,?,?)`
        const [resultado] = await conexao.query(sql, [nomeTrim, emailTrim, instituicaoTrim, assuntoTrim, mensagemTrim])

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
        res.json({
            "resposta": error
        })
    }
})