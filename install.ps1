#!/usr/bin/env pwsh
# Windows dotfiles installer
# Run from an elevated PowerShell prompt:
#   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
#   .\install.ps1

$ErrorActionPreference = "Stop"
$DOTFILES = $PSScriptRoot

function Assert-Admin {
    $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
        [Security.Principal.WindowsBuiltInRole]::Administrator
    )
    if (-not $isAdmin) {
        Write-Error "Please run this script from an elevated (Administrator) PowerShell prompt."
        exit 1
    }
}

function Install-Python {
    if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
        Write-Host "Python not found. Installing via Chocolatey..."
        if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
            Set-ExecutionPolicy Bypass -Scope Process -Force
            [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
            Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        }
        choco install python -y
        $env:PATH = [System.Environment]::GetEnvironmentVariable("PATH", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("PATH", "User")
    }
}

function Install-Dotbot {
    if (-not (Get-Command dotbot -ErrorAction SilentlyContinue)) {
        Write-Host "Installing dotbot..."
        pip install dotbot
    }
}

function Run-Dotbot {
    Write-Host "Running dotbot..."
    Push-Location $DOTFILES
    dotbot -c install.win.conf.yaml
    Pop-Location
}

Assert-Admin
Install-Python
Install-Dotbot
Run-Dotbot

Write-Host ""
Write-Host "==> Done! Restart your terminal to apply changes."
