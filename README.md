# BackEnd

O back-end cria a interface com a API open-bank Safra e com o banco de dados Safra Partners.
---

Esta API foi desenvolvida com a intenção de trabalhar de forma conjunta com o app Safra Partners, funcionando de backend da aplicação. Este então oferece o controle de usuários, tanto clientes do banco quanto parceiros e administradores do sistema, manejando dados do OpenBanking e oferecendo o controle de ofertas e contratos entre usuários e parceiros.

---
	
Uso (para teste) No diretório raiz:

	1- Criar e fazer migration da base de dados:
		rake db:migrate

    2- Iniciar o Rails
        rails s
	

### Endpoints da API

[Clique aqui para acessar os endpoints desta API](https://app.getpostman.com/join-team?invite_code=07290794c7e168fef1e5c2dafe30c9a6&target_code=d4579371b43ad35fef8eb87f20a710d4)

Gems instaladas (além das padrão do Rails)

	- pg 
        somente para ambiente de produção
	
	- devise
        para controle de usuários
	
	- simple_token_authentication 
        para login e requisições através de token

Versão:

1.0b A versão atual suporta o controle de usuários e o uso de token para acesso aos dados, porém os dados obtidos através dos endpoins do openbanking retornam
informações padrão, obtidas através da documentação do OpenBanking Brasil, pois apenas as instituições financeiras podem obter acesso aos dados de clientes reais,     após autorização.
    
[Também é possível acessar a API clicando aqui](https://safrapartners-backend-staging.herokuapp.com/)