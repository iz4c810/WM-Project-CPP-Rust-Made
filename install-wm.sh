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
}

info() {
  printf "${BLUE}[i]${RESET} %s\n" "$1"
}

success() {
  printf "${GREEN}[W]${RESET} %s\n" "$1"
}

warn() {
  printf "${YELLOW}[!]${RESET} %s\n" "$1"
}

error() {
  printf "${RED}[X]${RESET} %s\n" "$1"
  exit 1
}

# --- Main EXEC Flow ---
clear
print_banner

info "Starting environment validation..."

# 1. Check for CORRECT PM
info "checking for PM"
if command -v pacman >/dev/null 2>&1; then
  PM="pacman"
  success "Package Manager Found: pacman"
elif command -v emerge >/dev/null 2>&1; then
  PM="emerge"
  success "Package Manager Found: emerge"
else
  error "This Script Requires an Arch-Based Linux Distro or a Gentoo-Based Linux Distro with EMERGE as a PM"
fi

# 2. Check if Git is downloaded to prevent IFs
info "Checking For GIT"
if command -v git >/dev/null 2>&1; then
  success "Git Installation Found"
else
  warn "Git is missing, running 'sudo {PM} {necessary flags} git {--no-confirm for either PM}"
  if [ "$PM" = "pacman" ]; then
    sudo pacman -S --noconfirm git
  elif [ "$PM" = "emerge" ]; then
    sudo emerge dev-vcs/git
  fi
  
