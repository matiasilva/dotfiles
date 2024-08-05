alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias grep='grep --color=auto'

## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

# git aliases
alias gl='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cgreen\\ [%cn]" --decorate --date=short'
alias gs='git status'
alias gp='git push'
alias gpr='git pull --rebase'
alias gc='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gb="git for-each-ref --sort='-authordate' --format='%(authordate)%09%(objectname:short)%09%(refname)' refs/heads | sed -e 's-refs/heads/--'"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files -u'
  export FZF_DEFAULT_OPTS='-m'
fi
