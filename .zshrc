# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pod/.zshrc'

autoload -Uz compinit zrecompile
compinit
# End of lines added by compinstall

# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

# Oh my zsh settings
ZSH=$HOME/.oh-my-zsh
SOLARIZED_THEME="dark"
ZSH_THEME="blinks"
DISABLE_AUTO_UPDATE="true"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# PATHS
export PATH=~/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/opt/rabbitmq/sbin/:$PATH

# Aliases
alias ls='ls -F -G'
alias ll='ls -lah -G --color'
alias lt='ls -laht -G --color'
alias grep='grep --color=auto'
alias tree='tree -C'
alias -s log="less -M"
alias -s html="chromium-browser"
alias gdiff='git diff --color'
alias glog='git log --stat --color'
alias tmux="TERM=screen-256color-bce tmux -2"
alias g="git status -sb"
alias gk="gitk --all"
alias vim="nvim"
alias gg="git graph"

zsh_cache=${HOME}/.zsh/cache
mkdir -p $zsh_cache

if [ $UID -eq 0 ]; then
    compinit
else
    compinit -d $zsh_cache/zcomp-$HOST

    for f in ~/.zshrc $zsh_cache/zcomp-$HOST; do
        zrecompile -p $f && rm -f $f.zwc.old
    done
fi

export FCEDIT=nvim
