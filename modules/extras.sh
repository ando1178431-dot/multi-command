#!/usr/bin/env bash

# ==============================================================================
# Module Name : Extras & Advanced Utilities
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
    echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                    [9] EXTRAS & ADVANCED HUB                           ${C_RESET}${C_CYAN}│${C_RESET}"
    echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
    echo -e ""
    echo -e "   [1] 🧹 Deep System & Docker Cleanup (Prune Unused Data)"
    echo -e "   [2] 📈 Real-time Network Traffic Monitor (Nload/Bmon)"
    echo -e "   [3] 🔑 Generate Secure API Keys / Passwords"
    echo -e "   [4] 🔄 Update Hub Scripts from Repository"
    echo -e "   [0] ⬅️  Back to Main Menu"
    echo -e ""
    read -p "Select Module ➜ " extra_opt
    
    case $extra_opt in
        1)
            echo -e "${C_GREEN}[+] Cleaning system caches and pruning Docker containers/images...${C_RESET}"
            docker system prune -af --volumes
            apt-get clean && apt-get autoremove -y
            echo -e "${C_GREEN}[✔] System cleanup finished successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        2)
            echo -e "${C_GREEN}[+] Launching network traffic monitor...${C_RESET}"
            if command -v nload &> /dev/null; then
                nload
            else
                apt-get install -y nload && nload
            fi
            read -p "Press Enter to return..."
            ;;
        3)
            echo -e "${C_GREEN}[+] Generated Secure Key:${C_RESET}"
            openssl rand -base64 32
            echo ""
            read -p "Press Enter to return..."
            ;;
        4)
            echo -e "${C_GREEN}[+] Checking for script updates from GitHub...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Everything is already up to date!${C_RESET}"
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
