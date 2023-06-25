#!/bin/bash

ZULU_17=https://cdn.azul.com/zulu/bin/zulu17.40.19-ca-jdk17.0.6-macosx_aarch64.dmg
ZULU_11=https://cdn.azul.com/zulu/bin/zulu11.62.17-ca-jdk11.0.18-macosx_aarch64.dmg
ZULU_8=https://cdn.azul.com/zulu/bin/zulu8.68.0.21-ca-jdk8.0.362-macosx_aarch64.dmg

curl -o "$HOME/Downloads/zulu17.dmg" "$ZULU_17"
curl -o "$HOME/Downloads/zulu11.dmg" "$ZULU_11"
curl -o "$HOME/Downloads/zulu8.dmg" "$ZULU_8"

echo "Downloaded JDKs"
echo "Double-Click to Install Azul Zulu JDKs"
