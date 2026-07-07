#!/bin/bash
# ssh.sh - Conexão SSH rápida

orbit_ssh() {
    local HOST="${ORBIT_SSH_HOST:-209.50.241.196}"
    local PORT="${ORBIT_SSH_PORT:-22}"
    local USER="${ORBIT_SSH_USER:-root}"

    ssh "${USER}@${HOST}" -p "$PORT"
    return $?
}