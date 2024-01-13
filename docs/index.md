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

### Boas práticas de commit

1) Commits atômicos: evite dar `git add .`

A prática de criar commits atômicos consiste em criar um commit para cada modificação no projeto, por exemplo, vamos imaginar que estamos trabalhando em um projeto e fizemos duas ações:
- criamos um novo componente
- fizemos alterações em um já existente

Em vez de criarmos um único commit para guardar as alterações que fizemos, faremos dois commits, seguindo um padrão de commits atômicos. O primeiro commit será com os arquivos envolvidos na criação do novo componente, e o segundo com as alterações feitas em um componente já existente.

Dessa maneira conseguimos escrever uma mensagem mais descritiva para o commit, as ações na linha do tempo ficam mais descritivas e é mais prático navegar pelos commits visualizando as modificações. Na ocorrência de um bug no projeto, é bem mais fácil de encontrar em qual commit ele foi inserido e reverter o que foi feito.

2) Padronização dos commits
   
Outra prática muito importante e que está ligada a anterior é a padronização das mensagens dos commits, dessa maneira seguimos uma estrutura na hora de escrevermos as mensagens, o que deixa os commits estruturados e padronizados.

#### Exemplos para feat (novas funcionalidades ou adições):

Adicionando uma nova funcionalidade a um script Python:
feat(script): adicionar capacidade de processamento de dados em batch no process_data.py
feat(api): implementar nova rota de autenticação no server.py
Adicionando novos componentes em um projeto frontend:
feat(frontend): adicionar novo componente de slider na homepage
feat(ui): introduzir botão de compartilhamento social no post_view.jsx
Incluindo scripts de automação ou utilitários:
feat(utils): adicionar script para limpeza automática de logs
feat(automation): criar ferramenta de deployment automatizado
Expandindo funcionalidades de um aplicativo móvel:
feat(mobile): implementar notificações push para iOS
feat(app): adicionar suporte para tema escuro

#### Exemplos para fix (correções de bugs ou problemas):
Corrigindo um bug em um script Python:
fix(parser): corrigir erro de parsing de datas no import_data.py
fix(api): resolver falha na autenticação em casos específicos no auth.py
Resolvendo problemas de interface de usuário:
fix(frontend): ajustar layout quebrado em telas pequenas na homepage.css
fix(ui): corrigir cor de texto ilegível no modo escuro em settings.css
Correções em scripts de automação ou utilitários:
fix(build): resolver dependência faltante no script de build
fix(deploy): corrigir caminho de acesso no script de deployment
Correções de bugs em aplicativos móveis:
fix(mobile): corrigir crash ao abrir notificações no Android
fix(app): resolver problema de sincronização de dados em background

Lembrando que é importante que a mensagem do commit seja clara e descreva especificamente o que foi alterado e por que a alteração foi necessária. Isso ajuda outros colaboradores do projeto a entender o contexto e o propósito das mudanças feitas.

#### Mudanças no .gitignore
Quando você está adicionando algo ao .gitignore:
chore(gitignore): adicionar arquivos de log
chore(gitignore): ignorar arquivos de ambiente virtual
Quando você está removendo algo do .gitignore:
chore(gitignore): remover entradas obsoletas
chore(gitignore): permitir arquivos de configuração de IDE

#### Mudanças no pyproject.toml
Para atualizações de dependências:
build(deps): atualizar dependências
fix(deps): corrigir versões de dependências para compatibilidade
Para adicionar novas dependências:
feat(deps): adicionar biblioteca requests
feat(deps): incluir pytest para testes
Para mudanças na configuração do projeto:
build(pyproject): configurar ferramentas de linting
build(pyproject): ajustar configurações de empacotamento


#### Explicando os Prefixos:
feat: Uma nova funcionalidade para o usuário, não uma nova funcionalidade para scripts de build.
fix: Correção de bug para o usuário, não uma correção para scripts de build.
build: Mudanças que afetam o sistema de build ou dependências externas (exemplo: scopes: gulp, broccoli, npm).
chore: Atualizações no processo de build, alterações em ferramentas auxiliares e bibliotecas como documentação gerada.
Esses prefixos ajudam a categorizar o tipo de mudança que está sendo feita, tornando mais fácil para outros desenvolvedores entenderem rapidamente o impacto de cada commit no projeto.

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
