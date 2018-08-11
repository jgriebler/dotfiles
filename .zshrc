# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/johannes/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# disabled in favour of powerline
#
# autoload -Uz colors && colors
# autoload -Uz vcs_info
# 
# zstyle ':vcs_info:*' enable git hg svn
# zstyle ':vcs_info:*' formats "%F{235}%K{235} %F{magenta}%b %F{233}%k %F{yellow}%s%f"
# zstyle ':vcs_info:*' actionformats "%F{237}%K{237} %F{red}%a %F{235}%K{235} %F{magenta}%b %F{233}%k %F{yellow}%s%f"
# 
# setopt prompt_subst
# function precmd {
# 	vcs_info
# }
# 
# PROMPT='%(!.%F{red}.%F{cyan})%K{237} %B%n%b %F{237}%K{235} %F{yellow}%~ %F{235}%k%f '
# RPROMPT='${vcs_info_msg_0_}'

PYTHON_PACKAGES=$(python -c "import site; print(site.getsitepackages()[0])")

POWERLINE_ZSH=$PYTHON_PACKAGES/powerline/bindings/zsh

if [[ $(tty) == /dev/pts/* ]] && [[ -r $POWERLINE_ZSH/powerline.zsh ]]; then
	powerline-daemon -q
	source $POWERLINE_ZSH/powerline.zsh
fi

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export CUPS_SERVER="localhost"
export EDITOR="vim"

PATH="$HOME/.cargo/bin:$HOME/.local/bin:/usr/bin/core_perl:/usr/bin"

TERM=xterm-termite

# new keyboard doesn't have separate menu key
# setxkbmap -option "compose:menu"

# define aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo
terminal || echo error)" "$(history|tail -n1|sed -e
'\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias nano='nano -w'
alias emacs='emacs -nw'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -C'
alias la='ls -A'
alias ll='ls -al'
alias ls='ls --color=auto'

eval $(dircolors -b)

# key bindings, confirmed to work
# other bindings are copied
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

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
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# load autocompletion for exercism CLI
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
  source ~/.config/exercism/exercism_completion.zsh
fi
