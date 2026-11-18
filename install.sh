#!/usr/bin/env bash

# Create new build folder
rm -rf ./.build/
mkdir ./.build
# Init log
touch ./.build/build.log
logmsg() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> ./.build/build.log
}
logmsg "Initialize installation"
logpipe() {
    logmsg "$*:"
    local line
    while IFS= read -r line || [[ -n "$line" ]]; do
        logmsg "↳ $line"
    done
}

touch ./.build/config.sh && logmsg "Created config.sh" || logmsg "Failed to create config.sh"
chmod +x ./.build/config.sh && logmsg "Made config.sh executable" || logmsg "Failed to make preset.sh executable"
cp -r -v ./nix ./.build | logpipe "Copy nix"
unset RAYOS_INSTALLER_SUMMARY

clear
show_success "Hellooo"

echo "RayOS Config:"

# Set unset environment variables
while IFS=# read -r NAME DEFAULT PROMPT <&3; do
    [[ "$NAME" =~ ^[[:space:]]*# ]] && continue
    [[ -z "${NAME//[[:space:]]/}" ]] && continue
    eval "DEFAULT=\"$DEFAULT\""
    if [[ -z "${!NAME}" ]]; then
        if [[ "$NAME" =~ ^RAYOS_SECRET_ ]]; then
            read -r -s -p "$PROMPT: " $NAME </dev/tty
            echo
        elif [[ "$NAME" =~ ^RAYOS_ ]]; then
            read -r -p "$PROMPT${DEFAULT:+ [$DEFAULT]}: " $NAME </dev/tty
            if [[ -z "${!NAME}" ]]; then
                export "$NAME=$DEFAULT"
                echo "$PROMPT = ${!NAME}" | logpipe "Config"
                RAYOS_INSTALLER_SUMMARY+=("$PROMPT = ${!NAME}")
            fi
        fi
    else
        echo "$PROMPT = ${!NAME}" | logpipe "Config (default)"
        RAYOS_INSTALLER_SUMMARY+=("$PROMPT = ${!NAME}")
    fi
    [[ ! "$NAME" =~ ^RAYOS_SECRET_ ]] && printf 'export %s=%q\n' "$NAME" "${!NAME}" >> ./.build/preset.sh

    sed -i "s/\$$NAME/'${!NAME}'/g" ./.build/nix/**.nix
done 3< ./environment_variables.conf

clear
echo "RayOS configuration finished!"
echo "Summary:"
for item in "${RAYOS_INSTALLER_SUMMARY[@]}"; do
    echo $item
done
echo
read -r -p "Are you sure to proceed with the installation? (y/N): " answer
if [[ ! "$answer" =~ ^[Yy]$ ]]; then
    exit 1
fi
