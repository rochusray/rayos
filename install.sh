#!/usr/bin/env bash

# Create new build folder
echo "Recreate .build/"
sleep 0.01
rm -rf ./.build/
mkdir ./.build
# Init log
echo "Initialize log"
sleep 0.02
touch ./.build/build.log
log_msg() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> ./.build/build.log
}
log_msg "Initialize installation"
log_cmd() {
    log_msg "$*:"
    local line
    while IFS= read -r line || [[ -n "$line" ]]; do
        log_msg "↳ $line"
    done
}

echo "Create config.sh"
sleep 0.01
touch ./.build/config.sh && log_msg "Created config.sh" || log_msg "Failed to create config.sh"
chmod +x ./.build/config.sh && log_msg "Made config.sh executable" || log_msg "Failed to make preset.sh executable"
echo "Copy nix configuration files"
sleep 0.02
cp -r -v ./nix ./.build | log_cmd "Copy nix"

echo "Initialize UI"
sleep 0.08
