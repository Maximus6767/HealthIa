const express = require('express');
const cors = require('cors');
const mysql2 = require('mysql2/promise');
const porta = 3000;
const app = express();
const conexao = require('./db.js')

//criando a permissão para acesso de dados do body
app.use(express.json());
app.use(cors());

//mensagem para saber se o server está rodando ou não
app.listen(porta,()=>{
    console.log('Servidor onlainer');
})

//Fazendo função para checar se o email é válido ou não
function validarEmail(email_a_validar) {
    const emailRegex= /^[a-zA-Z0-9.!#$%&'*+/=?^_{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*\.[a-zA-Z]{2,}$/;
    return emailRegex.test(email_a_validar);
}
//Fazendo função para checar se a senha contém as validações necessárias aA0~9 @ e especiais
function validarSenha(senha_a_validar) {
    const senhaRegex= /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[^A-Za-z0-9]).{8,}$/;
    return senhaRegex.test(senha_a_validar);
}

app.post("/cadastro", async (req,res)=>{
    const {nome_user, email, dt_nasc,}= req.body;
    let{ senha }= req.body;

    //Adicionando o trim para as minhas variaveis
    const userTrim= nome_user?.trim();
    const emailTrim= email?.trim();
    const dt_nascTrim= dt_nasc?.trim();
    const senhaTrim= senha?.trim();

    //Tratativa para possiveis erros na hora do cadastro
    if (!userTrim || userTrim.length<5 ) {
        return res.json({
            "resposta":"Insira um nome para seu usuário da intranet."
        });
    } else if (!emailTrim || emailTrim<5) {
        return res.json({
            "resposta":"Insira seu endereço de email."
        });
    } else if (!validarEmail(emailTrim)){
        return res.json({
            "resposta":"Insira um email válido."
        });
    } else if (!dt_nascTrim){
        return res.json({
            "resposta":"Insira sua data de nascimento."
        });
    } else if (!senhaTrim || senhaTrim< 8){
        return res.json({
            "resposta":"Insira uma senha de pelo menos 8 digitos."
        });
    } else if (!validarSenha(senhaTrim)){
        return res.json({
            "resposta":"Insira pelo menos um caractere especial juntamente de números e letras minúsculas e maiúsculas"
        });
    }

    // Verificar se o email já possue cadastro no banco
    let sql = `SELECT * FROM cadastros WHERE email=?`
    let [resultado] = await conexao.query(sql[emailTrim])
    if (resultado.length != 0) {
        return res.json({
            "resposta":"Email já cadastrado"
        })
    }
    
})
