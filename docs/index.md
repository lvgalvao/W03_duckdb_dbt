# Welcome to MkDocs

## Git e Github

Git e Github são ferramentas de versionamento de código. [Assista e esse vídeo](https://www.youtube.com/watch?v=6Czd1Yetaac) e [leia isso aqui](https://cli.github.com/manual/gh_repo_create) para entendermais sobre github e como instalar a CLI do Github.

Dessa forma conseguimos configurar nosso projeto com o comando 

```bash
gh repo create
```
## Pyenv

O Pyenv é uma ferramenta poderosa para gerenciar múltiplas versões do Python. Com ela, é possível instalar várias versões do Python e alternar entre elas de maneira flexível e eficiente. Isso é especialmente útil em projetos que exigem versões específicas do Python, garantindo compatibilidade e evitando conflitos. A instalação e o uso do Pyenv são simples, tornando a gestão de versões do Python uma tarefa descomplicada para desenvolvedores de todos os níveis.

Os principais comandos são:

```bash
pyenv versions
pyenv local 3.11.5
pyenv global 3.11.5
```

## Poetry (tipo PIP)

Poetry simplifica o gerenciamento de dependências e pacotes no Python, substituindo o PIP.
Os principais comandos são:

Inicia um novo projeto interativamente
```bash
poetry init
```
Inicia um novo projeto interativamente
```bash
poetry add [pacote]
```

Remove uma dependência do projeto.
```bash
poetry remove [pacote]
```

Ativa o ambiente virtual do projeto.
```bash
poetry shell
```

## Arquivo .gitignore e versionando o que temos até aqui

# Aquecimento

Crie um arquivo

- Git add
- Git commit
- Git push
- Git pull

Seu chefe mandou deletar

- Git rm

Seu chefe mandou voltar

- Git log
- Git revert

Adicionar arquivo CSV

- Git add
- Git commit

E agora?

Mudar o nome disso tudo

-  Git reset -hard
- Git rebase -i --root
- Git commit –amend
- Git rebase –continue

## Pre-commit
- check-yaml
- black (formatador) Nomes bonito-s
- check-added-large-files
- commitizen
  
```yaml
# .pre-commit-config.yaml

repos:
-   repo: https://github.com/pre-commit/pre-commit-hooks
   rev: v4.5.0
   hooks:
   -   id: check-yaml
-   repo: https://github.com/psf/black
   rev: 23.12.1
   hooks:
   -   id: black
-   repo: https://github.com/pre-commit/pre-commit-hooks
   rev: v4.5.0  # Use a versão mais recente
   hooks:
   -   id: check-added-large-files
       args: ['--maxkb=500']  # Define o tamanho máximo permitido 
-   repo: https://github.com/commitizen-tools/commitizen
   rev: v3.13.0
   hooks:
     - id: commitizen
       stages: [commit-msg]
```

## Mkdocs

### 1. Instalação do MkDocs

Primeiro, você precisa instalar o MkDocs. Como seu projeto usa Poetry para gerenciamento de dependências, você pode adicionar o MkDocs como uma dependência de desenvolvimento:

```bash
poetry add mkdocs --dev
```

Isso garantirá que o MkDocs seja instalado no ambiente virtual do seu projeto.

### 2. Configuração Inicial

Após a instalação, você pode criar um novo site de documentação com MkDocs:

```bash
poetry run mkdocs new .
```

Isso criará um novo arquivo `mkdocs.yml` e uma pasta `docs` no diretório raiz do seu projeto. O arquivo `mkdocs.yml` é usado para configurar seu site de documentação, enquanto a pasta `docs` conterá os arquivos Markdown da sua documentação.

### 3. Personalização da Configuração

Edite o arquivo `mkdocs.yml` para personalizar a configuração do seu site de documentação. Por exemplo:

```yaml
site_name: Nome do seu Projeto
nav:
    - Home: index.md
    - Sobre: about.md
```

### 4. Adicionando Conteúdo

Adicione ou edite arquivos Markdown na pasta `docs` para criar o conteúdo da sua documentação. Por exemplo, você pode começar editando `docs/index.md`.

### 5. Visualização Local

Para visualizar a documentação localmente, execute:

```bash
poetry run mkdocs serve
```

Isso iniciará um servidor local, e você poderá visualizar sua documentação navegando para `http://127.0.0.1:8000/` no seu navegador.

### 6. Construção do Site

Quando estiver pronto para construir o site da documentação, use:

```bash
poetry run mkdocs build
```

Isso gerará uma versão estática do seu site na pasta `site` que pode ser hospedada em qualquer servidor web.

### 7. Atualização do README

Não se esqueça de atualizar o README.md do seu projeto para incluir informações sobre a documentação e como visualizá-la ou construí-la localmente.

### 8. Commit e Push

Finalmente, faça commit das mudanças no seu repositório Git e faça push para o GitHub:

```bash
git add mkdocs.yml docs/
git commit -m "feat: adicionar mkdocs para documentação do projeto"
git push
```

### 9. Deploy

Agora faça o Deploy

```bash
mkdocs gh-deploy
```

## Project layout

    mkdocs.yml    # The configuration file.
    docs/
        index.md  # The documentation homepage.
        ...       # Other markdown pages, images and other files.
