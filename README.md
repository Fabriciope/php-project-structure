Estrutura nginx com php-fpm utilizando docker para projetos web php.
<br><br>

Primeiro de tudo clone o projeto e troque para a branch correta.
```bash
  git clone https://github.com/Fabriciope/php-project-structure.git <project-name>
  git checkout php-fpm_with_nginx
  cd <project-name>
```
<br>

## 🛠️ Alterações a se fazer antes de iniciar

### Mudar nome do projeto
Após clonar o repositório faça uma pesquisa geral nos arquivos pela ocorrência do texto `project-name` e troque pelo nome que deseja do seu respectivo projeto.

### ⚙️ Configurações
Perceba que há duas pastas na raiz do repositório que iniciam com `build.*` e têm os sufixos `dev` e `prod` que são utilizadas para configurar os ambientes de desenvolvimento e produção respectivamente. 
> 💡 **Obs:** <br>
>  Caso queira editar as configurações do php.ini ou do php-fpm.conf faça essas adições nos respectivos arquivos "overrides" dentro de `build.<ambiente>/php-fpm`. Para o php.ini o arquivo "override" foi nomeado como `99-overrides.ini` e para o php-fpm.conf o `php-fpm-overrides.conf` será utilizado.

<br>

## 🧾 Logs
Rodar código abaixo para dar as permissões necessárias para que os logs funcionem corretamente.
```bash
  chmod 666 logs/nginx/* && \
  chmod 666 logs/php-fpm/*
```
<br>

<hr>

## 🏗️ Subir projeto
Há dois arquivos na raiz do projeto, um `docker-compose.dev.yml` e outro chamado `docker-compose.prod.yml`, cada um usado para configurar seu respectivo ambiente. O `docker-compose.dev.yml` usará a pasta [build.dev](https://github.com/Fabriciope/php-project-structure/tree/php-fpm_with_nginx/build.dev) como base para subir os serviços, além de outras configurações, e o mesmo funciona para o arquivo `docker-compose.prod.yml` que irá usar a pasta [build.prod](https://github.com/Fabriciope/php-project-structure/tree/php-fpm_with_nginx/build.prod).

Para escolher o ambiente que vai ser usado ao subir os serviços basta alterar o arquivo de configuração que será utilizado ao rodar o comando `docker compose up`:
```bash
  docker compose --file docker-compose.<ambiente>.yml up --build
```

Agora acesse o projeto localmente em seu navegador via url http://127.0.0.1:80/

<br><br>

## 🤝 Contribuindo

Contribuições são sempre bem-vindas :)
<br>

## License
[MIT](https://choosealicense.com/licenses/mit/)
