#!/bin/bash

#Variables contador i històric
score=0
HISTFILE=~/.flower_history
HISTSIZE=1000
HISTFILESIZE=2000
set -o history

LOGFILE=/LOGS/historial_$(date +%Y%m%d_%H%M%S).txt

#Funció per actualitzar el prompt
update_prompt() {
    green="\033[1;32m"    # punts
    pink="\033[1;35m"     # usuari@equip
    blue="\033[1;34m"     # icona 🌸
    yellow="\033[1;33m"   # fletxa
    reset="\033[0m"       # reset colors

    PROMPT="${green}[$score]${reset} ${pink}$(whoami)@FPLinux${reset} ${blue}🌸${reset} ${yellow}$(pwd) ➜ ${reset} "
}

deleted_propmt() {
    echo "💥💥💥 Borrant sistema i parant... 💥💥💥"
    sleep 1
}

#Inici del programa
clear
echo "🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸"
echo "🌸  Benvinguts a FlowerPowerLinux (no tan flower)   🌸"
echo "🌸  Escriu ordres... amb compte... que es borra 😄  🌸"
echo "🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸🌸"
echo

while true; do
    update_prompt

    #Llegir ordre i mostrar prompt si tabule
    echo -ne "$PROMPT"
    read -e cmd

    #Guarde LOG de l'ordre executada
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $score: $cmd" >> "$LOGFILE"
    
    #Guardar en historial l'ordre
    history -s "$cmd"

    #Detectar ordre crítica rm -rf /
    if [[ "$cmd" =~ rm.*-rf.*(/|\*) || "$cmd" =~ rm.*-r.*(/|\*) ]]; then
        echo "🚨🚨🚨🚨  ORDRE CRÍTICA DETECTADA  🚨🚨🚨🚨"
        echo "🌸  FlowerPowerLinux ha bloquejat una destrucció massiva  🌸"
        echo "💥  En un sistema real hauries causat problemes irreparables  💥"
        deleted_propmt
        break
    fi

    #Executar ordre
    eval "$cmd"
    status=$?

    #Si no falla... suma
    if [ $status -eq 0 ]; then
        ((score++))
    
    elif [ $status -ne 0 ]; then
        echo "⚠️  Ordre incorrecta  ⚠️"
        deleted_propmt
        break
    fi
done