 Estrutura base para um ambiente php via cli com docker.

### Run

 ```bash
docker build . -t {{project-name}}
 ```
 and
 ```bash
docker run -it --name {{project-name}} -v .:/app project-name:latest
 ```

## License

[MIT](https://choosealicense.com/licenses/mit/)
