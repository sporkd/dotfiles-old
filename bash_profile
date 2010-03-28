if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

. ~/.paths
. ~/.bash/config
. ~/.aliases
. ~/.zsh/aliases
. ~/.bash/aliases
. ~/.bash/completions

if [ -f ~/.distro ]; then
  . ~/.distro
fi

if [ -f ~/.personal ]; then
  . ~/.personal
fi

if [ -f ~/.local ]; then
  . ~/.local
fi

# Ruby Version Manager
if [[ -s ~/.rvm/scripts/rvm ]]; then
  . ~/.rvm/scripts/rvm
fi
