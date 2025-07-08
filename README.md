Estrutura nginx com php-fpm utilizando docker para projetos web php.
<br><br>

Primeiro de tudo clone o projeto e troque para a branch correta.
```bash
  git clone https://github.com/Fabriciope/php-project-structure.git <project-name> && \
  cd <project-name> && \
  git checkout php-fpm_with_nginx && \
  rm -r .git
```
<br>

## 🛠️ Alterações a se fazer antes de iniciar

### Mudar nome do projeto
Após clonar o repositório faça uma pesquisa geral nos arquivos pela ocorrência do texto `project-name` e troque pelo nome que deseja do seu respectivo projeto.
<!-- TODO: adicionar uma tabela listando quais linhas em quais arquivos essa alteração deve ser feito ( com descrição) -->

### ⚙️ Configurações
Há duas pastas dentro da diretório docker (development e production) que são utilizadas para configurar os ambientes de desenvolvimento e produção respectivamente. 
> 💡 **Obs:** <br>
>  Caso queira editar as configurações do php.ini, php-fpm.conf ou www.conf faça essas adições nos respectivos arquivos "overrides" dentro de `docker/<ambiente>/php-fpm/`. Para o php.ini o arquivo "override" foi nomeado como `99-overrides.ini` e para o php-fpm.conf e www.conf o `php-fpm-overrides.conf` será utilizado.

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
Cada ambiente está separado dentro das pastas `docker/development` e `docker/production`, dentro de cada uma há o arquivo docker-compose.yml que será utilizado para subir os serviços com base nos arquivos de configuração que estão dentro da mesma pasta.

Para escolher o ambiente que vai ser usado ao subir os serviços basta alterar o arquivo de configuração que será utilizado ao rodar o comando `docker compose up`:
```bash
  docker compose --file docker/<ambiente>/docker-compose.yml up --build
```

Agora acesse o projeto localmente em seu navegador via url http://127.0.0.1:80/

> ⚠️ **Obs:** quando "derrubar" os serviços, ao rodar o comando `docker compose down`, não se esqueça de usar a flag `--file` ou `-f` para especificar o `docker-compose.yml` que foi utilizado para subir os serviços.

<br><br>

## 🤝 Contribuindo

Contribuições são sempre bem-vindas :)
<br>

## License
[MIT](https://choosealicense.com/licenses/mit/)
