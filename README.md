# 🎬 Challenge Final - Cinema App

Este repositório contém o projeto desenvolvido como parte do Challenge Final da trilha de QA da Compass UOL, com foco na automação de testes aplicando o conteúdo estudado ao longo do programa. O objetivo principal foi validar o funcionamento da aplicação de um sistema de cinema, tanto em sua API quanto na interface web, utilizando técnicas de planejamento de testes e execução automatizada com Robot Framework.

## 📖 Índice

[🎬 Sobre o Projeto](#-sobre-o-projeto) | [📁 Estrutura do Repositório](#-estrutura-do-repositório) |[⚙️ Como Configurar e Executar](#️-como-configurar-e-executar) | [▶️ Executar os Testes](#️-executar-os-testes) | [🧠 Análise Aplicada](#-análise-aplicada) | [🤝 Colaboração e Créditos](#-colaboração-e-créditos) | [✅ Conclusão](#-conclusão) | [👤 Apresentação Pessoal](#-apresentação-pessoal)

## 📌 Sobre o projeto
O projeto tem como objetivo planejar, documentar e implementar testes funcionais para validar as funcionalidades do sistema de gerenciamento de cinema. A aplicação da API Cinema App se encontra nos seguintes repositórios:
- [Front-end](https://github.com/juniorschmitz/cinema-challenge-front)  
- [Back-end](https://github.com/juniorschmitz/cinema-challenge-back)

## 💾 Documentos do Projeto

`docs/`
- Plano de Testes
- Relatório de erros e melhorias
- Mapa Mental da Aplicação

`api/`
- Arquivos de testes automatizados da API

`web/`
- Arquivos de testes automatizados da interface web

---

## 📚 Estrutura do Repositório

```
📁 docs/                → Documentação (análise, mapa mental, planejamento)
📁 tests/               → Casos de teste automatizados com Robot Framework
📁 resources/           → Arquivos de apoio aos testes (ex: arquivos .csv, dados simulados)
📁 pages/               → PageObjects e lógicas reutilizáveis
📁 logs/                → Relatórios de execução
📄 requirements.txt     → Dependências do projeto
📄 README.md            → Documentação principal
```

---

## ⚙️ Como Configurar e Executar

### ✅ Pré-requisitos

- Python 3.10+
- Robot Framework
- Git

### 🚀 Instalação e execução

#### Backend
Clone o repositório:
```bash
git clone https://github.com/juniorschmitz/cinema-challenge-back.git
```

Acesse a pasta
```bash
cd [caminho onde repositório foi clonado]
```

Instale dependências
```bash
npm install
```

Configure variáveis de ambiente

Crie um arquivo `.env` com as seguintes variáveis:
```
PORT=3000                       #ou a que preferir
MONGODB_URI=[banco de dados]
JWT_SECRET=seu_jwt_secret_aqui
```
Alimente o banco de dados
```bash
npm run seed
```
> ⚠️ **Importante:** É necessário alimentar o banco de dados para que os testes automatizados funcionem corretamente!

Iniciar:
```bash
# Modo de produção
npm start

# Modo de desenvolvimento
npm run dev
```

#### Frontend
Clone o repositório:
```bash
git clone https://github.com/juniorschmitz/cinema-challenge-front
```

Acesse a pasta
```bash
cd [caminho onde repositório foi clonado]
```

Instale dependências
```bash
npm install
# ou
yarn
```
Iniciar:
```bash
# Modo de produção
npm start
# ou
yarn start

```
### ▶️ Executar os testes automatizados
> 🔄 **Importante**: Antes de executar os testes, certifique-se de que o **servidor back-end está ativo** (porta 3000 ou a configurada no `.env`).

Clone o repositório:
```bash
git clone https://github.com/CacauRosa/challenge-final-compass.git
```
Acesse a pasta
```bash
cd [caminho onde repositório foi clonado]
```
Instale dependências
```bash
pip install -r requirements.txt
```
Executar no VSCode ou outra de sua escolha
```bash
# Executar todos os testes
robot tests/
```
---

## 🧠 O que foi feito

- Planejamento com foco em testes manuais e automatizados de APIs e front-end
- Casos pensados para cobrir cenários reais do fluxo de um cinema
- Uso de PageObjects para garantir boas práticas
- Validações aplicadas com dados dinâmicos e simulados
- Estrutura limpa e modularizada para facilitar manutenção

---

## 🤝 Colaboração e Créditos

Dono da aplicação Cinema App: 
- [Jacques Schmitz](https://github.com/juniorschmitz)

Aos meus colegas de squad que me ajudaram com dúvidas durante o projeto:
- [Anna Beatriz Santoro](https://github.com/annasantoro-glitch) 
- [Ádony Lagares](https://github.com/adony-lagares)    
- [Marcos Paulo](https://github.com/Marcosdev03)


---

## ✅ Conclusão

Este projeto reflete a aplicação prática dos conhecimentos adquiridos sobre:

- Planejamento de testes
- Criação de cenários funcionais
- Testes manuais
- Automação com Robot Framework
- Análise e cobertura de testes
- Documentação de bugs e melhorias

---

## 👤 Apresentação Pessoal


Me chamo Ana Carolina Corrêa Rosa, tenho 19 anos e atualmente curso:
- Análise e Desenvolvimento de Sistemas (3º semestre - UniCesumar)
- Ciência e Tecnologia (2º semestre - UFABC)

Resido em Santo André/SP. Tenho olhos castanhos, cabelos castanhos tingidos de vermelho e pele branca.  
Na apresentação, estarei vestindo moletom cinza.

---