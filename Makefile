# Makefile para Orbit - instalação minimalista

PREFIX ?= $(HOME)/.local/share/orbit

# Cores
COLOR_RESET  := $(shell tput sgr0 2>/dev/null || echo '\033[0m')
COLOR_GREEN  := $(shell tput setaf 2 2>/dev/null || echo '\033[0;32m')
COLOR_CYAN   := $(shell tput setaf 6 2>/dev/null || echo '\033[0;36m')
COLOR_GRAY   := $(shell tput setaf 7 2>/dev/null || echo '\033[0;90m')

HLINE := $(COLOR_GRAY)━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$(COLOR_RESET)

.PHONY: install

install:
	@# Banner
	@echo "$(COLOR_CYAN)██████╗ ██████╗ ██████╗ ██╗████████╗"
	@echo "██╔═══██╗██╔══██╗██╔══██╗██║╚══██╔══╝"
	@echo "██║   ██║██████╔╝██████╔╝██║   ██║   "
	@echo "██║   ██║██╔══██╗██╔══██╗██║   ██║   "
	@echo "╚██████╔╝██║  ██║██████╔╝██║   ██║   "
	@echo " ╚═════╝ ╚═╝  ╚═╝╚═════╝ ╚═╝   ╚═╝   $(COLOR_RESET)"
	@echo "Orbit - "
	@echo "$(HLINE)"
	@echo ""
	@# Instalação silenciosa
	@mkdir -p $(PREFIX)/bin $(PREFIX)/lib $(PREFIX)/conf
	@cp bin/orbit $(PREFIX)/bin/Orbit           # ← renomeia para "Orbit"
	@chmod +x $(PREFIX)/bin/Orbit
	@cp lib/*.sh $(PREFIX)/lib/
	@cp conf/orbit.conf $(PREFIX)/conf/
	@# Configura PATH (adiciona ao .zshrc/.bashrc se necessário)
	@SHELL_NAME=$$(basename $$SHELL); \
	RC_FILE=""; \
	case $$SHELL_NAME in \
	    zsh) RC_FILE="$$HOME/.zshrc" ;; \
	    bash) RC_FILE="$$HOME/.bashrc" ;; \
	    *) RC_FILE="";; \
	esac; \
	PATH_LINE="export PATH=\"$(PREFIX)/bin:\$$PATH\""; \
	if [ -n "$$RC_FILE" ] && [ -f "$$RC_FILE" ]; then \
	    if ! grep -Fxq "$$PATH_LINE" "$$RC_FILE" 2>/dev/null; then \
	        echo "$$PATH_LINE" >> "$$RC_FILE"; \
	    fi; \
	    export PATH="$(PREFIX)/bin:$$PATH"; \
	    source $$RC_FILE 2>/dev/null || true; \
	fi
	@# Mensagem final
	@echo "✨ $(COLOR_GREEN)Orbit está pronto para uso!$(COLOR_RESET)"
	@echo ""
	@echo "$(HLINE)"