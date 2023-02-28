PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/opt/cuda/bin:/opt/cuda/nsight_compute:/opt/cuda/nsight_systems/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/var/lib/snapd/snap/bin:$HOME/.local/bin"

# ================ ENV =============== #

XDG_CONFIG_HOME="$HOME/.config"
XDG_CACHE_HOME="$HOME/.cache"
XDG_DATA_HOME="$HOME/.local/share"
XDG_STATE_HOME="$HOME/.local/state"

EIDTOR=nvim

# ======= ZSH config ======= #

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

setopt auto_cd HIST_IGNORE_SPACE
unsetopt beep extendedglob nomatch notify

# ======= Keybind configuration ======= #

bindkey "^[[H" beginning-of-line  # Home / Inicio
bindkey "^[[F" end-of-line        # End / Fin
bindkey "^[[1;5C" forward-word    # Ctr + Right
bindkey "^[[1;5D" backward-word   # Ctr + Left
bindkey "^[[3~" delete-char       # Supr
bindkey "^H" backward-delete-word # Ctr + Return

# ======= Nvm config ======= #

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
source /usr/share/nvm/init-nvm.sh

# ======= Plugins ======= #

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-sudo.zsh

# ======= Prompt ======= #

PROMPT="%B%F{200}%n%f %F{7}on%f %F{39}%~%f%b %(?..%B%F{red}%? %f%b) "

# ======= Aliases ======= #

alias sudo='sudo '

alias ls='/bin/lsd -l --group-dirs=first'
alias la='/bin/lsd -la --group-dirs=first'

alias cat='/usr/bin/bat --pager ""'
alias catn='/usr/bin/bat'

alias vi='/usr/bin/nvim'
alias vim='/usr/bin/nvim'

alias py='python3'
alias py38='/usr/bin/python3.8'
alias python38='/usr/bin/python3.8'

alias pm='pnpm'

alias ..='cd ..'

alias update-mirrors='sudo reflector --save /etc/pacman.d/mirrorlist --sort rate --verbose --connection-timeout 1 -f 10 -cES,PT,FR,DE,LU,BE,HR,CZ,DK,EE,FI'

alias pvpn='protonvpn-cli'

# ======= Functions ======= #

extract() {
  if [ -f $1 ]; then
    case $1 in
    *.tar.bz2) tar xjf $1 ;;
    *.tar.gz) tar xzf $1 ;;
    *.bz2) bunzip2 $1 ;;
    *.rar) rar x $1 ;;
    *.gz) gunzip $1 ;;
    *.tar) tar xf $1 ;;
    *.tbz2) tar xjf $1 ;;
    *.tgz) tar xzf $1 ;;
    *.zip) unzip $1 ;;
    *.Z) uncompress $1 ;;
    *.7z) 7z x $1 ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

gitc() {
  if [ $# -eq 0 ]; then
    echo "Specify a commit name"
    return 1
  fi
  git add .
  git status
  git commit -m $1
  git push
}

# ======= PNPM ======= #
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
