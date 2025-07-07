# 🎮 Challenge Final - Cinema App

Este repositório reúne o projeto desenvolvido como parte do Challenge Final da trilha de QA da Compass UOL. O objetivo principal foi validar o funcionamento da aplicação de um sistema de cinema — tanto em sua API quanto na interface web — aplicando técnicas de planejamento, implementação e execução de testes automatizados com Robot Framework. Os testes realizados simulam fluxos reais de uso e garantem o correto funcionamento das funcionalidades principais da aplicação.

---

## 📖 Índice

- [🔗 Aplicação Cinema App](#-aplicação-cinema-app)
- [⚙️ Como configurar e executar o ambiente](#️-como-configurar-e-executar-o-ambiente)
- [▶️ Executar os testes automatizados](#-executar-os-testes-automatizados)
- [🔗 Conexão com MongoDB Atlas](#-conexão-com-mongodb-atlas)
- [🧠 O que foi feito](#-o-que-foi-feito)
- [✅ Conclusão](#-conclusão)
- [👤 Sobre mim](#-sobre-mim)
- [🤝 Colaboração e créditos](#-colaboração-e-créditos)

---

## 🔗 Aplicação Cinema App:

- [Frontend da aplicação](https://github.com/juniorschmitz/cinema-challenge-front)
- [Backend da aplicação](https://github.com/juniorschmitz/cinema-challenge-back)

---

## ⚙️ Como configurar e executar o ambiente

### ✅ Pré-requisitos

- Python 3.10+
- Node.js + npm
- Git
- Robot Framework
- Chrome ou navegador compatível
- Instalar dependências listadas no `requirements.txt`
- Executar aplicação em ambiente local

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
⚠️ **Importante:** É necessário alimentar o banco de dados para que os testes automatizados funcionem corretamente!

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

## ▶️ Executar os testes automatizados

⚠️ Certifique-se de que o back-end esteja ativo na porta correta (`3000` ou conforme `.env`).

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

⚠️ Para mais informações importantes sobre a execução dos testes de api e de web, confira as pastas de cada um no repositório.

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

Sou Ana Carolina Corrêa Rosa, estudante de Análise e Desenvolvimento de Sistemas (UniCesumar) e Ciência e Tecnologia (UFABC). Atualmente, também sou estagiária de QA da Compass UOL.

---

## 🤝 Colaboração e créditos

Desenvolvedor da aplicação Cinema App:

- [Jacques Schmitz](https://github.com/juniorschmitz)

Agradecimentos especiais aos meus colegas de squad que me ajudaram com dúvidas durante o projeto:

- [Anna Beatriz Santoro](https://github.com/annasantoro-glitch)
- [Ádony Lagares](https://github.com/adony-lagares)
- [Marcos Paulo](https://github.com/Marcosdev03)

---