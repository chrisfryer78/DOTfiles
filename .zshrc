autoload -U compinit promptinit
compinit
promptinit

DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt autopushd pushdsilent pushdtohome

## Remove duplicate entries
setopt pushdignoredups

## This reverts the +/- operators.
setopt pushdminus

setopt autocd
setopt correctall

autoload -U colors && colors

PROMPT="%{$fg_bold[red]%}%* %{$reset_color%}%n@%{$fg_bold[blue]%}%M %# %{$reset_color%}%"
RPROMPT="%{$fg_bold[green]%}%0~%{$reset_color%}% %(?,%{$fg_bold[blue]%}:%)%{$reset_color%},%{$fg_bold[blue]%}:(%{$reset_color%})"

setopt HIST_IGNORE_DUPS

source /etc/zsh_command_not_found

# .zshrc
## History
HISTFILE=$HOME/.zsh_history       # enable history saving on shell exit
setopt APPEND_HISTORY          # append rather than overwrite history file.
HISTSIZE=1200                  # lines of history to maintain memory
SAVEHIST=1000                  # lines of history to maintain in history file.
setopt HIST_EXPIRE_DUPS_FIRST  # allow dups, but expire old ones when I hit HISTSIZE
setopt EXTENDED_HISTORY        # save timestamp and runtime information

/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias "ls=ls --color=auto"
