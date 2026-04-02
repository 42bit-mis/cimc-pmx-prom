#!/usr/bin/env bash
set -euo pipefail

sudo apt-get update
sudo apt-get install -y python3 python3-venv python3-pip ipmitool jq

if [ ! -d .venv ]; then
  python3 -m venv .venv
fi

source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install ansible lxml xmljson jmespath
ansible-galaxy collection install -r requirements.yml

echo
ansible --version
echo
echo "Bootstrap complete. Activate with: source .venv/bin/activate"