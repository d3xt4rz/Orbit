```
Orbit
```

### **Descrição curta (máx. 160 caracteres)**
```
Orbit - Ferramenta CLI para montagem remota via SSHFS e conexão SSH rápida, com menu interativo e logs coloridos.
```

### **Tópicos (tags)**
```
sshfs, ssh, remote-mount, bash, cli, terminal, linux, sysadmin, devops, remote-access
```

### **Badges (opcional, para enfeitar)**
- `![License](https://img.shields.io/badge/license-MIT-blue)`
- `![Bash](https://img.shields.io/badge/shell-bash-green)`
- `![Version](https://img.shields.io/badge/version-1.0.0-orange)`

---

## 📄 README.md (completo)

Crie um arquivo `README.md` na raiz do projeto com o seguinte conteúdo:

```markdown
# Orbit 🚀

> Ferramenta CLI para montagem remota via SSHFS e conexão SSH rápida, com menu interativo e logs coloridos.

![License](https://img.shields.io/badge/license-MIT-blue)
![Bash](https://img.shields.io/badge/shell-bash-green)
![Version](https://img.shields.io/badge/version-1.0.0-orange)

---

## ✨ Funcionalidades

- **Montagem remota** com SSHFS (`dir start`, `dir kill`, `dir status`)
- **Conexão SSH** rápida para o servidor configurado
- **Menu interativo** com navegação por setas
- **Logs coloridos** com timestamps e níveis (INFO, SUCCESS, WARN, ERROR)
- **Configuração personalizável** via arquivo `orbit.conf`
- **Instalação simples** com `make install`

---

## 📦 Instalação

### 1. Clone o repositório

```bash
git clone https://github.com/seu-usuario/Orbit.git
cd Orbit
```

### 2. Instale com Make

```bash
make install
```

O comando acima:
- Copia os arquivos para `~/.local/share/orbit`
- Adiciona o diretório `bin` ao seu `PATH` no `.zshrc` ou `.bashrc`
- Torna o comando `Orbit` disponível imediatamente

### 3. Recarregue o shell (se necessário)

```bash
source ~/.zshrc   # ou source ~/.bashrc
```

Agora você pode executar:

```bash
Orbit
```

---

## 🖥️ Como usar

### Menu interativo

Ao executar `Orbit` sem argumentos, um menu interativo será aberto:

```
██████╗ ██████╗ ██████╗ ██╗████████╗
██╔═══██╗██╔══██╗██╔══██╗██║╚══██╔══╝
██║   ██║██████╔╝██████╔╝██║   ██║   
██║   ██║██╔══██╗██╔══██╗██║   ██║   
╚██████╔╝██║  ██║██████╔╝██║   ██║   
 ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝   ╚═╝   
Orbit - Ferramenta de gerenciamento remoto
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Subcomandos:
  ssh          - Conecta via SSH
  dir start    - Monta a pasta remota
  dir kill     - Desmonta a pasta remota
  dir status   - Verifica status da montagem
  help         - Exibe esta ajuda
  Sair
```

Navegue com as setas ⬆ ⬇ e pressione **Enter** para executar.

### Modo direto (com argumentos)

```bash
Orbit ssh                # Conecta via SSH
Orbit dir start          # Monta a pasta remota
Orbit dir kill           # Desmonta a pasta remota
Orbit dir status         # Verifica status
Orbit help               # Exibe ajuda
```

---

## ⚙️ Configuração

Edite o arquivo de configuração:

```bash
~/.local/share/orbit/conf/orbit.conf
```

Exemplo:

```ini
ORBIT_MOUNT_POINT="/home/usuario/Projects/MyVPS"
ORBIT_REMOTE="root@192.168.1.100:/root/Home"
ORBIT_PORT=22

ORBIT_SSH_HOST="192.168.1.100"
ORBIT_SSH_PORT=22
ORBIT_SSH_USER="root"
```

---

## 🛠️ Dependências

- `sshfs` – para montagem remota
- `ssh` – para conexão SSH
- `tput` – para cores no terminal (geralmente já instalado)

Instale o `sshfs` (Debian/Ubuntu):

```bash
sudo apt install sshfs
```

---

## 📂 Estrutura do projeto

```
Orbit/
├── Makefile
├── README.md
├── bin/
│   └── orbit
├── lib/
│   ├── core.sh
│   ├── mount.sh
│   └── ssh.sh
└── conf/
    └── orbit.conf
```
