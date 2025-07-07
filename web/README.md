# 🖥️ Testes Automatizados de Interface Web

Este diretório contém os testes automatizados da interface web da aplicação Cinema App, desenvolvidos com Robot Framework.

O foco dos testes é validar os principais fluxos de uso da interface, garantindo que os elementos visuais e funcionais estejam de acordo com os critérios de aceitação das funcionalidades propostas.

---

## 📂 Pré-requisitos

Certifique-se de que a aplicação frontend está em execução na porta correta (`http://localhost:3002`).

---

## ▶️ Executando os testes

É necessário colocar seu URI de conexão MongoDB em `web/libs/database.py`:

```bash
client = MongoClient('<sua URI de conexão MongoDB>')
```

O nome do banco de dados precisa ser `cinemadb` ou ser alterado no mesmo arquivo anterior na linha:

```bash
db = client['cinemadb']
```

Caso a porta do frontend seja diferente de `http://localhost:3002`, altere em `web/resources/variables.resource`:

```bash
${URL_BASE}       http://localhost:3002
```

Execute todos os testes de interface:

```bash
robot -d web/logs web/tests
```

Ou um arquivo específico:

```bash
robot -d web/logs web/tests/auth.robot
```

---

Para mais detalhes sobre o projeto como um todo, consulte o [README principal](../README.md).
