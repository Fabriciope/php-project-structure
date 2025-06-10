## NOTE: branch nginx_php-fpm/production

Estrutura nginx com php-fpm utilizando docker para projetos web php.

### Logs
Rodar código abaixo para dar as permissões necessárias para que os logs funcionem.
```bash
  chmod 666 logs/nginx/*
  chmod 666 logs/php-fpm/*
```

Antes de iniciar o container fazer uma pesquisa geral na estrutura e trocar todas as ocorrências de `project-name` pelo nome do respectivo projeto.

### Subir projeto
Para rodar o projeta execute o comando abaixo.
```bash
  docker compose up --build
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
