#!/bin/bash

echo "Welcome, We're going to install V2RAY VPN + WARP"

sleep 2

echo "First Of all we will install V2RAY panel ..."

sleep 2

bash <(curl -Ls https://raw.githubusercontent.com/mhsanaei/3x-ui/master/install.sh)

echo "Then we will install WARP ..."
echo "Be aware to prepare a key for WARP+"

sleep 2

wget -N https://gitlab.com/fscarmen/warp/-/raw/main/menu.sh && bash menu.sh

echo "At the end we will install SSL"

sleep 2

apt update && apt upgrade -y
apt install curl socat -y
curl https://get.acme.sh | sh
~/.acme.sh/acme.sh --set-default-ca --server letsencrypt
~/.acme.sh/acme.sh --register-account -m samadyd@gmail.com
~/.acme.sh/acme.sh --issue -d mojaradi.blockmehr.ir --standalone
~/.acme.sh/acme.sh --installcert -d mojaradi.blockmehr.ir --key-file /root/private.key --fullchain-file /root/cert.crt

echo "Now copy your private key and public key to the V2RAY panel to secure your connection"
echo "After that go to Xray config then go to Advanced tab then Copy script below to Advanced Xray Configuration Template"

sleep 2

cat Xray_Configuration.json | jq .
