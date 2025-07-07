# 🎮 Challenge Final - Cinema App

Este repositório reúne o projeto desenvolvido como parte do Challenge Final da trilha de QA da Compass UOL. O objetivo principal foi validar o funcionamento da aplicação de um sistema de cinema — tanto em sua API quanto na interface web — aplicando técnicas de planejamento, implementação e execução de testes automatizados com Robot Framework.

---

## 📖 Índice

- [📌 Sobre o Projeto](#-sobre-o-projeto)
- [📋 Estrutura do Repositório](#-estrutura-do-repositório)
- [⚙️ Como Configurar e Executar](#️-como-configurar-e-executar)
- [▶️ Executar os Testes](#️-executar-os-testes)
- [🧠 O que foi feito](#-o-que-foi-feito)
- [✅ Conclusão](#-conclusão)
- [👤 Sobre mim](#-sobre-mim)
- [🤝 Colaboração e Créditos](#-colaboração-e-créditos)

---

## 📌 Sobre o Projeto

O projeto tem como objetivo planejar, documentar e implementar testes funcionais para validar as funcionalidades do sistema de gerenciamento de cinema. Os testes cobrem tanto a API quanto a interface web, simulando fluxos reais de uso e garantindo o correto funcionamento das funcionalidades principais.

### 🔗 Aplicações utilizadas:

- [Frontend da aplicação](https://github.com/juniorschmitz/cinema-challenge-front)
- [Backend da aplicação](https://github.com/juniorschmitz/cinema-challenge-back)

---

## 📋 Estrutura do Repositório

```text
📁 docs/                → Documentação geral (plano de testes, relatório de erros, collection do Postman, etc.)
📁 resources/           → Dados simulados e arquivos de apoio aos testes (/api e /web)
📁 tests/               → Casos de teste automatizados com Robot Framework (/api e /web)
📁 pages/               → PageObjects e lógicas reutilizáveis para os testes web
📁 lib/                 → Bibliotecas Python personalizadas (keywords, conexão com banco de dados)
📁 logs/                → Relatórios de execução de testes (/api e /web)
📄 requirements.txt     → Lista de dependências do projeto
📄 README.md            → Este documento
```

---

## ⚙️ Como Configurar e Executar

### ✅ Pré-requisitos

* Python 3.10+
* Node.js + npm
* Git
* Robot Framework
* Chrome ou navegador compatível
* Instalar dependências listadas no `requirements.txt`
* Executar aplicação em ambiente local

---

### 🚀 Instalação e execução da aplicação

#### 🔧 Backend

```bash
git clone https://github.com/juniorschmitz/cinema-challenge-back.git
cd <caminho onde repositório foi clonado>
npm install
```

Crie o arquivo `.env` com:

```env
PORT=3000
MONGODB_URI=<sua URI de conexão MongoDB>
JWT_SECRET=<seu jwt secret>
```

Alimente o banco de dados:

```bash
npm run seed
```
> ⚠️ **Importante:** É necessário alimentar o banco de dados para que os testes automatizados funcionem corretamente!

Inicie a aplicação:

```bash
# Modo produção
npm start

# Modo desenvolvimento
npm run dev
```

#### 🎨 Frontend

```bash
git clone https://github.com/juniorschmitz/cinema-challenge-front.git
cd <caminho onde repositório foi clonado>
npm install
npm start
```

---

## ▶️ Executar os Testes Automatizados

> ⚠️ Certifique-se de que o back-end esteja ativo na porta correta (`3000` ou conforme `.env`).

Clone este repositório de testes:

```bash
git clone https://github.com/CacauRosa/challenge-final-compass.git
cd <caminho onde repositório foi clonado>
```

Instale as dependências Python:

```bash
pip install -r requirements.txt
```

Execute os testes:

```bash
robot .
```

⚠️ Para mais informações importantes sobre os testes de api e de web, confira as pastas de cada uma no repositório.

---

## 🔗 Conexão com MongoDB Atlas

As keywords personalizadas para manipulação de dados utilizam `pymongo` com string de conexão no formato:

```
mongodb+srv://<usuário>:<senha>@<cluster>.mongodb.net/<nome-do-banco>?retryWrites=true&w=majority
```

Foram apontados os locais em que é necessário usar a URI de conexão MongoDB.

---

## 🧠 O que foi feito

- Planejamento de testes funcionais (API e UI)
- Casos pensados para cobrir cenários reais do fluxo de um cinema e garantir os críterios de aceitação das User Stories
- Validações aplicadas com dados dinâmicos e simulados
- Estrutura limpa e modularizada para facilitar manutenção

---

## ✅ Conclusão

Este projeto representa a aplicação prática dos conhecimentos adquiridos ao longo do programa, com foco em:

- Planejamento e documentação de testes
- Validação funcional de APIs e interfaces
- Automação com Robot Framework
- Análise de cobertura e relatórios de falhas
- Documentação de bugs e melhorias

---

## 👤 Sobre mim

Sou Ana Carolina Corrêa Rosa, estudante de Análise e Desenvolvimento de Sistemas (UniCesumar) e Ciência e Tecnologia (UFABC).

---

## 🤝 Colaboração e Créditos

Desenvolvedor da aplicação Cinema App:

- [Jacques Schmitz](https://github.com/juniorschmitz)

Agradecimentos especiais aos meus colegas de squad que me ajudaram com dúvidas durante o projeto:

- [Anna Beatriz Santoro](https://github.com/annasantoro-glitch)
- [Ádony Lagares](https://github.com/adony-lagares)
- [Marcos Paulo](https://github.com/Marcosdev03)

---s