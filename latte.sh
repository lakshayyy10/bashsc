#!/bin/bash
latte_ip="192.168.70.9"
pass="betternotbreakit"
ping_ips=("192.168.80.21" "192.168.80.21" "192.168.70.20" "192.168.70.9")

echo "Connecting to LattePanda thru SSH..."
sshpass -p "$pass" ssh -o ConnectTimeout=5 name@$latte_ip "./go2rtc_linux_amd64"

if [ $? -eq 0 ]; then
  echo "LattePanda connected"
else
  echo "SSH connection failed"
  echo "Checking different IPs..."
  for ip in "${ping_ips[@]}"; do
    echo "Checkig $ip"
    if ping -c 2 "$ip" &>/dev/null; then
      echo "IP is connectable"
    else
      echo "IP not connectable"
    fi 
  done
  echo "Script completed"
fi
