#!/bin/bash
# mount.sh - Montagem SSHFS (Orbit-dir)

orbit_dir() {
    local MOUNT_POINT="${ORBIT_MOUNT_POINT:-/home/d3xt4rz/Projects/Orbit/MyVPS}"
    local REMOTE="${ORBIT_REMOTE:-root@209.50.241.196:/root/Home}"
    local PORT="${ORBIT_PORT:-22}"
    local ACTION="$1"

    case "$ACTION" in
        start)
            _orbit_log INFO "Verificando montagem existente..."
            if mount | grep -q "$MOUNT_POINT"; then
                _orbit_log WARN "Pasta já está montada em $MOUNT_POINT"
                return 0
            fi
            
            _orbit_log INFO "Criando ponto de montagem: $MOUNT_POINT"
            mkdir -p "$MOUNT_POINT" 2>/dev/null || {
                _orbit_log ERROR "Falha ao criar diretório: $MOUNT_POINT"
                return 1
            }
            
            _orbit_log INFO "Montando $REMOTE → $MOUNT_POINT"
            if sshfs "$REMOTE" "$MOUNT_POINT" -p "$PORT"; then
                _orbit_log SUCCESS "Montagem concluída com sucesso"
                _orbit_log INFO "Pasta disponível em: $MOUNT_POINT"
            else
                _orbit_log ERROR "Falha na montagem. Verifique a conexão SSH e o caminho remoto."
                return 1
            fi
            ;;
            
        kill)
            _orbit_log INFO "Verificando montagem..."
            if mount | grep -q "$MOUNT_POINT"; then
                _orbit_log INFO "Desmontando $MOUNT_POINT..."
                if fusermount -u "$MOUNT_POINT" 2>/dev/null || umount "$MOUNT_POINT" 2>/dev/null; then
                    _orbit_log SUCCESS "Montagem finalizada com sucesso"
                else
                    _orbit_log ERROR "Falha ao desmontar. A pasta pode estar em uso."
                    _orbit_log WARN "Tente fechar programas que estejam usando $MOUNT_POINT"
                    return 1
                fi
            else
                _orbit_log WARN "A pasta não está montada"
            fi
            ;;
            
        status)
            if mount | grep -q "$MOUNT_POINT"; then
                _orbit_log SUCCESS "Montado em $MOUNT_POINT"
                local mount_info=$(df -h "$MOUNT_POINT" 2>/dev/null | tail -1)
                if [[ -n "$mount_info" ]]; then
                    echo -e "  ${ORBIT_COLOR_GRAY}Size: $(echo $mount_info | awk '{print $2}')  Used: $(echo $mount_info | awk '{print $3}')  Avail: $(echo $mount_info | awk '{print $4}')  Use%: $(echo $mount_info | awk '{print $5}')${ORBIT_COLOR_RESET}"
                fi
            else
                _orbit_log ERROR "Não montado"
            fi
            ;;
            
        *)
            echo ""
            echo -e "${ORBIT_COLOR_CYAN}Orbit-dir - Gerenciador de montagem SSHFS${ORBIT_COLOR_RESET}"
            echo -e "${ORBIT_COLOR_GRAY}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${ORBIT_COLOR_RESET}"
            echo ""
            echo -e "${ORBIT_COLOR_YELLOW}Uso:${ORBIT_COLOR_RESET}"
            echo -e "  ${ORBIT_COLOR_GREEN}orbit dir start${ORBIT_COLOR_RESET}   - Monta a pasta remota"
            echo -e "  ${ORBIT_COLOR_GREEN}orbit dir kill${ORBIT_COLOR_RESET}    - Desmonta a pasta remota"
            echo -e "  ${ORBIT_COLOR_GREEN}orbit dir status${ORBIT_COLOR_RESET}  - Verifica o status da montagem"
            echo ""
            echo -e "${ORBIT_COLOR_GRAY}Ponto de montagem: ${ORBIT_COLOR_RESET}$MOUNT_POINT"
            echo -e "${ORBIT_COLOR_GRAY}Remoto:          ${ORBIT_COLOR_RESET}$REMOTE"
            echo ""
            return 1
            ;;
    esac
}