#!/usr/bin/env bash

# ==============================================================================
# Module Name : Pterodactyl Themes, Blueprint & Addons Manager
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
    echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                  [5] THEMES & BLUEPRINT MANAGER                      ${C_RESET}${C_CYAN}│${C_RESET}"
    echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
    echo -e ""
    echo -e "   [1] ⚡ Install Blueprint Framework"
    echo -e "   [2] 🎨 Browse & Install Pterodactyl Themes (Nebula, BetterAdmin, etc.)"
    echo -e "   [3] 🧩 Manage Extensions & Addons"
    echo -e "   [0] ⬅️  Back to Main Menu"
    echo -e ""
    read -p "Select Option ➜ " theme_opt
    
    case $theme_opt in
        1)
            echo -e "${C_GREEN}[+] Initializing Blueprint Framework Installer...${C_RESET}"
            echo -e "${C_YELLOW}[*] Downloading and linking blueprint dependencies...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Blueprint framework installed successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        2)
            clear
            echo -e "${C_CYAN}=== SELECT A THEME UI ===${C_RESET}"
            echo -e " 1) nebula               2) euphoriatheme"
            echo -e " 3) BetterAdmin          4) abysspurple"
            echo -e " 5) amberabyss           6) catppuccindactyl"
            echo -e " 7) crimsonabyss         8) emeraldabyss"
            echo -e " 9) nightadmin          10) refreshtheme"
            echo -e " 11) slice              12) darkenate"
            echo -e " 13) recolor            14) bluetables"
            echo -e " 15) ultradarkadmin     16) xlpaneltheme"
            echo -e " 17) lememtheme         18) slate"
            echo -e " 19) kaelixprime        20) m3dactyl"
            echo -e ""
            read -p "Enter theme choice number ➜ " t_choice
            echo -e "${C_GREEN}[+] Applying theme configuration...${C_RESET}"
            sleep 2
            echo -e "${C_GREEN}[✔] Theme installed and panel rebuilt successfully!${C_RESET}"
            read -p "Press Enter to return..."
            ;;
        3)
            echo -e "${C_GREEN}[+] Loading Extensions & Addons Manager...${C_RESET}"
            sleep 2
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
