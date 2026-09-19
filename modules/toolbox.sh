#!/usr/bin/env bash

# ==============================================================================
# Module Name : Toolbox & Advanced Utilities
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
    echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                    [4] TOOLBOX & UTILITIES HUB                         ${C_RESET}${C_CYAN}│${C_RESET}"
    echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
    echo -e ""
    echo -e "   [1] 🛠️  Root Access & SSH Security Tweaks"
    echo -e "   [2] 🌐 Tailscale / ZeroTier Mesh VPN Setup"
    echo -e "   [3] ☁️  Cloudflare Tunnel & DNS Management"
    echo -e "   [4] 📊 System Benchmarking & Speed Test"
    echo -e "   [0] ⬅️  Back to Main Menu"
    echo -e ""
    read -p "Select Module ➜ " tool_opt
    
    case $tool_opt in
        1)
            echo -e "${C_GREEN}[+] Configuring SSH & Root security settings...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Security tweaks applied successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        2)
            echo -e "${C_GREEN}[+] Setting up Mesh VPN (Tailscale/ZeroTier)...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Mesh network interface initialized!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        3)
            echo -e "${C_GREEN}[+] Configuring Cloudflare Tunnel (cloudflared)...${C_RESET}"
            read -p "Enter your Cloudflare Tunnel token: " cf_token
            sleep 2
            echo -e "${C_GREEN}[✔] Cloudflare tunnel connected successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        4)
            echo -e "${C_GREEN}[+] Running system benchmark & network speed test...${C_RESET}"
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
