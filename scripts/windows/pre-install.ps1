#!/usr/bin/env pwsh
# Run from an elevated PowerShell prompt

$ErrorActionPreference = "Stop"
$DOTFILES = Split-Path (Split-Path $PSScriptRoot -Parent) -Parent

function Install-Chocolatey {
    if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
        Write-Host "Installing Chocolatey..."
        Set-ExecutionPolicy Bypass -Scope Process -Force
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    } else {
        Write-Host "Chocolatey already installed, upgrading..."
        choco upgrade chocolatey -y
    }
}

function Install-ChocoPackages {
    $chocofile = Join-Path $DOTFILES "windows\Chocofile"
    if (-not (Test-Path $chocofile)) {
        Write-Warning "Chocofile not found at $chocofile"
        return
    }

    $packages = Get-Content $chocofile | Where-Object { $_ -notmatch '^\s*#' -and $_ -match '\S' }
    foreach ($pkg in $packages) {
        Write-Host "Installing $pkg..."
        choco install $pkg -y --no-progress
    }
}

function Install-PSModules {
    $modules = @(
        "Terminal-Icons",
        "posh-git",
        "PSReadLine",
        "z",
        "PSFzf"
    )
    foreach ($module in $modules) {
        if (-not (Get-Module -ListAvailable -Name $module)) {
            Write-Host "Installing PowerShell module: $module"
            Install-Module -Name $module -Repository PSGallery -Force -Scope CurrentUser
        } else {
            Write-Host "Module already installed: $module"
        }
    }
}

function Enable-DeveloperMode {
    # Required for creating symlinks without admin rights
    $regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
    if ((Get-ItemProperty -Path $regPath -Name AllowDevelopmentWithoutDevLicense -ErrorAction SilentlyContinue).AllowDevelopmentWithoutDevLicense -ne 1) {
        Write-Host "Enabling Developer Mode (required for symlinks)..."
        Set-ItemProperty -Path $regPath -Name AllowDevelopmentWithoutDevLicense -Value 1
    }
}

function New-RequiredDirectories {
    $dirs = @(
        "$env:USERPROFILE\Documents\PowerShell",
        "$env:USERPROFILE\AppData\Local\nvim"
    )
    foreach ($dir in $dirs) {
        if (-not (Test-Path $dir)) {
            Write-Host "Creating directory: $dir"
            New-Item -ItemType Directory -Path $dir -Force | Out-Null
        }
    }
}

Write-Host "==> Setting up Windows environment..."
Enable-DeveloperMode
New-RequiredDirectories
Install-Chocolatey
Install-ChocoPackages
Install-PSModules
Write-Host "==> Pre-install complete."
