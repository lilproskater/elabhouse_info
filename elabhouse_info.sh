#!/bin/bash
# ██████████   ██        ██
#              ██        ██
#              ██        ██
# ██████████   ██  ████████
#              ██        ██
#              ██        ██
# ██████████   ██        ██
#
# \e[90m - Gray
# \e[96m - Light Cyan
# \e[97m - White
echo -e "\e[1m\e[97m██████████  \e[96m██        \e[97m██"
echo -e "\e[1m\e[97m            \e[96m██        \e[97m██"
echo -e "\e[1m\e[97m            \e[96m██        \e[97m██"
echo -e "\e[1m\e[97m██████████  \e[96m██  \e[97m████████"
echo -e "\e[1m\e[97m            \e[96m██        \e[97m██"
echo -e "\e[1m\e[97m            \e[96m██        \e[97m██"
echo -e "\e[1m\e[97m██████████  \e[96m██        \e[97m██"
echo ""
echo "Welcome to Elabhouse Stagning Server!"
echo ""
echo -e "\e[0m -------------------------------System Information----------------------------"
echo -e "Hostname:\t\t"`hostname`
echo -e "uptime:\t\t\t"`uptime | awk '{print $3,$4}' | sed 's/,//'`
echo -e "Manufacturer:\t\t"`cat /sys/class/dmi/id/chassis_vendor`
echo -e "Product Name:\t\t"`cat /sys/class/dmi/id/product_name`
echo -e "Version:\t\t"`cat /sys/class/dmi/id/product_version`
echo -e "Machine Type:\t\t"`vserver=$(lscpu | grep Hypervisor | wc -l); if [ $vserver -gt 0 ]; then echo "VM"; else echo "Physical"; fi`
echo -e "Operating System:\t"`hostnamectl | grep "Operating System" | cut -d ' ' -f5-`
echo -e "Kernel:\t\t\t"`uname -r`
echo -e "Architecture:\t\t"`arch`
echo -e "Processor Name:\t\t"`awk -F':' '/^model name/ {print $2}' /proc/cpuinfo | uniq | sed -e 's/^[ \t]*//'`
echo -e "Active User:\t\t"`echo $USER`
echo -e "System Main IP:\t\t"`hostname -I`
echo ""
echo -e "-------------------------------CPU/Memory Usage------------------------------"
echo -e "Memory Usage:\t"`free | awk '/Mem/{printf("%.2f%%"), $3/$2*100}'`
echo -e "CPU Usage:\t"`cat /proc/stat | awk '/cpu/{printf("%.2f%%\n"), ($2+$4)*100/($2+$4+$5)}' |  awk '{print $0}' | head -1`
echo ""
