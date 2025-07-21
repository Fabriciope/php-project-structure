<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="340" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>


Estrutura nginx com php-fpm utilizando docker para projetos [Laravel](https://laravel.com/).
<br><br>

É basicamente a brach [php-fpm_with_nginx](https://github.com/Fabriciope/php-project-structure/tree/php-fpm_with_nginx) adaptada para rodar um projeto laravel.
> 💡 **Obs:** leia a documentação da branch [php-fpm_with_nginx](https://github.com/Fabriciope/php-project-structure/tree/php-fpm_with_nginx) para entender como a estrutura funciona e quais as diferenças do que se deve fazer em cada uma.

Primeiro de tudo clone o projeto e troque para a branch correta.
```bash
  git clone https://github.com/Fabriciope/php-project-structure.git <project-name> && \
  cd <project-name> && \
  git checkout laravel && \
  rm -rf .git
```
<br>

## 🛠️ Alterações a se fazer antes de iniciar
Criar arquivo `.env`:
```bash
  cp .env.example .env
```

Gerar nova chave da aplicação:
```bash
  ./phartisan key:generate
```

Rodar migrations:
```bash
  ./phartisan migrate
```

### 🧾 Logs
Criar arquivos de logs dentro da strutura de pastas do laravel:
- `storage/logs/nginx/access.log`
- `storage/logs/nginx/error.log`
- `storage/logs/php-fpm/php-fpm.log`
- `storage/logs/php-fpm/www.access.log`
- `storage/logs/php-fpm/www.app.log`
- `storage/logs/php-fpm/www.app.xdebug_output`

 Em ambiente de desenvolvimento rodar código abaixo para dar as permissões necessárias para que os logs funcionem corretamente.
```bash
  chmod 666 storage/logs/nginx/* && \
  chmod 666 storage/logs/php-fpm/*
```
<br>

<hr>

## 🏗️ php artisan *
Para facilitar seu dia a dia ao trabalhar com os comandos `php artisan` dentro do container que roda o php-fpm, não será necessário entrar no container toda vez que quiser rodar um comando artisan, para resolver isso foi criado um script chamado `phartisan` na raiz do repositório que funciona para ambos os ambientes tanto `production` quanto `development`, para utilizar o comando basta chama-lo diretamente no terminal na raiz do projeto e passar o restante do comando artisan como argumento.

Primeiro dê permissão de execução para o script:
```bash
  chmod +x phartisan
```

Utilizando o script - Exemplo:
```bash
  ./phartisan about
```
Isto será o equivalente a ter executado o comando `php artisan about` dentro do container do php-fpm.

<br>

## 🤝 Contribuindo

Contribuições são sempre bem-vindas :)
<br>

## License
[MIT](https://choosealicense.com/licenses/mit/)

### Laravel license

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
