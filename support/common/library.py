from itertools import product
from urllib import response
import requests as req

#Buscar carrinho pelo ID do usuário

def mostrar_carrinho_usuario(id_user):
    r = req.get("http://localhost:3000/carrinhos")
    response = r.json()
    qtd_carrinhos = int(response["quantidade"])
    carrinho = None
    for i in range(0, qtd_carrinhos-1):
        if (response["carrinhos"][i]["idUsuario"] == id_user):
            carrinho = response["carrinhos"][i]["produtos"]
    return carrinho

#Buscar usuário pelo e-mail

def mostrar_usuario_email(email):
    r = req.get("http://localhost:3000/usuarios")
    response = r.json()
    qtd_usuarios = int(response["quantidade"])
    user = None
    for i in range(0, qtd_usuarios-1):
        if(response["usuarios"][i]["email"] == email):
            user = response["usuarios"][i]["nome"]
    return user

#Mostrar o ID do produto já existente buscando pelo nome

def mostrar_id_produto_repetido(nome):
    r = req.get("http://localhost:3000/produtos")
    response = r.json()
    qtd_produtos = int(response["quantidade"])
    produto = None
    for i in range(0, qtd_produtos):
        if(response["produtos"][i]["nome"] == nome):
            produto = response["produtos"][i]["_id"]
    return produto

#Mostrar o saldo do produto antes e depois de concluir a compra

def mostrar_saldo_produtos_carrinho(carrinho):
    r = req.get("http://localhost:3000/produtos")
    response = r.json()
    n_prod_carrinho = len(carrinho)
    qtd_produtos = int(response["quantidade"])
    saldo = []
    for p in range(0, n_prod_carrinho):
        for i in range(0, qtd_produtos):
            if (response["produtos"][i]["_id"] == carrinho[p]["idProduto"]):
                saldo.append(response["produtos"][i]["nome"] + ": " + str(response["produtos"][i]["quantidade"]))
    return saldo