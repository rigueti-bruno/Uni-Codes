# 🔧 Configuração do PostgreSQL no Windows para WSL

## ❌ Problema Identificado
O PostgreSQL no Windows não está aceitando conexões externas do WSL.

**Erro:** `Connection refused` na porta 5432 ao tentar conectar de `10.255.255.254`

---

## ✅ Solução - Passo a Passo

### 1️⃣ Localizar os arquivos de configuração

Os arquivos ficam geralmente em:
```
C:\Program Files\PostgreSQL\<versão>\data\
```

Ou você pode descobrir executando no **PowerShell**:
```powershell
psql -U postgres -c "SHOW config_file;"
```

---

### 2️⃣ Editar `postgresql.conf`

**Abra como Administrador:** `C:\Program Files\PostgreSQL\16\data\postgresql.conf`

**Procure pela linha:** (geralmente linha 59)
```conf
#listen_addresses = 'localhost'
```

**Altere para:**
```conf
listen_addresses = '*'
```

💡 **Dica:** Remova o `#` no início e troque `'localhost'` por `'*'`

---

### 3️⃣ Editar `pg_hba.conf`

**Abra como Administrador:** `C:\Program Files\PostgreSQL\16\data\pg_hba.conf`

**Adicione no final do arquivo:**
```conf
# Conexões do WSL
host    all             all             10.255.255.0/24         md5
```

💡 **Explicação:**
- `host` = tipo de conexão TCP/IP
- `all` = todos os bancos
- `all` = todos os usuários
- `10.255.255.0/24` = rede do WSL
- `md5` = autenticação por senha

---

### 4️⃣ Liberar o Firewall do Windows

**Opção A - Via Interface Gráfica:**
1. Abra "Firewall do Windows Defender com Segurança Avançada"
2. Clique em "Regras de Entrada" → "Nova Regra"
3. Tipo: **Porta**
4. Protocolo: **TCP**, Porta: **5432**
5. Ação: **Permitir a conexão**
6. Perfis: Marque todos
7. Nome: `PostgreSQL WSL`

**Opção B - Via PowerShell (como Administrador):**
```powershell
New-NetFirewallRule -DisplayName "PostgreSQL WSL" -Direction Inbound -Protocol TCP -LocalPort 5432 -Action Allow
```

---

### 5️⃣ Reiniciar o PostgreSQL

**Opção A - Via Serviços (services.msc):**
1. Pressione `Win + R` → digite `services.msc`
2. Encontre `postgresql-x64-16` (ou sua versão)
3. Clique com botão direito → **Reiniciar**

**Opção B - Via PowerShell (como Administrador):**
```powershell
# Verificar nome do serviço
Get-Service | Where-Object {$_.DisplayName -like "*PostgreSQL*"}

# Reiniciar (ajuste o nome se necessário)
Restart-Service postgresql-x64-16
```

---

### 6️⃣ Verificar se a senha está correta

No **pgAdmin** ou **psql** no Windows, verifique/defina a senha:
```sql
ALTER USER postgres WITH PASSWORD 'admin123';
```

---

### 7️⃣ Testar a conexão do WSL

No WSL, execute:
```bash
cd "/home/bruno/Uni-Codes/Periodo 5-1/Comunicação entre Aplicações/Tema 5 - Web Services em Python/RestfulAPI"
./venv/bin/python curso/test_connection.py
```

**Resultado esperado:**
```
============================================================
TESTE DE CONEXÃO COM POSTGRESQL
============================================================

1. Importando módulos...
   ✓ Módulos importados com sucesso

2. Tentando conectar ao banco de dados...
   URL de conexão: postgresql://postgres:***@10.255.255.254/curso
   ✓ Conexão estabelecida!

3. Testando query no banco...
   ✓ Query executada! Encontrados X temas

============================================================
✓ TESTE CONCLUÍDO COM SUCESSO!
============================================================
```

---

## 🚀 Após a configuração

1. **Iniciar o servidor Flask:**
```bash
cd "/home/bruno/Uni-Codes/Periodo 5-1/Comunicação entre Aplicações/Tema 5 - Web Services em Python/RestfulAPI"
./venv/bin/python curso/cursoapp.py
```

2. **Em outro terminal, executar o teste:**
```bash
./venv/bin/python curso/teste_curso.py
```

---

## 🔍 Troubleshooting

### Erro: Connection refused
- ✅ Verificou se o PostgreSQL está rodando no Windows?
- ✅ Editou e salvou os arquivos `.conf` corretamente?
- ✅ Reiniciou o serviço PostgreSQL?
- ✅ Liberou a porta 5432 no firewall?

### Testar conectividade do WSL:
```bash
# Testar ping
ping -c 2 10.255.255.254

# Testar porta 5432
nc -zv 10.255.255.254 5432
```

Se a porta 5432 não responder, o problema é na configuração do Windows.

---

## 📝 Notas Importantes

- ⚠️ Sempre edite os arquivos `.conf` **como Administrador**
- ⚠️ Sempre **reinicie o PostgreSQL** após editar as configurações
- ⚠️ O IP `10.255.255.254` é o gateway do WSL para o Windows
- 💡 Para produção, considere configurações de segurança mais restritivas
