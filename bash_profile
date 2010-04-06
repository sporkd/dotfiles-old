if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

. ~/.paths
. ~/.bash/config
. ~/.aliases
. ~/.zsh/aliases
. ~/.bash/aliases
. ~/.bash/completions

if [ -f ~/.distrorc ]; then
  . ~/.distrorc
fi

if [ -f ~/.privaterc ]; then
  . ~/.privaterc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# Ruby Version Manager
if [[ -s ~/.rvm/scripts/rvm ]]; then
  . ~/.rvm/scripts/rvm
fi
