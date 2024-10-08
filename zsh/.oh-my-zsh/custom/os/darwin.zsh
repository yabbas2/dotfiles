# ZSH config for mac

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
PATH=$PATH:$(ruby -e 'puts Gem.bindir')

alias ls='colorls'
