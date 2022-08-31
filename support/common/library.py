import requests as req

#Mostra o carrinho do usuário buscando pelo user ID

def mostrar_carrinho_usuario(id_user):
    r = req.get("http://localhost:3000/carrinhos")
    response = r.json()
    qtd_carrinhos = int(response["quantidade"])
    carrinho = None
    for i in range(0, qtd_carrinhos-1):
        if (response["carrinhos"][i]["idUsuario"] == id_user):
            carrinho = response["carrinhos"][i]["produtos"]
        else:
            carrinho = "Usuário sem carrinho"
    return carrinho

#Produto está em tantos carrinhos?