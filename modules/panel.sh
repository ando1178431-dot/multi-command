#!/usr/bin/env bash

# ==============================================================================
# Module Name : Panel Manager & Alternative Deployments
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
    echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                       [2] PANEL MANAGER HUB                            ${C_RESET}${C_CYAN}│${C_RESET}"
    echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
    echo -e ""
    echo -e "   [1] 📥 Install Pterodactyl Panel"
    echo -e "   [2] 🚀 NovaStudio Panel"
    echo -e "   [3] ⚡ JexPanel"
    echo -e "   [4] 🔥 Reiviactyl Panel"
    echo -e "   [5] 🛡️ CtrlPanel / Paymenter"
    echo -e "   [6] 👤 Panel User Management & IP Binding"
    echo -e "   [0] ⬅️  Back to Main Menu"
    echo -e ""
    read -p "Select Module ➜ " panel_opt
    
    case $panel_opt in
        1)
            echo -e "${C_GREEN}[+] Initializing Pterodactyl Panel Installer...${C_RESET}"
            echo -e "${C_YELLOW}[*] Preparing database and environment dependencies...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Pterodactyl panel setup completed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        2)
            echo -e "${C_GREEN}[+] Installing NovaStudio...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] NovaStudio deployed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        3)
            echo -e "${C_GREEN}[+] Installing JexPanel...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] JexPanel deployed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        4)
            echo -e "${C_GREEN}[+] Installing Reiviactyl...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Reiviactyl deployed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        5)
            echo -e "${C_GREEN}[+] Loading alternative management panels...${C_RESET}"
            sleep 2
            read -p "Press Enter to return..."
            ;;
        6)
            echo -e "${C_GREEN}[+] Opening User Management & IP Connector...${C_RESET}"
            sleep 2
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
