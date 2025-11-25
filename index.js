const express = require('express')
const cors = require('cors')
const mysql = require('mysql2/promise')
const porta = 3000
const app = express()
const conexao = require('./db.js')

//Modulo crypto
const crypto = require('crypto')


//Consegue acessar os dados do body
app.use(express.json())
app.use(cors())

app.listen(porta, () => {
    console.log('Servidor PI-RA-CAN-JU-BA')
})

//Criando uma rota
app.get("/hash", async (req, res) => {
    try {

        let { senha } = req.body

        senha = senha.trim()
        if (senha == "") {

            return res.send("Insira uma senha")

        } else if (senha.length < 6) {

            return res.send("Digite uma senha de pelo menos 6 caracteres")
        }

        const hash = crypto.createHash("sha256").update(senha).digest("hex")

        res.send(`Senha enviada ${hash}`)

    } catch (error) {
        console.log(`O erro exibido foi ${error}`)
    }
})


app.post("/cadastro", async (req, res) => {
    try {

        const { nome_completo, email, caminho_foto } = req.body
        let { senha } = req.body
        //Realizando tratativas para o cadastro do cliente impossibilitar senha email e nome vazio ou falso.
        senha = senha.trim()
        if (senha == "") {

            return res.json({
                "resposta":"Insira uma senha"
            })

        } else if (senha.length < 6) {

            return res.json({
                "resposta":"Digite uma senha de pelo menos 6 caracteres"
        })
        } else if (email.length < 6){
            
            return res.json({
                "resposta":"Insira seu email"
        })
        } else if (nome_completo < 6) {

            return res.json({
                "resposta":"Digite seu nome completo"
        })
        }

        //verificar se o email já está cadastrado

        let sql = `SELECT * FROM usuarios WHERE email=?`
        let [resultado] = await conexao.query(sql,[email])
        console.log(resultado.length)
        if (resultado.length != 0) {
            return res.json({
                "resposta":"Email já cadastrado!"
            })
        }
        const hash = crypto.createHash("sha256").update(senha).digest("hex")
        sql = `insert into usuarios (nome_completo,email,senha,caminho_foto) values (?,?,?,?) `
        const [resultado2] = await conexao.query(sql, [nome_completo, email, hash, caminho_foto])

        if (resultado2.affectedRows == 1) {
            
            return res.json({
                "resposta":" Cadastro Efetuado! "
            })

        } else{
            
            return res.json({
                "resposta":" Erro ao fazer o cadastro! "
            })
        }

    } catch (error) {
        console.log(`O erro foi: ${error}`)
    }
})

app.post("/login", async (req, res) => {
    try {
        const { email } = req.body
        let { senha } = req.body

        senha = senha.trim()

        const hash = crypto.createHash("sha256").update(senha).digest("hex")

        const sql = `select * from usuarios where email=? and senha=?`
        const [resultado] = await conexao.query(sql, [email, hash])
        console.log(sql)

        if (resultado.length == 1) {
            return res.send('Login feito!')
        } else {
            return res.send('Login ou senha incorretos!')
        }

    } catch (error) {
        console.log(`O erro foi ${error}`)
    }
})


app.post("/cadastrando_produtos", async (req, res) => {
    
    try {

        const { nome_produto, preco, qtde_estoque, status, caminho_foto } = req.body
        
        
        let sql_select = `select * from produtos where nome_produto like '%${nome_produto}%'`
        let [resultado] = await conexao.query(sql_select)

        if (resultado.length == 0) {
            const sql = `insert into produtos (nome_produto,preco,qtde_estoque,status,caminho_foto) values (?,?,?,?,?)`
            let [resultado] = await conexao.query(sql, [nome_produto, preco, qtde_estoque, status, caminho_foto])
            res.send("Produto cadastrado!")
        }else{
            res.send("Produto já existente")
        }



    } catch (error) {
        console.log(`O erro que deu foi: ${error}`)
    }
})

app.post("/cadastrando_pedidos",async (req,res)=>{
    try {
        
    } catch (error) {
        console.log(`O erro foi ${error}`)
    }
})