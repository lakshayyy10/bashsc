#!/bin/bash

latte_ip="192.168.173.96"
pass="betternotbreakit"
website="https://webrtc.com"
ping_ips=("192.168.80.21" "192.168.80.21" "192.168.70.20" "192.168.70.9")

echo "connecting to lattepanda thru ssh"
sshpass -p "$pass" ssh -o ConnectTimeout=5 name@$latte_ip "exit"

if [ $? -eq 0 ]; then
  echo "lattepanda connected"
  echo "open camera website"
  xdg-open "$website"
else
  echo "ssh failed"
  echo "checking diff ips"

  for ip in "${ping_ips[@]}"; do
    echo "checkign $ip"
    if ping -c 2 "$ip" &>/dev/null; then
      echo "ip is connectable"
    else
      echo "ip not connectable"
    fi 
  done
  echo "script completed"
fi
    
    
