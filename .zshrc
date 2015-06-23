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

autoload -U colors && colors
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git hg svn
zstyle ':vcs_info:*' formats "%F{yellow}%s%f:%F{magenta}%b%f"
zstyle ':vcs_info:*' actionformats "(%a) %F{yellow}%s%f:%F{magenta}%b%f"

setopt prompt_subst
function precmd {
	if [ -d ".git" -o -d ".hg" -o -d ".svn" ]; then
		vcs_info
		if [ -d ".git" ]; then
			vcs=' git'
		elif [ -d ".hg" ]; then
			vcs=' hg'
		else
			vcs=' svn'
		fi
	else
		vcs_info_msg_0_=''
		vcs=''
	fi
	RPROMPT='${vcs_info_msg_0_}'
}

PROMPT='%F{cyan}%n%f%# '

export EDITOR="vim"

PATH="/usr/local/sbin:/usr/local/bin:/usr/bin"
GEM_VERSIONS="`ls $HOME/.gem/ruby`"
PATH="$HOME/.gem/ruby/`echo $GEM_VERSIONS | sort -rV | head -n 1`/bin:$PATH"
PATH="$HOME/.cabal/bin:$PATH"
PATH="$HOME/Programs/bin:$PATH"

# new keyboard doesn't have separate menu key
# setxkbmap -option "compose:menu"

# define aliases
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo
terminal || echo error)" "$(history|tail -n1|sed -e
'\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias egrep='egrep --color=auto'
alias emacs='emacs -nw'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias l='ls -C'
alias la='ls -A'
alias ll='ls -al'
alias ls='ls --color=auto'
alias nano='nano -w'

eval $(dircolors -b)

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
