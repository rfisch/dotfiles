export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
plugins=(git mercurial mercurial-mq rmd ss)

source "$ZSH/oh-my-zsh.sh"
source "$HOME/.slimzsh/slim.zsh"
prompt_newline='%666v'
PROMPT='%F{white}%* '$PROMPT
PROMPT=" $PROMPT"

if [[ ${OSTYPE} =~ "darwin" ]]; then
  # show / hide hidden files
  alias showfiles="defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app"
  alias hidefiles="defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app"

  # list
  alias ls="ls -G"
fi

if [[ ${OSTYPE} == "linux-gnu" ]]; then
  # list
  alias ls="ls --color"
fi

# list
alias ll="ls -alHF"

# grep
alias egrep="egrep --color"
alias fgrep="fgrep --color"
alias grep="grep --color"

# file utils
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
alias ln="ln -i"

# rake
alias rake="noglob rake"

# mercurial
alias qq="hg qseries -s"
alias qmove="hg qpush --move"
alias udn="hg blame -udn"
alias vpr="hg log -vpr"

# tmux
alias hack="tmux a -t hack || tmux new -s hack"

# lazy
alias fucking="sudo"

# rbenv
if command -v rbenv &>/dev/null; then
  [[ ":$PATH:" != *":$HOME/.rbenv/shims:"* ]] && eval "$(rbenv init -)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -d /usr/local/opt/python@2/bin ] && PATH="/usr/local/opt/python@2/bin:$PATH"
