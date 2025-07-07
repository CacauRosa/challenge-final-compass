# 🧪 Testes Automatizados de API

Este diretório contém os testes automatizados da API da aplicação Cinema App, desenvolvidos com Robot Framework.

O foco dos testes é validar os principais endpoints da aplicação com base nos critérios de aceitação e documentação Swagger das funcionalidades propostas.

---

## ⚙️ Pré-requisitos

Certifique-se de que a aplicação backend está em execução na porta correta (por padrão `http://localhost:3000` ou conforme `.env`).

---

## ▶️ Executando os testes

Execute todos os testes da API:

```bash
robot api/tests
```

Ou um arquivo específico:

```bash
robot api/tests/test_movies.robot
```

---

Para mais detalhes sobre o projeto como um todo, consulte o [README principal](../README.md).
