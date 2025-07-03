Estrutura nginx com php-fpm utilizando docker para projetos web php.
<br><br>

Primeiro de tudo clone o projeto e troque para a branch correta.
```bash
  git clone https://github.com/Fabriciope/php-project-structure.git project-name
  git checkout php-fpm_with_nginx
  cd project-name
```
<br>

## Alterações a se fazer antes de iniciar

### Mudar nome do projeto
Após clonar o repositório faça uma pesquisa geral nos arquivos pela ocorrência do texto `project-name` e troque pelo nome que deseja do seu respectivo projeto.

### Mudando de ambiente
Perceba que há duas pastas uma chamada build.dev e a outra build.prod que são utilizadas para configurar os ambientes de desenvolvimento e produção respectivamente. Para trocar o ambiente que vai ser usado ao subir os serviços dentro do docker-compose.yml basta alterar o volume no serviço web-server (nginx) `./build.{environment}/nginx/nginx.conf:/etc/nginx/conf.d/default.conf` e a diretiva dockerfile dentro de build no serviço php-fpm `build.{environment}/php-fpm`.
<br>

## Logs
Rodar código abaixo para dar as permissões necessárias para que os logs funcionem.
```bash
  chmod 666 logs/nginx/*
  chmod 666 logs/php-fpm/*
```
<br>

<hr>
Obs: caso queira editar as configurações do php.ini ou do php-fpm.conf faça essas adições nos respectivos arquivos "overrides" dentro de build.{environment}/php-fpm.
<hr>

## Subir projeto
Para rodar o projeto execute o comando abaixo.
```bash
  docker compose up --build
```

Agora acesse o projeto localmente em seu navegador via url http://127.0.0.1:80/

<br><br>

## Contribuindo

Contribuições são sempre bem-vindas :)
<br>

## License
[MIT](https://choosealicense.com/licenses/mit/)
