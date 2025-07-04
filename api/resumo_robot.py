import os
import subprocess
import xmltodict

pasta_testes = "api/tests"          # pasta dos seus .robot
pasta_resultados = "api/logs"   # onde vai salvar os resultados
arquivo_output = os.path.join(pasta_resultados, "output.xml")

os.makedirs(pasta_resultados, exist_ok=True)

print("▶️ Rodando testes Robot Framework...")

# Executa o comando robot normalmente, output vai direto para o terminal
ret = subprocess.call(["robot", "-d", pasta_resultados, pasta_testes])

if ret != 0:
    print("⚠️ Alguns testes falharam ou houve erro na execução.")

with open(arquivo_output, encoding="utf-8") as f:
    xml = xmltodict.parse(f.read())

testes = []

def encontrar_ultima_keyword(test):
    if "kw" not in test:
        return None
    keywords = test["kw"]
    if not isinstance(keywords, list):
        keywords = [keywords]

    ultima_kw = None
    for kw in keywords:
        nome = kw.get("@name", "")
        status_info = kw.get("status", {})
        status = status_info.get("#text", status_info.get("@status", "UNKNOWN"))
        ultima_kw = (nome, status)
    return ultima_kw

def extrair_testes(suite, suite_nome=""):
    nome_suite = suite.get("@name", suite_nome)
    testes_encontrados = []

    if "test" in suite:
        for test in suite["test"]:
            nome_teste = test["@name"]
            status_info = test.get("status", {})
            status = status_info.get("#text", status_info.get("@status", "UNKNOWN"))
            mensagem = status_info.get("@message", "")

            kw_info = encontrar_ultima_keyword(test)
            testes_encontrados.append((nome_suite, nome_teste, status, mensagem, kw_info))
    
    if "suite" in suite:
        subsuites = suite["suite"]
        if not isinstance(subsuites, list):
            subsuites = [subsuites]
        for sub in subsuites:
            testes_encontrados.extend(extrair_testes(sub, nome_suite))

    return testes_encontrados

suites = xml["robot"]["suite"]
testes = []
if isinstance(suites, list):
    for suite in suites:
        testes.extend(extrair_testes(suite))
else:
    testes.extend(extrair_testes(suites))

total = len(testes)
falhas = [t for t in testes if t[2].upper() != "PASS"]
passaram = total - len(falhas)

print("\n📊 RESUMO DOS TESTES")
print(f"Total de testes: {total}")
print(f"✅ Passaram: {passaram}")
print(f"❌ Falharam: {len(falhas)}\n")

if falhas:
    print("🚨 DETALHES DAS FALHAS:")
    for suite, nome, status, msg, kw in falhas:
        print(f"\n📁 Arquivo/Suite: {suite}")
        print(f"🧪 Teste: {nome}")
        print(f"❌ Status: {status}")
        if msg:
            print(f"💬 Erro: {msg}")
        if kw:
            print(f"🔍 Última keyword executada: {kw[0]} (Status: {kw[1]})")
else:
    print("✅ Todos os testes passaram! 🎉")
