# Dotfiles

Configured using [Dotbot](https://github.com/anishathalye/dotbot)

## macOS

**WARNING:** This can replace previous configurations

1. Install Apple's Command Line Tools

```bash
xcode-select --install
```

2. Clone the repository into a hidden folder at `HOME`

```bash
git clone git@github.com:jubenitezg/dotfiles.git ~/.dotfiles
```

3. Execute `install` and enter password for `brew` and wait for `install-extra.sh` user input

```bash
~/.dotfiles/install
```

4. Restart the terminal

---

## Windows

**WARNING:** This can replace previous configurations

> Requires an elevated (Administrator) PowerShell prompt

1. Allow script execution

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

2. Clone the repository

```powershell
git clone git@github.com:jubenitezg/dotfiles.git ~/.dotfiles
```

> If git is not installed yet, install it from https://git-scm.com/download/win first

3. Run the installer

```powershell
~/.dotfiles/install.ps1
```

This will:
- Enable Developer Mode (required for symlinks)
- Install [Chocolatey](https://chocolatey.org) and all packages from `windows/Chocofile`
- Install PowerShell modules: `Terminal-Icons`, `PSReadLine`, `z`, `PSFzf`
- Symlink configs via Dotbot (`PowerShell profile`, `nvim`, `gitconfig`, …)

4. Restart the terminal

### What's included

| Tool | Purpose |
|------|---------|
| [Oh My Posh](https://ohmyposh.dev) | Prompt theme (Catppuccin Mocha) |
| [Terminal Icons](https://github.com/devblackops/Terminal-Icons) | File/folder icons in terminal |
| [PSReadLine](https://github.com/PowerShell/PSReadLine) | Autocompletion & vi mode |
| [z](https://github.com/badmotorfinger/z) | Directory jumper |
| [PSFzf](https://github.com/kelleyma49/PSFzf) | Fuzzy finder (`Ctrl+t`, `Ctrl+r`) |
| [Chocolatey](https://chocolatey.org) | Package manager |
