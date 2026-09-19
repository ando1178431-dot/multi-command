#!/usr/bin/env bash

# ==============================================================================
# Script Name : Disknogamerz V1
# Description : Multi-purpose VPS Virtualization & Pterodactyl Control Hub
# Author      : Disknogamerz
# ==============================================================================

# Professional Color Palette
C_CYAN='\033[1;36m'
C_BLUE='\033[1;34m'
C_GREEN='\033[1;32m'
C_YELLOW='\033[1;33m'
C_RED='\033[1;31m'
C_PURPLE='\033[1;35m'
C_WHITE='\033[1;37m'
C_RESET='\033[0m'

# Check Root Privileges
if [ "$EUID" -ne 0 ]; then
  echo -e "${C_RED}[ERROR] Please run this script as root (sudo -i).${C_RESET}"
  exit 1
fi

# System Metrics Functions
get_uptime() {
    uptime -p | sed 's/up //'
}

get_cpu_usage() {
    read cpu a b c previdle rest < /proc/stat
    prevtotal=$((a+b+c+previdle))
    sleep 0.3
    read cpu a b c idle rest < /proc/stat
    total=$((a+b+c+idle))
    diff_idle=$((idle-previdle))
    diff_total=$((total-prevtotal))
    diff_usage=$(( (1000 * (diff_total - diff_idle) / diff_total + 5) / 10 ))
    echo "${diff_usage}%"
}

get_ram_usage() {
    free | awk '/Mem:/ {printf "%.0f%% (%dMB/%dMB)\n", ($3/$2)*100, $3/1024, $2/1024}'
}

check_network() {
    if ping -c 1 8.8.8.8 &> /dev/null; then
        echo -e "${C_GREEN}● CONNECTED${C_RESET}"
    else
        echo -e "${C_RED}● DISCONNECTED${C_RESET}"
    fi
}

# Main Hub GUI Dashboard
show_dashboard() {
    clear
    HOST_ID=$(hostname)
    UPTIME_STR=$(get_uptime)
    CPU_STAT=$(get_cpu_usage)
    RAM_STAT=$(get_ram_usage)
    NET_STAT=$(check_network)

    echo -e "${C_CYAN}┌────────────────────────────────────────────────────────────────────────┐${C_RESET}"
    echo -e "${C_CYAN}│${C_RESET} 💻 Host: ${C_WHITE}${HOST_ID}${C_RESET}  │  ⏳ Uptime: ${C_PURPLE}${UPTIME_STR}${C_RESET}  │  📊 RAM: ${C_GREEN}${RAM_STAT}${C_RESET} ${C_CYAN}│${C_RESET}"
    echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
    echo -e ""
    echo -e "${C_CYAN}  ██████╗ ██╗███████╗██╗  ██╗███╗   ██╗ ██████╗  █████╗ ███╗   ███╗ █████╗ ███████╗${C_RESET}"
    echo -e "${C_CYAN}  ██╔══██╗██║██╔════╝██║ ██╔╝████╗  ██║██╔════╝ ██╔══██╗████╗ ████║██╔══██╗╚══███╔╝${C_RESET}"
    echo -e "${C_CYAN}  ██║  ██║██║███████╗█████╔╝ ██╔██╗ ██║██║  ███╗███████║██╔████╔██║███████║  ███╔╝ ${C_RESET}"
    echo -e "${C_CYAN}  ██║  ██║██║╚════██║██╔═██╗ ██║╚██╗██║██║   ██║██╔══██║██║╚██╔╝██║██╔══██║ ███╔╝  ${C_RESET}"
    echo -e "${C_CYAN}  ██████╔╝██║███████║██║  ██╗██║ ╚████║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║  ██║███████╗${C_RESET}"
    echo -e "${C_CYAN}╚═════════╩═╩═══════╩═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═══════╝${C_RESET}"
    echo -e "${C_WHITE}               DISKNOGAMERZ V1 — OBSIDIAN NEXT GEN EDITION               ${C_RESET}"
    echo -e ""
    echo -e "${C_YELLOW}⚡ SYSTEM STATUS${C_RESET}"
    echo -e "   CPU Usage : ${C_WHITE}${CPU_STAT}${C_RESET}"
    echo -e "   RAM Usage : ${C_WHITE}${RAM_STAT}${C_RESET}"
    echo -e "   Network   : ${NET_STAT}"
    echo -e ""
    echo -e "${C_CYAN}📦 DEPLOYMENT & SERVICES${C_RESET}"
    echo -e "   [1] 🖥️  VPS Virtualization       [5] 🎨 Pterodactyl Themes & Blueprint"
    echo -e "   [2] 🎛️  Panel Manager            [6] 🛠️  System Operations"
    echo -e "   [3] 🚀 Wings Manager             [7] 🐳 Container Tools"
    echo -e "   [8] 📦 New Module"
    echo -e ""
    echo -e "${C_BLUE}🔧 MAINTENANCE & TOOLS${C_RESET}"
    echo -e "   [4] 🧰 Toolbox & Utilities      [9] ✨ Extras & Advanced"
    echo -e ""
    echo -e "                             └─ ${C_RED}[0] ⏻ SHUTDOWN SYSTEM${C_RESET} ─┘"
    echo -e ""
    echo -e "${C_GREEN}➜${C_RESET} Enter Option ${C_WHITE}(0-9)${C_RESET}: \c"
}

