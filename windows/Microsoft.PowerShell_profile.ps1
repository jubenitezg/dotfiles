# ========== Oh My Posh ==========
oh-my-posh init pwsh --config "$PSScriptRoot\oh-my-posh\catppuccin_mocha.omp.json" | Invoke-Expression

# ========== Modules ==========
Import-Module Terminal-Icons
Import-Module posh-git
Import-Module z
Import-Module PSFzf

# ========== PSReadLine ==========
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -Function ForwardWord
Set-PSReadLineKeyHandler -Chord 'Ctrl+p' -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord 'Ctrl+n' -Function HistorySearchForward

# ========== PSFzf ==========
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t'
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'

$env:FZF_DEFAULT_OPTS = (
    "--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 " +
    "--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC " +
    "--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 " +
    "--color=selected-bg:#45475A " +
    "--color=border:#6C7086,label:#CDD6F4"
)

# ========== Aliases ==========
Set-Alias vi nvim
Set-Alias vim nvim

function lzd { lazydocker @args }
function lzg { lazygit @args }
function rt { Write-Host $LASTEXITCODE }

# ========== Git Helpers ==========
function git_current_branch { git branch --show-current }
function git_main_branch {
    $b = git branch --list 'main','master','trunk','mainline' 2>$null
    if ($b -match '\bmain\b') { return 'main' }
    return 'master'
}
function git_develop_branch {
    $b = git branch --list 'develop','dev','development' 2>$null
    if ($b -match '\bdevelop\b') { return 'develop' }
    if ($b -match '\bdev\b') { return 'dev' }
    return 'develop'
}

# ========== Git ==========
function g     { git @args }

# add
function ga    { git add @args }
function gaa   { git add --all @args }
function gapa  { git add --patch @args }
function gau   { git add --update @args }
function gav   { git add --verbose @args }

# am
function gam   { git am @args }
function gama  { git am --abort @args }
function gamc  { git am --continue @args }
function gams  { git am --skip @args }
function gamscp { git am --show-current-patch @args }

# apply
function gap   { git apply @args }
function gapt  { git apply --3way @args }

# bisect
function gbs   { git bisect @args }
function gbsb  { git bisect bad @args }
function gbsg  { git bisect good @args }
function gbsn  { git bisect new @args }
function gbso  { git bisect old @args }
function gbsr  { git bisect reset @args }
function gbss  { git bisect start @args }

# blame
function gbl   { git blame -w @args }

# branch
function gb    { git branch @args }
function gba   { git branch --all @args }
function gbd   { git branch --delete @args }
function gbD   { git branch --delete --force @args }
function gbm   { git branch --move @args }
function gbnm  { git branch --no-merged @args }
function gbr   { git branch --remote @args }
function gbg   { git branch -vv | Select-String ': gone\]' }
function gbgd  { git branch -vv | Select-String ': gone\]' | ForEach-Object { ($_ -split '\s+')[1] } | ForEach-Object { git branch -d $_ } }
function gbgD  { git branch -vv | Select-String ': gone\]' | ForEach-Object { ($_ -split '\s+')[1] } | ForEach-Object { git branch -D $_ } }
function ggsup { git branch --set-upstream-to=origin/$(git_current_branch) }

# checkout
function gco   { git checkout @args }
function gcor  { git checkout --recurse-submodules @args }
function gcb   { git checkout -b @args }
function gcB   { git checkout -B @args }
function gcd   { git checkout $(git_develop_branch) }
function gcm   { git checkout $(git_main_branch) }

# cherry-pick
function gcp   { git cherry-pick @args }
function gcpa  { git cherry-pick --abort @args }
function gcpc  { git cherry-pick --continue @args }

# clean
function gclean { git clean --interactive -d @args }

# clone
function gcl   { git clone --recurse-submodules @args }

