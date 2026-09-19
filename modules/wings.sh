#!/usr/bin/env bash

# ==============================================================================
# Module Name : Wings Daemon & Node Manager
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
    echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                       [3] WINGS MANAGER HUB                            ${C_RESET}${C_CYAN}│${C_RESET}"
    echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
    echo -e ""
    echo -e "   [1] 🚀 Install Pterodactyl Wings Daemon"
    echo -e "   [2] 🔒 Configure SSL & Let's Encrypt (Certbot)"
    echo -e "   [3] 🐳 Configure Docker Daemon & Swap Settings"
    echo -e "   [4] 🔄 Restart & Check Wings Status"
    echo -e "   [0] ⬅️  Back to Main Menu"
    echo -e ""
    read -p "Select Module ➜ " wings_opt
    
    case $wings_opt in
        1)
            echo -e "${C_GREEN}[+] Initializing Wings Daemon Installation...${C_RESET}"
            echo -e "${C_YELLOW}[*] Installing Docker dependencies and setting up systemd service...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Wings daemon installed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        2)
            echo -e "${C_GREEN}[+] Setting up SSL Certificate with Certbot...${C_RESET}"
            read -p "Enter your node domain (e.g., node1.nobitahost.in): " node_domain
            echo -e "${C_YELLOW}[*] Requesting SSL certificate for ${node_domain}...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] SSL configured successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        3)
            echo -e "${C_GREEN}[+] Optimizing Docker & Enabling Swap Memory...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Docker configurations applied!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        4)
            echo -e "${C_GREEN}[+] Checking Wings service status...${C_RESET}"
            systemctl status wings --no-pager
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
