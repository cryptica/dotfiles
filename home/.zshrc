#
# Options for zsh
# 

export HISTFILE=~/.zsh_history
export HISTSIZE=50000
export SAVEHIST=50000
eval `dircolors -b`

# Load modules
autoload -U compinit && compinit
autoload -U zmv
autoload -U colors && colors
autoload -U url-quote-magic && zle -N self-insert url-quote-magic
autoload -U zsh/pcre
autoload -U select-word-style && select-word-style bash

# Set options
setopt correct
setopt extended_glob
setopt menu_complete
setopt complete_in_word
setopt inc_append_history
setopt share_history
setopt autocd
setopt auto_pushd
setopt beep

#
# Export variables
#

# Prompts
prompt_left="%{$fg_bold[blue]%}%n%{$reset_color%}@\
%{$fg_bold[blue]%}%m%{$reset_color%}:\
%{$fg[blue]%}%1~%{$reset_color%}"
prompt_right="%{$fg[green]%}%~%{$reset_color%}"
export PS1="$prompt_left\$ "
export PS2="$prompt_left%# "
export PS3="$prompt_left%% "
export RPS1=$prompt_right
export RPS2=$prompt_right
export RPS3=$prompt_right
export SPROMPT="Correct $fg[red]%R$reset_color to $fg[green]%r$reset_color? (yes, no, abort, edit) "

# Path
export PATH=$PATH:$HOME/bin

# Preferred programs
export EDITOR="vim"
export BROWSER="firefox"

# Export uim variables
export GTK_IM_MODULE="uim"
export QT_IM_MODULE="uim"
export XMODIFIERS=@im="uim"

# Export term (needed for correct colors in tmux)
export TERM="xterm-256color"

#
# Keybindings
# 

# emacs keys
bindkey -e

# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
bindkey "^i" expand-or-complete-prefix
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

#
# Stuff to make my life easier
#

# completion
zstyle ':completion:*' menu select

# allow approximate
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# tab completion for PID :D
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' command 'ps --forest -e -o pid,user,tty,cmd'

#
# Aliases
#

# Normal aliases
alias ls='ls --color=auto -F'
alias ll='ls -la'
alias lh='ls -lah'
alias mv="mv -i"
alias cp="cp -i"
alias sudo='sudo -E'
alias vim='vim -p'

# command L equivalent to command |less
alias -g L='|less' 

# command S equivalent to command &> /dev/null &
alias -g S='&> /dev/null &'

#
# Functions
#

function title {
  if [[ -n $TMUX ]]; then
    print -Pn "\033k$1\033\\"
  fi
  print -Pn "\e]2;$2\a"
}

function precmd {
  title "%1~" "%~"
}

function preexec {
  title "${1%% *}" "$1"
}
