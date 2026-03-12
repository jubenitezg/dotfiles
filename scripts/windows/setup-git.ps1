#!/usr/bin/env pwsh

$DOTFILES = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

function Setup-Git {
    Write-Host "Configuring git..."
    git config --global core.excludesfile "$env:USERPROFILE\.gitignore_global"
    git config --global core.autocrlf false
    git config --global core.eol lf
}

Setup-Git
Write-Host "==> Git setup complete."
