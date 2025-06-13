Estrutura nginx com php-fpm utilizando docker para projetos web php.
<br><br>

Primeiro de tudo clone o projeto e troque para a branch correta.
```bash
  git clone https://github.com/Fabriciope/php-project-structure.git project-name
  git checkout nginx_php-fpm/development
  cd project-name
```
<br>

## Logs
Rodar código abaixo para dar as permissões necessárias para que os logs funcionem.
```bash
  chmod 666 logs/nginx/*
  chmod 666 logs/php-fpm/*
```
<br>
<hr>

Antes de iniciar o container fazer uma pesquisa geral na estrutura e trocar todas as ocorrências de `project-name` pelo nome do respectivo projeto.
Estes são os arquivos onde deve ocorrer a troca e as respectivas linhas:
| Arquivo    | Linhas | Descrição |
| -------- | ------- | ------- |
| build/nginx/nginx.conf  | 7    | Local dos logs de erro do nginx. |
| build/nginx/site.conf | 6 e 17     | Diretório root do projeto e local dos logs de acesso ao nginx. |
| build/php-fpm/99-overrides.ini    | 1    | Definição da configuração `error_log` (logs do php) |
| build/php-fpm/Dockerfile    | 11    | Definição da diretiva `WORKDIR` |
| build/php-fpm/php-fpm.conf    | 26    | Definição da configuração `error_log` (logs do php-fpm) |
| build/php-fpm/www.conf    | 297    | Definição da configuração `access.log` (logs de acesso ao php-fpm) |
| docker-compose.yml    | 9, 11, 25, 27 e 30    | Algumas definições de build do docker como volumes e network |

<br>


## Subir projeto
Para rodar o projeta execute o comando abaixo.
```bash
  docker compose up --build
```

Agora acesse o projeto localmente em seu navegador via url http://127.0.0.1:8000/

<br><br>

## Contribuindo

Contribuições são sempre bem-vindas :)
<br>

## License
[MIT](https://choosealicense.com/licenses/mit/)