# Sub-Menu: VPS Virtualization
run_vps_menu() {
    while true; do
        clear
        echo -e "${C_CYAN}┌────────────────────────────────────────────────────────────────────────┐${C_RESET}"
        echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                     [1] VPS VIRTUALIZATION MENU                        ${C_RESET}${C_CYAN}│${C_RESET}"
        echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
        echo -e ""
        echo -e "   [1] ⚡ Run VM 1 (KVM Setup & Convert)"
        echo -e "   [2] 🔄 Run VM 2 (Non-KVM to QEMU/KVM Conversion)"
        echo -e "   [3] 🌐 Run VM 3 (Universal Full Setup)"
        echo -e "   [0] ⬅️  Back to Main Menu"
        echo -e ""
        read -p "Select Option ➜ " vps_opt
        case $vps_opt in
            1)
                echo -e "${C_GREEN}[+] Initializing VM 1 KVM Configuration...${C_RESET}"
                sleep 2
                ;;
            2)
                echo -e "${C_GREEN}[+] Converting Non-KVM environment to QEMU/KVM...${C_RESET}"
                sleep 2
                ;;
            3)
                echo -e "${C_GREEN}[+] Executing Universal VM Setup...${C_RESET}"
                sleep 2
                ;;
            0) break ;;
            *) echo -e "${C_RED}[!] Invalid Option!${C_RESET}"; sleep 1 ;;
        esac
    done
}

# Sub-Menu: Panel Manager
run_panel_menu() {
    while true; do
        clear
        echo -e "${C_CYAN}┌────────────────────────────────────────────────────────────────────────┐${C_RESET}"
        echo -e "${C_CYAN}│${C_RESET} ${C_WHITE}                       [2] PANEL MANAGER HUB                            ${C_RESET}${C_CYAN}│${C_RESET}"
        echo -e "${C_CYAN}└────────────────────────────────────────────────────────────────────────┘${C_RESET}"
        echo -e ""
        echo -e "   [1] 📥 Install Pterodactyl Panel"
        echo -e "   [2] 🚀 Install Alternative Panels (NovaStudio / JexPanel / Reiviactyl)"
        echo -e "   [3] 👤 Panel User Management & IP Binding"
        echo -e "   [0] ⬅️  Back to Main Menu"
        echo -e ""
        read -p "Select Module ➜ " panel_opt
        case $panel_opt in
            1) echo -e "${C_GREEN}Installing Pterodactyl Panel...${C_RESET}"; sleep 2 ;;
            2) echo -e "${C_GREEN}Opening Alternative Panels Menu...${C_RESET}"; sleep 2 ;;
            3) echo -e "${C_GREEN}Opening User Manager...${C_RESET}"; sleep 2 ;;
            0) break ;;
            *) echo -e "${C_RED}[!] Invalid Option!${C_RESET}"; sleep 1 ;;
        esac
    done
}

# Core Event Loop
while true; do
    show_dashboard
    read -r choice
    case $choice in
        1) run_vps_menu ;;
        2) run_panel_menu ;;
        3) echo -e "${C_GREEN}Launching Wings Manager...${C_RESET}"; sleep 1 ;;
        4) echo -e "${C_GREEN}Launching Toolbox & Utilities...${C_RESET}"; sleep 1 ;;
        5) echo -e "${C_GREEN}Launching Themes & Blueprint Manager...${C_RESET}"; sleep 1 ;;
        6) echo -e "${C_GREEN}System info tools running...${C_RESET}; read -p "Press Enter to continue..." ;;
        7) echo -e "${C_GREEN}Container tools running...${C_RESET}; read -p "Press Enter to continue..." ;;
        8) echo -e "${C_YELLOW}New module section coming soon!${C_RESET}; read -p "Press Enter to continue..." ;;
        9) echo -e "${C_GREEN}Extras menu running...${C_RESET}; read -p "Press Enter to continue..." ;;
        0) echo -e "${C_RED}Exiting Disknogamerz V1 Hub. Goodbye!${C_RESET}"; exit 0 ;;
        *) echo -e "${C_RED}[!] Invalid Choice! Please enter 0-9.${C_RESET}"; sleep 1 ;;
    esac
done
