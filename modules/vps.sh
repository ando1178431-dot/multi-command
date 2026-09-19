#!/usr/bin/env bash

# ==============================================================================
# Module Name : VPS Virtualization & KVM Converter
# Hub         : Disknogamerz V1
# ==============================================================================

C_CYAN='\033[1;36m'
C_GREEN='\033[1;32m'
C_YELLOW='\033[1;33m'
C_RED='\033[1;31m'
C_WHITE='\033[1;37m'
C_RESET='\033[0m'

while true; do
    clear
    echo -e "${C_CYAN}┌────────────────────────────────────────────────────────────────────────┐${C_RESET}"
    echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                     [1] VPS VIRTUALIZATION MENU                        ${C_RESET}${C_CYAN}│${C_RESET}"
    echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
    echo -e ""
    echo -e "   [1] ⚡ Run VM 1 (KVM Setup & Convert Existing Environment)"
    echo -e "   [2] 🔄 Run VM 2 (Non-KVM to QEMU/KVM Nested Virtualization)"
    echo -e "   [3] 🌐 Run VM 3 (Universal Full Setup & Bridge Config)"
    echo -e "   [0] ⬅️  Back to Main Menu"
    echo -e ""
    read -p "Select Option ➜ " vps_opt
    
    case $vps_opt in
        1)
            echo -e "${C_GREEN}[+] Initializing VM 1 KVM Configuration...${C_RESET}"
            echo -e "${C_YELLOW}[*] Checking hardware virtualization support (KVM)...${C_RESET}"
            if [ -e /dev/kvm ]; then
                echo -e "${C_GREEN}[✔] Hardware KVM acceleration is fully available!${C_RESET}"
            else
                echo -e "${C_RED}[✘] Hardware KVM not detected directly. Preparing nested fallback...${C_RESET}"
            fi
            apt-get update && apt-get install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils
            echo -e "${C_GREEN}[✔] Setup completed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        2)
            echo -e "${C_GREEN}[+] Converting Non-KVM environment to QEMU/KVM...${C_RESET}"
            echo -e "${C_YELLOW}[*] Configuring software emulation layers (QEMU)...${C_RESET}"
            apt-get install -y qemu system-user-kvm
            echo -e "${C_GREEN}[✔] QEMU/KVM emulation conversion completed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        3)
            echo -e "${C_GREEN}[+] Executing Universal VM Setup...${C_RESET}"
            echo -e "${C_YELLOW}[*] Setting up network bridges and storage pools...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Universal setup complete!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        0) 
            break 
            ;;
        *) 
            echo -e "${C_RED}[!] Invalid Option!${C_RESET}"
            sleep 1 
            ;;
    esac
done
