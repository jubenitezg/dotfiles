# Exclude tmux from auto-starting on other terminals
if [ -z "$ZED_TERMINAL" ] && [ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ] && [ "$TERM_PROGRAM" != "WarpTerminal" ] && [ -n "$PS1" ] && [ -z "$TMUX" ]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOCONNECT=false
  tmux new-session -A -s main
fi

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  macos
  copypath
  copyfile
  copybuffer
  aliases
  alias-finder
  fasd
)

if [[ "$TERM_PROGRAM" != "WarpTerminal" ]]; then

  # if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  #   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  # fi

  # ========== Brew plugins ==========
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  # ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fcg=23'
  # ==================================


  plugins+=(fzf)
  source <(fzf --zsh)

  set -o vi
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""
source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Alias
alias rt="echo $?"


# ========== Java ==========
export JAVA_21_HOME=$(/usr/libexec/java_home -v21)

alias java21='export JAVA_HOME=$JAVA_21_HOME'

java21
# ==========================

# ========= Go =========
export GOPATH=$(go env GOPATH)
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOOS="darwin"
export GOARCH="arm64"
# ======================

# ========= Rust =========
export RUSTUP_HOME="${HOME}/.rustup"
export CARGO_HOME="${HOME}/.cargo"
# added to path by .zshenv
# ========================

# ========= Custom scripts =========
export PATH="${PATH}:${HOME}/.dotfiles/scripts/utils/bin"
alias pst="pomodoro start"
# ==================================

# ========= Bat ====================
export BAT_THEME="Catppuccin Mocha"
alias cat="bat -pp"
# ==================================

# ========= Vim / Nvim =========
alias vi="nvim"
alias vim="nvim"
# ==============================

# ========= AWS CLI =========
autoload bashcompinit && bashcompinit
# ===========================

# ========= Graphviz =========
export GRAPHVIZ_DOT=$(which dot)
# ============================

# ========= act =========
alias act="act --container-architecture linux/amd64"
# =======================

#====================
alias gconf="vi ~/.config/ghostty/config"
#====================

# ========= Docker =========
# For building docker on Mac M1
#docker() {
#  if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
#    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
#  else
#    /usr/local/bin/docker "$@"
#  fi
#}

# ==========================

# ====== Tokens ======
source ~/.tokens.sh
# ====================

# ====== Lazy =========
alias lzd=lazydocker
alias lzg=lazygit
# ====================

# ==================== pico-8 ==========
alias p8c="cd ${HOME}/Library/Application\ Support/pico-8/carts"
# ======================================


if command -v ngrok &>/dev/null; then
  eval "$(ngrok completion)"
fi

eval "$(pyenv init -)"

export SPATIALINDEX_C_LIBRARY='/opt/homebrew/Cellar/spatialindex/1.9.3/lib'

# ============================ gh =======================================
if gh extension list 2>/dev/null | grep -q 'github/gh-copilot'; then
  eval "$(gh copilot alias -- zsh)"
fi
export EDITOR=nvim
# ============================ gh =======================================

export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

[ -f "/Users/jbenitezg/.ghcup/env" ] && . "/Users/jbenitezg/.ghcup/env" # ghcup-env


clear_cargo_targets() {
  find ~/Documents/GitHub -name Cargo.toml -type f -prune -exec echo "In {}" \; -exec cargo clean --manifest-path {} \;
}

### Starship
eval "$(starship init zsh)"
