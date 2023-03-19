# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Some .bashrc settings
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' ''
zstyle :compinstall filename '/home/bdp/.zshrc'

export PATH=$PATH:~/.local/bin/

export EDITOR=/usr/bin/vim
export ED=/usr/bin/vim
export VISUAL=/usr/bin/vim

export VIMRC_F=~/.vim/vimrc
export ZSHRC_F=~/.zshrc
export TMUXRC_F=~/.tmux.conf

setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

alias py=python

function vimfh {
    vim $(fzfh)
}

function vimf {
    vim $(fzf)
}

function fzfh {
    find . | fzf
}

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# bindkey -v
# End of lines configured by zsh-newuser-install
# echo ~/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
# echo ~/.powerlevel10k/powerlevel10k.zsh-theme
if [[ -f "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh" ]]; then
    source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
else
    source ~/.zsh-vi-mode/zsh-vi-mode.plugin.zsh
fi
if [[ -f "/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" ]]; then
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
else
    source ~/.powerlevel10k/powerlevel10k.zsh-theme
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