# commit
function gc    { git commit --verbose @args }
function gca   { git commit --verbose --all @args }
function gcam  { git commit --all --message @args }
function gcas  { git commit --all --signoff @args }
function gcasm { git commit --all --signoff --message @args }
function gcmsg { git commit --message @args }
function gcsm  { git commit --signoff --message @args }
function gcn   { git commit --verbose --no-edit @args }
function gcs   { git commit -S @args }
function gcss  { git commit -S -s @args }
function gcssm { git commit -S -s -m @args }
function gcfu  { git commit --fixup @args }

# config
function gcf   { git config --list @args }

# describe
function gdct  { git describe --tags (git rev-list --tags --max-count=1) }

# diff
function gd    { git diff @args }
function gdca  { git diff --cached @args }
function gdcw  { git diff --cached --word-diff @args }
function gds   { git diff --staged @args }
function gdw   { git diff --word-diff @args }
function gdup  { git diff '@{upstream}' @args }
function gdt   { git diff-tree --no-commit-id --name-only -r @args }

# fetch
function gf    { git fetch @args }
function gfa   { git fetch --all --tags --prune @args }
function gfo   { git fetch origin @args }

# log
function glgg  { git log --graph @args }
function glgga { git log --graph --decorate --all @args }
function glgm  { git log --graph --max-count=10 @args }
function glod  { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' @args }
function glods { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short @args }
function glol  { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' @args }
function glola { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --all @args }
function glols { git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --stat @args }
function glo   { git log --oneline --decorate @args }
function glog  { git log --oneline --decorate --graph @args }
function gloga { git log --oneline --decorate --graph --all @args }
function glg   { git log --stat @args }
function glgp  { git log --stat --patch @args }
function gwch  { git log --patch --abbrev-commit --pretty=medium --raw @args }

# ls-files
function gignored { git ls-files -v | Select-String '^[a-z]' }
function gfg   { git ls-files | Select-String @args }

# merge
function gm    { git merge @args }
function gma   { git merge --abort @args }
function gmc   { git merge --continue @args }
function gms   { git merge --squash @args }
function gmff  { git merge --ff-only @args }
function gmom  { git merge origin/$(git_main_branch) @args }
function gmum  { git merge upstream/$(git_main_branch) @args }
function gmtl  { git mergetool --no-prompt @args }
function gmtlvim { git mergetool --no-prompt --tool=vimdiff @args }

# pull
function gl    { git pull @args }
function gpr   { git pull --rebase @args }
function gprv  { git pull --rebase -v @args }
function gpra  { git pull --rebase --autostash @args }
function gprav { git pull --rebase --autostash -v @args }
function gprom { git pull --rebase origin $(git_main_branch) }
function gprum { git pull --rebase upstream $(git_main_branch) }
function ggpull { git pull origin "$(git_current_branch)" }
function gluc  { git pull upstream $(git_current_branch) }
function glum  { git pull upstream $(git_main_branch) }

# push
function gp    { git push @args }
function gpd   { git push --dry-run @args }
function gpf   { git push --force-with-lease @args }
function gpsup { git push --set-upstream origin $(git_current_branch) }
function gpsupf { git push --set-upstream origin $(git_current_branch) --force-with-lease }
function gpv   { git push --verbose @args }
function gpoat { git push origin --all; git push origin --tags }
function gpod  { git push origin --delete @args }
function ggpush { git push origin "$(git_current_branch)" }
function gpu   { git push upstream @args }

# rebase
function grb   { git rebase @args }
function grba  { git rebase --abort @args }
function grbc  { git rebase --continue @args }
function grbi  { git rebase --interactive @args }
function grbo  { git rebase --onto @args }
function grbs  { git rebase --skip @args }
function grbd  { git rebase $(git_develop_branch) }
function grbm  { git rebase $(git_main_branch) }
function grbom { git rebase origin/$(git_main_branch) }
function grbum { git rebase upstream/$(git_main_branch) }

# reflog
function grf   { git reflog @args }

# remote
function gr    { git remote @args }
function grv   { git remote --verbose @args }
function gra   { git remote add @args }
function grrm  { git remote remove @args }
function grmv  { git remote rename @args }
function grset { git remote set-url @args }
function grup  { git remote update @args }

# reset
function grh   { git reset @args }
function gru   { git reset -- @args }
function grhh  { git reset --hard @args }
function grhk  { git reset --keep @args }
function grhs  { git reset --soft @args }
function groh  { git reset origin/$(git_current_branch) --hard }
function gpristine { git reset --hard; git clean --force -dfx }
function gwipe { git reset --hard; git clean --force -df }

# restore
function grs   { git restore @args }
function grss  { git restore --source @args }
function grst  { git restore --staged @args }

# revert
function grev  { git revert @args }

# rm
function grm   { git rm @args }
function grmc  { git rm --cached @args }

# show
function gsh   { git show @args }
function gsps  { git show --pretty=short --show-signature @args }

# shortlog
function gcount { git shortlog --summary -n @args }

# stash
function gstall { git stash --all @args }
function gstu  { git stash --include-untracked @args }
function gstaa { git stash apply @args }
function gstc  { git stash clear @args }
function gstd  { git stash drop @args }
function gstl  { git stash list @args }
function gstp  { git stash pop @args }
function gsta  { git stash push @args }
function gsts  { git stash show --patch @args }

# status
function gst   { git status @args }
function gss   { git status --short @args }
function gsb   { git status --short -b @args }

# submodule
function gsi   { git submodule init @args }
function gsu   { git submodule update @args }

# switch
function gsw   { git switch @args }
function gswc  { git switch -c @args }
function gswd  { git switch $(git_develop_branch) }
function gswm  { git switch $(git_main_branch) }

# tag
function gta   { git tag --annotate @args }
function gts   { git tag -s @args }
function gtv   { git tag | Sort-Object }

# update-index
function gignore   { git update-index --assume-unchanged @args }
function gunignore { git update-index --no-assume-unchanged @args }

# worktree
function gwt   { git worktree @args }
function gwtls { git worktree list @args }
function gwtmv { git worktree move @args }
function gwtrm { git worktree remove @args }

# misc
function grt   { Set-Location (git rev-parse --show-toplevel 2>$null ?? '.') }
function gunwip {
    $msg = git log --max-count=1 --format="%s" HEAD
    if ($msg -match '--wip--') { git reset 'HEAD~1' }
}
function gwip {
    git add -A
    git rm (git ls-files --deleted 2>$null) 2>$null
    git commit --no-verify --message '--wip-- [skip ci]'
}

# ========== Bat ==========
$env:BAT_THEME = "Catppuccin Mocha"
function cat { bat -pp @args }

# ========== Go ==========
if (Get-Command go -ErrorAction SilentlyContinue) {
    $env:GOPATH = (go env GOPATH)
    $env:GOBIN = "$env:GOPATH\bin"
    $env:PATH += ";$env:GOBIN"
    $env:GOOS = "windows"
    $env:GOARCH = "amd64"
}

# ========== Rust ==========
$env:RUSTUP_HOME = "$env:USERPROFILE\.rustup"
$env:CARGO_HOME = "$env:USERPROFILE\.cargo"
$env:PATH += ";$env:CARGO_HOME\bin"

# ========== Custom scripts ==========
$env:PATH += ";$env:USERPROFILE\.dotfiles\scripts\utils\bin"

# ========== Tokens ==========
$tokensPath = "$env:USERPROFILE\.tokens.ps1"
if (Test-Path $tokensPath) {
    . $tokensPath
}

# ========== gh Copilot ==========
if (Get-Command gh -ErrorAction SilentlyContinue) {
    if (gh extension list 2>$null | Select-String 'github/gh-copilot') {
        Invoke-Expression (gh copilot alias -- pwsh | Out-String)
    }
}

$env:EDITOR = "nvim"
