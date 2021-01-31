HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

zstyle :compinstall filename '/home/johannes/.zshrc'

autoload -Uz compinit colors vcs_info
compinit
colors

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export CUPS_SERVER="localhost"
export EDITOR="nvim"

PATH="$HOME/.cargo/bin:$HOME/.local/bin:/usr/bin/core_perl:/usr/bin"

setopt hist_ignore_dups
setopt prompt_subst

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' formats "%F{yellow} %b%f"
zstyle ':vcs_info:*' actionformats "%F{red}%a%f %F{yellow} %b%f"

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

export FZF_DEFAULT_COMMAND='fd --type file --color always'
export FZF_DEFAULT_OPTS='--ansi'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

PS1='%B%n%F{black}@%m%f %F{blue}%3~%f %#%b '
RPS1='${vcs_info_msg_0_}'

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
