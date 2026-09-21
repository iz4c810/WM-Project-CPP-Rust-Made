#!/bin/sh

# --- Color DEFOs (Raw POSIX SAFE) ---
BOLD="\033[1m"
GREEN="\033[1;32m"
BLUE="\033[1;34m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="033[0m"

# --- UI Helper FUNC ---
print_banner() {
  printf "${BOLD}${CYAN}==============================================================================================${RESET}\n"
  printf "${BOLD}${CYAN}                             Astra Window Manager Installer                                   ${RESET}\n"
  printf "${BOLD}${CYAN}==============================================================================================${RESET}\n"
