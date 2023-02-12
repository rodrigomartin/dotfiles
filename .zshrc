# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# load fzf
if type fzf >/dev/null; then
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    source /usr/share/doc/fzf/examples/completion.zsh
fi

# Use vim keybindings
bindkey -v
bindkey -s jj '\e'
bindkey jj vi-cmd-mode

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme

export EDITOR="/usr/bin/vim"
export TMPDIR="/tmp"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
if type batcat >/dev/null; then
    alias cat=batcat
fi
if type nvim >/dev/null; then
    alias v=nvim
fi
if type lsd >/dev/null; then
    alias l='lsd --group-dirs=first'
    alias ls='l'
    alias ll='l -l'
    alias la='l -a'
    alias lla='l -la'
fi
alias ..='goBackTo'

# Go back in your steps (directories) 
function goBackTo {
    local dirname=${1:-'..'}
    dirname=$(pwd | grep -o ".*${dirname}/")
    cd $dirname
}

# completions
function list_dirs {
    echo $(pwd) | awk -F/ '{ for(i=1; i<=NF; i++) print $i }'
}

complete -F list_dirs goBackTo
