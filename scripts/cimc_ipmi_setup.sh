#!/usr/bin/env bash
set -euo pipefail

if [ $# -lt 3 ]; then
  echo "Usage: $0 <cimc-ip> <user> <password> [channel]"
  exit 1
fi

CIMC_IP="$1"
USER="$2"
PASS="$3"
CHANNEL="${4:-1}"

ipmitool -I lanplus -H "$CIMC_IP" -U "$USER" -P "$PASS" mc info
ipmitool -I lanplus -H "$CIMC_IP" -U "$USER" -P "$PASS" chassis power status
ipmitool -I lanplus -H "$CIMC_IP" -U "$USER" -P "$PASS" lan print "$CHANNEL"