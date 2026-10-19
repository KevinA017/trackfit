#!/usr/bin/env bash
# Ejecutar UNA vez desde la raíz del proyecto, después de copiar estos archivos.
# Requisitos: git y GitHub CLI (gh) autenticado -> gh auth login
set -euo pipefail

REPO_NAME="${1:-trackfit}"

# 1. Crear proyecto Expo en /app
npx create-expo-app@latest app
rm -rf app/.git          # el repo git es el de la raíz
cp .env.example app/.env.example

# 2. Inicializar git y primer commit en main
git init -b main
git add .
git commit -m "chore: initialize project with Expo, docs and CI pipeline"

# 3. Crear repo remoto y subir main
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

# 4. Crear y subir develop
git checkout -b develop
git push -u origin develop

echo ""
echo "✅ Repo creado. Espera a que el CI termine en verde en GitHub > Actions."
echo "   Luego ejecuta: ./protect-main.sh"
