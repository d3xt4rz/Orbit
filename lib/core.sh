#!/bin/bash
# core.sh - Logging profissional do Orbit

readonly ORBIT_COLOR_RESET='\033[0m'
readonly ORBIT_COLOR_GREEN='\033[0;32m'
readonly ORBIT_COLOR_RED='\033[0;31m'
readonly ORBIT_COLOR_YELLOW='\033[0;33m'
readonly ORBIT_COLOR_BLUE='\033[0;34m'
readonly ORBIT_COLOR_CYAN='\033[0;36m'
readonly ORBIT_COLOR_GRAY='\033[0;90m'

_orbit_log() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%H:%M:%S')
    
    case "$level" in
        INFO)
            echo -e "${ORBIT_COLOR_GRAY}[${timestamp}]${ORBIT_COLOR_RESET} ${ORBIT_COLOR_BLUE}INFO${ORBIT_COLOR_RESET}  ${message}"
            ;;
        SUCCESS)
            echo -e "${ORBIT_COLOR_GRAY}[${timestamp}]${ORBIT_COLOR_RESET} ${ORBIT_COLOR_GREEN}SUCCESS${ORBIT_COLOR_RESET}  ${message}"
            ;;
        WARN)
            echo -e "${ORBIT_COLOR_GRAY}[${timestamp}]${ORBIT_COLOR_RESET} ${ORBIT_COLOR_YELLOW}WARN${ORBIT_COLOR_RESET}   ${message}" >&2
            ;;
        ERROR)
            echo -e "${ORBIT_COLOR_GRAY}[${timestamp}]${ORBIT_COLOR_RESET} ${ORBIT_COLOR_RED}ERROR${ORBIT_COLOR_RESET}   ${message}" >&2
            ;;
        *)
            echo -e "${ORBIT_COLOR_GRAY}[${timestamp}]${ORBIT_COLOR_RESET} ${message}"
            ;;
    esac
}